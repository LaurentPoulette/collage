<?php
include 'info.php';




function init()
{
    global $form;
    global $idActeur;
    
    $rs=getRS("select start,stop from acteur where id=".$idActeur);

    

    if (count($rs)>0)
    {

      
        return getListe();
    }
    else
    {
        return ['err'=>1,'msg'=>'erreur de connexion'];
    }  
}


function users()
{

    return getRS("select id,nom from acteur");
    
}


function villes()
{

    return getRS("select id,nom  from ville order by nom");
    
}


function circuits()
{

    return getRS("select id,nom  from circuit order by nom");
    
}

function acteurs()
{

    $rs= getRS("select *  from acteur order by nom");
    for($i=0;$i<count($rs);$i++)
    {
        $idActeur=$rs[$i]['id'];
        $iti=itiActeur($idActeur);
        $rs[$i]['nb']=$iti[0]['nb'];
        $rs[$i]['done']=$iti[0]['done'];


    }
    

    return $rs;
    
}

function itiActeur($idActeur)
{

    return getRS("select sum(case when statut=1 then 1 else 0 end) as done,count(*) as nb from panneau_acteur where acteur_id=".$idActeur);
    
}


function liste_panneau()
{

    global $form;
    $type=0;
    $sqlWhere=" where 1=1 ";

    $last=$form['last'];

    $sql="select 0 as statut_iti,p.*,v.nom as ville,case when p.nom='' then adresse else p.nom end as nom_aff from panneau p join ville v on v.id=p.id_ville ";
    if ($form['parcours']=='ville')
    {
        $lstVille='-1';
        foreach($form as $key=>$value)
        {
            $tKey=explode('_',$key);
            if (($tKey[0]=='ville') &&($value==1))
            {
                $lstVille.=','.$tKey[1];
            }
        }

        if ($lstVille!='-1,-2')
        {
            $sqlWhere.=" and id_ville in (".$lstVille.")";
        }
        
    } else
    {
        $lstCircuit='-1';
        foreach($form as $key=>$value)
        {
            $tKey=explode('_',$key);
            if (($tKey[0]=='circuit') &&($value==1))
            {
                $lstCircuit.=','.$tKey[1];
            }
        }
        $sql.=" join panneau_circuit c on c.id_panneau=p.id and c.id_circuit in (".$lstCircuit.")";
    }


    
    if ($form['mode']=='officiels') $sqlWhere.=" and officiel='TRUE'";
    if ($form['mode']=='libres') $sqlWhere.=" and officiel<>'TRUE'";


    if ($last>0)
    {
        $sqlWhere.=" and case when p.last is null then 100 else left(timediff(now(),p.last),3)*1 end  > $last ";  
    }
    $sql.=$sqlWhere.' and p.statuscode=1 order by pos';  
   // echo $sql;
    //var_dump($form);
    //var_dump($sql);

    $rs= getRS($sql);


    global $idActeur;
    cancel_iti();


    
    $ordre=0;
    
    foreach($rs as $p)
    {
        
            $ordre=$ordre+1;
            $sql="insert into panneau_acteur (acteur_id,panneau_id,ordre) values (".$idActeur.",".$p['id'].",".$ordre.")";
            getExecute($sql);
        
        
    }

    
    return getListe();
    
}

function cancel_iti()
{
    global $idActeur;
    getExecute("delete from panneau_acteur where acteur_id=".$idActeur);
    getExecute("update acteur set route='' where id=".$idActeur);
    return true;
}


function optimisation()
{
    global $form;
    //var_dump($form);

    $tab=[];
    $tab['vehicles']=[];
    $tab['vehicles'][]=
        ["id"=>1,
        "start"=>[floatval($form['start']['lng']),floatval($form['start']['lat'])],
        "stop"=>[floatval($form['stop']['lng']),floatval($form['stop']['lat'])]
        ];



        //var_dump( $tab);        
    $tab['jobs']=[];

    foreach ($form['panneaux'] as $p)
    {
        $t=explode(",",$p['coord']);
        $tab['jobs'][]=
            [
                "id"=> intval(  $p['id']),
                "location"=>[floatval($t[1]),floatval($t[0])]

            ];
    }

    //var_dump( $form);
    //var_dump( $tab);



    
    $url="http://solver.vroom-project.org/";
    $ch = curl_init( $url );
    # Setup request to send json via POST.
    //$payload = json_encode( array( "customer"=> $data ) );


    $payload= json_encode($tab);

    //echo $payload;

    curl_setopt( $ch, CURLOPT_POSTFIELDS, $payload );
    if (strpos($_SERVER['SERVER_ADDR'],'127.0.0.')!==false)
    {
        file_put_contents('v_in.json',$payload);
    }
    
    curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
    # Return response instead of printing.
    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
    # Send request.
    $result = curl_exec($ch);

//if ($result===false)   echo 'Curl error: ' . curl_error($ch);



    curl_close($ch);
    # Print response.
    
    if (strpos($_SERVER['SERVER_ADDR'],'127.0.0.')!==false)
    {
        file_put_contents('v_out.json',$result);
    }
    $tab=json_decode($result,true);

//    var_dump($tab);

    global $idActeur;
    //getExecute("delete from panneau_acteur where acteur_id=".$idActeur);
    $sum=$tab['summary'];
    $jSum=json_encode($sum);

    getExecute("update acteur set route='". str_replace("'","''",$jSum)."' where id=".$idActeur);


    
    $ordre=0;
    foreach($tab['routes'][0]['steps'] as $p)
    {
        if ($p['type']=='job')
        {
            $ordre=$ordre+1;
            //$sql="insert into panneau_acteur (acteur_id,panneau_id,ordre) values (".$idActeur.",".$p['id'].",".$ordre.")";

            $sql="update panneau_acteur set ordre=".$ordre." where acteur_id=".$idActeur." and panneau_id=".$p['id'];
            getExecute($sql);
        }
        
    }

  return getListe();


}

function getListe()
{
    global $form;
    global $idActeur;


    $rs=getRS("select id,nom,start,stop from acteur where id=".$idActeur);
    
    if (count($rs)>0)
    {
        $pos=['start'=>$rs[0]['start'],'stop'=>$rs[0]['stop']];


        $sql="select a.statut as statut_iti,case when p.last is null then 100 else left(timediff(now(),p.last),3)*1 end as heures,   p.*,v.nom as ville,case when p.nom='' then adresse else p.nom end as nom_aff from panneau p join ville v on v.id=p.id_ville 
        join panneau_acteur a on a.panneau_id=p.id and a.acteur_id=".$idActeur."
          and p.statuscode=1 order by a.ordre";
        
        $rs= getRS($sql);

        $rsActeur=getRS("select route from acteur where id=".$idActeur);
        return ['err'=>0,'msg'=>'','pos'=>$pos,'data'=>$rs,'route'=>$rsActeur[0]['route']];
    }
    else
    {
        return ['err'=>1,'msg'=>"Acteur non défini"];
    }
    
}



function checkPanneau()
{
    global $form;
    
    global $idActeur;

    $idPanneau=$form['idPanneau'];
    
    $sql="update panneau_acteur set statut=1 where acteur_id=".$idActeur." and panneau_id=".$idPanneau;
    getExecute($sql);

    
    journal($idActeur,$idPanneau,"check");

    $sql="update panneau set last=now() where id=".$idPanneau;
    getExecute($sql);

    $sql="select a.statut as statut_iti,p.*,v.nom as ville,case when p.last is null then 100 else left(timediff(now(),p.last),3)*1 end as heures,case when p.nom='' then adresse else p.nom end as nom_aff from panneau p join ville v on v.id=p.id_ville 
    join panneau_acteur a on a.panneau_id=p.id and a.acteur_id=".$idActeur."
    order by a.ordre";
$rs= getRS($sql);
return ['err'=>0,'msg'=>'','data'=>$rs];

}

function uncheckPanneau()
{
    global $form;
    
    global $idActeur;

    $idPanneau=$form['idPanneau'];
    
    journal($idActeur,$idPanneau,"uncheck");

    $sql="update panneau set last=null where id=".$idPanneau;
    getExecute($sql);

    $sql="select a.statut as statut_iti,p.*,v.nom as ville,case when p.last is null then 100 else left(timediff(now(),p.last),3)*1 end as heures,case when p.nom='' then adresse else p.nom end as nom_aff from panneau p join ville v on v.id=p.id_ville 
    join panneau_acteur a on a.panneau_id=p.id and a.acteur_id=".$idActeur."
    order by a.ordre";
$rs= getRS($sql);
return ['err'=>0,'msg'=>'','data'=>$rs];

}



function setStart()
{
    global $form;
    global $idActeur;
    

    $pos=$form['lat'].','.$form['lng'];
    
    $sql="update acteur set start='".$pos."' where id=".$idActeur;;
    getExecute($sql);
    return ['err'=>0,'msg'=>''];
}

function setStop()
{
    global $form;
    global $idActeur;
    
    $pos=$form['lat'].','.$form['lng'];
    
    $sql="update acteur set stop='".$pos."' where id=".$idActeur;;
    getExecute($sql);
    return ['err'=>0,'msg'=>''];
}




function ajusterPanneau()
{
    global $form;
    
    global $idActeur;

    $idPanneau=$form['idPanneau'];
    $coord=$form['coord'];
    
    journal($idActeur,$idPanneau,"position");

    $sql="update panneau set coord='".$coord."' where id=".$idPanneau;
    getExecute($sql);

    $sql="select a.statut as statut_iti,p.*,v.nom as ville,case when p.last is null then 100 else left(timediff(now(),p.last),3)*1 end as heures,case when p.nom='' then adresse else p.nom end as nom_aff from panneau p join ville v on v.id=p.id_ville 
    join panneau_acteur a on a.panneau_id=p.id and a.acteur_id=".$idActeur."
    order by a.ordre";
$rs= getRS($sql);
return ['err'=>0,'msg'=>'','data'=>$rs];

}


function journal($idActeur,$idPanneau,$info)
{
    $info=str_replace("'","''",$info);
    $sql="insert into journal (panneau_id,acteur_id,info) values (".$idPanneau.",".$idActeur.",'".$info."')";
    getExecute($sql);
}


function newPanneau(){
    global $form;
    
    global $idActeur;

    $id= $form['id'];
    $nom= str_replace("'","''", $form['nom']);
    
    $officiel=$form['officiel']? 'TRUE':'FALSE';
    $present=$form['present']? 1:0;
    $id_ville=$form['id_ville'];
    $coord=$form['coord'];
    
    //journal($idActeur,$idPanneau,"position");

    if ($id==-1)
    {
        $sql="insert into panneau (adresse,nom,officiel,id_ville,coord,statuscode) values ('".$nom."','".$nom."','".$officiel."',".$id_ville.",'".$coord."',".$present.")";
    }
    else{
        $sql="update panneau set adresse='".$nom."',nom='".$nom."',officiel='".$officiel."',id_ville=".$id_ville.",coord='".$coord."',statuscode=".$present." where id=".$id;
    }
  //  echo $sql;
    getExecute($sql);

    $sql="select a.statut as statut_iti,p.*,v.nom as ville,case when p.last is null then 100 else left(timediff(now(),p.last),3)*1 end as heures,case when p.nom='' then adresse else p.nom end as nom_aff from panneau p join ville v on v.id=p.id_ville 
    join panneau_acteur a on a.panneau_id=p.id and a.acteur_id=".$idActeur."
    order by a.ordre";
$rs= getRS($sql);
return ['err'=>0,'msg'=>'','data'=>$rs];
}



function newVille(){
    global $form;
    
    

    
    $nom= str_replace("'","''", $form['nom']);
        $sql="insert into ville (nom) values ('".$nom."')";
        getExecute($sql);
    
$rs= villes();
return ['err'=>0,'msg'=>'','data'=>$rs];
}



function newIti(){
    global $form;
    
    

    
    $nom= str_replace("'","''", $form['nom']);

    $sql="insert into circuit (nom) values ('".$nom."')";
    getExecute($sql);
    $sql="select id from circuit where nom='".$nom."'";
    $rs= getRS($sql);
    $id_iti=$rs[0]['id'];


    $lst=str_replace("'","''", $form['lst']);
    $lst=explode(",",$lst);
    foreach($lst as $id_panneau)
    {
        $sql="insert into panneau_circuit (id_panneau,id_circuit) values (".$id_panneau.",".$id_iti.")";
        getExecute($sql);
    }
        
    return $id_iti;

}
