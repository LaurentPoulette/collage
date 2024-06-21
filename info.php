<?php 



if (strpos($_SERVER['SERVER_ADDR'],'127.0.0.')===false)
{
    $serveur='127.0.0.1';
    $port='3306';
    $user='root';
    $pwd='P&wP&w2001';
    $db='collage';
}
else
{

    $serveur='127.0.0.1';
    $port='3000';
    $user='root';
    $pwd='root';
    $db='collage';
}


if (strpos($_SERVER['SCRIPT_FILENAME'],'collage2')!==false)
{
    $db='collage2';
}

$debug=false;

if (!isset($_SESSION))
{
    SESSION_START();
}


function getRS($sql)
{
    global $serveur,
    $port,
    $user,
    $pwd,
    $db;

    dbg('sql',$sql);

    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    $mysqli = new mysqli($serveur, $user, $pwd, $db, $port);
    $mysqli->set_charset("utf8");
    $mysqli->real_query($sql);
    $result = $mysqli->use_result();

    $rs=$result->fetch_all(MYSQLI_ASSOC);
    if ($rs==null)
        return [];
    else
        return $rs;
    

}

function getExecute($sql)
{
    global $serveur,
    $port,
    $user,
    $pwd,
    $db;
    dbg('sql',$sql);
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
    $mysqli = new mysqli($serveur, $user, $pwd, $db, $port);
    $mysqli->set_charset("utf8");
    $mysqli->real_query($sql);
   
    

}

function dbg($t,$s)
{
    global $debug;
    global $form;
    global $idActeur;
    global $data;


    if ($debug)
    {
        echo $t." ==> ".$s."<br/>";
        var_dump($data );
    }
}
