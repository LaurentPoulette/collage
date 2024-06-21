var mapLoaded = false;
var panneaux = [];
var markers = [];
var markersPos = [];
var map;
var popup;
var curPos;
var posStart = null;
var posStop = null;
var curAction = '';
var curSuccsess = null;
var curError = null;
var realPos = null;
var curIdx = -1;
var bAutoPan = false;
var bLocating = false;
var route = null;
var tabSelect = [];



$(document).on("pagecontainershow", function () {
  ScaleContentToDevice();
});

$(window).on("resize orientationchange", function () {
  ScaleContentToDevice();
});

function hideChoix(bHide) {

  if (bHide) {
    $('#bBoucle').hide();
  }
  else {
    $('#bBoucle').show();
  }
}

function ScaleContentToDevice() {

  // scroll(0, 0);

  var content = $.mobile.getScreenHeight() - $(".ui-header").outerHeight() - $(".ui-footer").outerHeight() - $(".ui-content").outerHeight() + $(".ui-content").height();
  var content = $.mobile.getScreenHeight() - $(".ui-content").outerHeight() + $(".ui-content").height();


  $(".ui-content").height(content);

  var padding = ($(".ui-content").outerHeight() - $(".ui-content").height()) / 2 + 2;
  var tab = content - $(".ui-navbar").outerHeight() - padding;
  $(".ui-tabs-panel").height(tab);


}

function init() {


  document.getElementById('mode_ville').onclick = function () { $('#zone_ville').show(); $('#table_circuit').hide(); };
  document.getElementById('mode_circuit').onclick = function () { $('#zone_ville').hide(); $('#table_circuit').show(); };
  document.getElementById('bMap').onclick = function () { window.setTimeout(initMap, 100); };
  document.getElementById('bIti').onclick = function () { initIti() };






  document.getElementById('Boucle').style.overflowY = 'scroll';
  document.getElementById('Iti').style.overflowY = 'scroll';
  //document.getElementById('table_iti').style.overflowY = 'scroll';
  //document.getElementById('table_iti').style.height = '90%';

  //$('#bPanneau').hide();

  $('#Boucle input').click(listPanneau);
  $('#Boucle select').change(listPanneau);
  send('init', null, after_init, after_init);

  window.setInterval(autoPan, 1000);


}

function after_init(response) {

  if (response.err == 0) {


    hideChoix(isIti);
    $('#bMap').show();
    var pos = response.pos;

    if (pos['start'] != '') {
      t = pos['start'].split(',');
      posStart = { lat: t[0], lng: t[1] }
    }
    if (pos['stop'] != '') {
      t = pos['stop'].split(',');
      posStop = { lat: t[0], lng: t[1] }
    }

    listPanneau_after(response);

    $('#bMap a').each(function (index) {
      $(this).click();
    }
    )


  }
  else {
    alert(response.msg)
  }

}


function initMap() {


  if ($('#Map')[0].style.display != 'none') {

    L.Icon.Default.imagePath = 'leaflet/images/';
    var nbTrue = 0; var nbFalse = 0;
    var coord = [45.64939700471602, 0.1598302353428778];
    //var coord = panneaux[0]['coord'].replace(' ', '').split(",");

    if (!mapLoaded) {
      map = L.map('Map').setView([coord[0], coord[1]], 13);
      L.geolet({
        position: 'bottomleft'
      }).addTo(map, {
        autoPan: true
      }).activate();
      /*
          popup = L.popup().setContent('<p>Hello world!<br />This is a nice popup.</p>'); 
          map.on('contextmenu',function(){
            map.openPopup(popup);
        });
        */
      map.on('contextmenu', (e) => {
        L.popup()
          .setLatLng(e.latlng)
          .setContent('<table><tr><td><a href="#" onclick="setStart()">Départ</a>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href="#" onclick="setStop()">Arrivée</a>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href="#" onclick="newPanneau(-1)">Nouveau&nbsp;panneau</a>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table>')
          .addTo(map)
          .openOn(map);
        setCurPos(e.latlng);



      });

    }
    else {

      for (var i = 0; i < markers.length; i++) {
        map.removeLayer(markers[i]);
      }
      markers = [];

      for (var i = 0; i < markersPos.length; i++) {
        map.removeLayer(markersPos[i]);
      }
      markersPos = [];
      var popups = $(".leaflet-popup-close-button");
      for (var i = 0; i < popups.length; i++) {
        popups[i].click();
      }


    }



    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);




    for (var i = 0; i < panneaux.length; i++) {

      var coord = panneaux[i]['coord'].replace(' ', '').split(",");
      var icon = greenIcon;
      var officiel = (panneaux[i]['officiel'] == 'TRUE') ? 'Officiel' : 'Libre';
      //var nom = panneaux[i]["nom_aff"];
      var nom = panneaux[i]["ville"];
      var nom = panneaux[i]["nom_aff"] + '<br>' + panneaux[i]["ville"] + '<br>' + panneaux[i]["last"] + ' h=' + panneaux[i]["heures"];
      var popup = nom + ' ' + officiel;
      var statut = panneaux[i]['statut_iti'];
      var heures = panneaux[i]['heures'];

      var trancheHeure = 0;


      if (officiel == 'Officiel') {
        if (heures > 48) {
          trancheHeure = 1;
        }
        if (heures > 72) {
          trancheHeure = 2;
        }
        if (heures > 96) {
          trancheHeure = 3;
        }
      }
      else {
        if (heures > 8) {
          trancheHeure = 1;
        }
        if (heures > 24) {
          trancheHeure = 2;
        }
        if (heures > 48) {
          trancheHeure = 3;
        }
      }

      if (panneaux[i]["heures"].search('2023') != -1) {
        trancheHeure = 3;
      }

      if (statut == 0) {
        color = 'red';
        addClassList = 'list_todo';

      }
      if (statut == 1) {
        color = 'green';
        addClassList = 'list_done';
      }

      if (i == curIdx + 1) {
        if (statut == 0) {
          color = 'blue';
          addClassList = 'list_current';
        }
      else
        {
          curIdx = curIdx + 1;
        }
      }

      if (tabSelect.indexOf(panneaux[i]['id']) !== -1) {
        color = 'selected';
      }





      popup = "<table>";
      popup += "<tr><td colspan=4>" + panneaux[i]['id'] + '&nbsp;:&nbsp;' + nom.replace(/ /gi, '&nbsp;') + '&nbsp;(' + officiel + ')' + "</td></tr>";
      popup += "<tr><td ><a target='_blank' href='https://www.google.com/maps/dir//" + coord[0] + "," + coord[1] + "'>Y&nbsp;aller</a>&nbsp;&nbsp;&nbsp;</td>";
      popup += '<td >&nbsp;&nbsp;&nbsp;<a href="" onclick="checkPanneau(' + i + ',' + panneaux[i]['id'] + ',0)">Fait</a>&nbsp;&nbsp;&nbsp;</td>';
      popup += '<td >&nbsp;&nbsp;&nbsp;<a href="" onclick="uncheckPanneau(' + i + ',' + panneaux[i]['id'] + ',0)">KO</a>&nbsp;&nbsp;&nbsp;</td></tr>';
      popup += '<tr><td ><a href="" onclick="ajusterPanneau(' + i + ',' + panneaux[i]['id'] + ',0)">Ajuster&nbsp;position</a></td>';
      popup += '<td >&nbsp;&nbsp;&nbsp;<a href="" onclick="edit_panneau(' + i + ',' + panneaux[i]['id'] + ',0)">Editer</a></td></tr>';
      popup += '<tr><td><a href="" onclick="selection_panneau(' + i + ',' + panneaux[i]['id'] + ',0)">Sélection</a></td>';
      if (tabSelect.length > 0) {
        popup += '<td  colspan=2>&nbsp;&nbsp;&nbsp;<a href="" onclick="selection_save()">Enregistrer sélection</a></td>';
      }

      popup += '</tr></table>';







      //var icon = new L.TextIcon({ text: '<span class="numMarker numHeure_' + trancheHeure + '">' + (i + 1) + '</span>', color: color });


      instanceclass = '';
      var icon = L.divIcon({
        iconSize: null,
        html: '<div class="map-label bord_' + color + ' numHeure_' + trancheHeure + '"><div class="map-label-content">' + (i + 1) + '</div><div class="map-label-arrow"></div></div>'
      });

      try {

        /*
        panneaux[i].marker = L.marker([coord[0], coord[1]], { icon: icon }).addTo(map).bindPopup(popup);
        markers.push(panneaux[i].marker);
        */
        markers.push(L.marker([coord[0], coord[1]], { icon: icon }).addTo(map).bindPopup(popup));

      } catch (error) {
        console.log('erreur : ' + popup);
      }

    }


    //alert(nbTrue+'\n'+nbFalse);




    if (posStart != null) {
      instanceclass = '';
      var icon = L.divIcon({
        iconSize: null,
        html: '<div class="map-label ' + instanceclass + '"><div class="map-label-content">Départ</div><div class="map-label-arrow"></div></div>'
      });
      //posStart.marker = ;
      markersPos.push(L.marker([posStart.lat, posStart.lng], { icon: icon }).addTo(map));

    }
    if (posStop != null) {
      instanceclass = '';
      var icon = L.divIcon({
        iconSize: null,
        html: '<div class="map-label ' + instanceclass + '"><div class="map-label-content">Arrivée</div><div class="map-label-arrow"></div></div>'
      });
      //posStop.marker = ;
      markersPos.push(L.marker([posStop.lat, posStop.lng], { icon: icon }).addTo(map));

    }
    mapLoaded = true;
  }
  initIti();

}
function cancelIti() {
  if (confirm("êtes vous sur de vouloir sortir de cet itinéraire ?") == true) {
  
    send('cancel_iti', null, cancelIti_done, cancelIti_done)
    return false;
  }
}
function cancelIti_done() {
  document.location.reload();

}

function initIti() {


  sHtml = "";


  for (var i = 0; i < panneaux.length; i++) {

    var coord = panneaux[i]['coord'].replace(' ', '').split(",");
    var icon = greenIcon;
    var officiel = (panneaux[i]['officiel'] == 'TRUE') ? 'Officiel' : 'Libre';
    //var nom = panneaux[i]["nom_aff"];
    var nom = panneaux[i]["ville"];
    
    var popup = nom + ' ' + officiel;
    var statut = panneaux[i]['statut_iti'];
    var heures = panneaux[i]['heures'];

    var trancheHeure = 0;
    txtTranche='moins de 8h';
    if (heures > 8) {
      trancheHeure = 1;
      txtTranche='moins de 16h';
    }
    if (heures > 16) {
      trancheHeure = 2;
      txtTranche='moins de 24h';
    }
    if (heures > 24) {
      trancheHeure = 3;
      txtTranche='plus de 24h';
    }

    var nom = panneaux[i]["nom_aff"] + '<br>' + panneaux[i]["ville"] +' N°' + panneaux[i]['id']+ '<br>Dernier collage '+txtTranche;

    var addClassList = "";
    if (statut == 0) {
      color = 'grey';
      addClassList = 'list_todo';

    }
    if (statut == 1) {
      color = 'green';
      addClassList = 'list_done';
    }
    if (i == curIdx + 1) {
      addClassList = 'list_current';
    }




    sHtml += "<div class='" + addClassList + "'>";

    sHtml += "n°:"+(i + 1) + ' : ' + nom.replace(/ /gi, '&nbsp;') ;
    //sHtml += ' N°' + panneaux[i]['id'] + ' ' + panneaux[i]['heures'] + 'h)';

    sHtml +="<br/><a target='_blank' href='https://www.google.com/maps/dir//" + coord[0] + "," + coord[1] + "'>Y&nbsp;aller</a>&nbsp;&nbsp;&nbsp;";

    sHtml += '&nbsp;&nbsp;&nbsp;<a href="" onclick="checkPanneau(' + i + ',' + panneaux[i]['id'] + ',1)">Fait</a>&nbsp;&nbsp;&nbsp;';
    sHtml += '&nbsp;&nbsp;&nbsp;<a href="" onclick="edit_panneau(' + i + ',' + panneaux[i]['id'] + ',1)">Edit</a>&nbsp;&nbsp;&nbsp;';

    
    sHtml += '</div>';






  }

  $('#table_iti')[0].innerHTML = sHtml;
  //alert(nbTrue+'\n'+nbFalse);



}









function clickVille() {
  window.setTimeout(getCheckedVille, 10);
}

function getCheckedVille() {
  curIdx = -1;
  for (x in ville) {
    if (document.getElementById('ville_' + x).checked)
      ville[x] = true;
    else
      ville[x] = false;

  }
  window.setTimeout(listPanneau, 10);

}



function listPanneau() {
  send('liste_panneau', 'choix', listPanneau_after, listPanneau_after)
}
function listPanneau_after(response) {

  panneaux = response.data;

  try {
    route = JSON.parse(response.route);

    $('#infoNb')[0].innerHTML = 'Nb : ' + panneaux.length;
    $('#infoDuree')[0].innerHTML = 'Temps : ' + Math.round(route.duration / 100) + ' mn';
    $('#infoDistance')[0].innerHTML = 'Dist : ' + Math.round(route.distance / 1000) + 'km';
    $('#libIti')[0].innerHTML = 'Itinéraire (' + panneaux.length + ')';



  } catch (error) {
    $('#infoNb')[0].innerHTML = 'Nb : ' + panneaux.length;
    $('#infoDuree')[0].innerHTML = 'Temps : ?? mn';
    $('#infoDistance')[0].innerHTML = 'Dist : ?? km';
    $('#libIti')[0].innerHTML = 'Itinéraire (' + panneaux.length + ')';
  }


  initIti();

}



function send(action, src, onSuccess, onError, tabData) {


  curSuccsess = onSuccess;
  curError = onError;
  curAction = action;

  if (curSuccsess == null) {
    curSuccsess = defaultSuccess;
  }

  if (curError == null) {
    curError = defaultError;
  }

  if (src != null) {
    var f = {};


    $('#' + src + ' input, #' + src + ' select').each(
      function (index) {
        var input = $(this);
        var id = input.attr('id');
        var name = input.attr('name');
        var tag = input[0].tagName;
        var type = input.attr('type');



        if (type == 'checkbox') {
          if (input[0].checked) {
            f[id] = 1;
          }
        }
        else if (type == 'radio') {
          if (input[0].checked) {
            f[name] = input.val();
          }
        }
        else {
          value = input.val();
          f[id] = (value);
        }




        //alert('Type: ' + input.attr('type') + 'Name: ' + input.attr('name') + 'Value: ' + input.val());
      }
    );


  }
  else {
    if (tabData == null) {
      tabData = {};
    }
    var f = tabData;
  }

  f.idActeur = document.location.href.split('idActeur=')[1];



  var toSend = { action: action, form: f };

  json = btoa(JSON.stringify(toSend));

  $.ajax({
    type: "POST",
    url: 'data.php',
    dataType: 'json',
    data: { data: json },
    success: receive
  });

}

function receive(data) {
  if (data.err == 1) {
    curError(data);
  }
  else {
    curSuccsess(data);
  }

}

function defaultSuccess(data) {
  alert(data.msg);
}

function defaultError(data) {
  alert(data.msg);
}








function setCurPos(latlng) {
  curPos = latlng;

}
function setStart() {
  posStart = curPos;

  send('setStart', null, setStartStop_after, setStartStop_after, curPos);
}



function setStop() {
  posStop = curPos;
  send('setStop', null, setStartStop_after, setStartStop_after, curPos);

}

function setStartStop_after() {
  initMap();
}


function setItitneraireFromHere() {

  $("#table_iti")[0].innerHTML = "<div class='message'>en cours de calcul</div>";
  bLocating = true;
  var pos = navigator.geolocation.getCurrentPosition(setItitneraireFromHere_after, setItitneraireFromHere_error);


  /*
  navigator.geolocation.getCurrentPosition(function(location) {
    var latlng = new L.LatLng(location.coords.latitude, location.coords.longitude);
    alert(latlng);})
    */
}




function setItitneraireFromHere_after(pos) {

  bLocating = false;
  calcItineraire({ lat: pos.coords.latitude, lng: pos.coords.longitude }, { lat: pos.coords.latitude, lng: pos.coords.longitude });
}


function setItitneraireToEnd() {

  $("#table_iti")[0].innerHTML = "<div class='message'>en cours de calcul</div>";
  bLocating = true;
  var pos = navigator.geolocation.getCurrentPosition(setItitneraireToEnd_after, setItitneraireFromHere_error);


  /*
  navigator.geolocation.getCurrentPosition(function(location) {
    var latlng = new L.LatLng(location.coords.latitude, location.coords.longitude);
    alert(latlng);})
    */
}




function setItitneraireToEnd_after(pos) {

  bLocating = false;
  calcItineraire({ lat: pos.coords.latitude, lng: pos.coords.longitude }, posStop);
}




function setItitneraireFromHere_error(err) {
  bLocating = false;
  alert(err.message);

}


function setItitneraire() {
  $("#table_iti")[0].innerHTML = "<div class='message'>en cours de calcul</div>";
  calcItineraire(posStart, posStop);

}


function calcItineraire(start, stop) {
  hideChoix(true);
  var tab = [];
  for (var i = 0; i < panneaux.length; i++) {
    tab.push({ id: panneaux[i]['id'], coord: panneaux[i]['coord'] });
  }

  send('optimisation', null, setItitneraire_after, setItitneraire_after, { start: start, stop: stop, panneaux: tab });
}



function setItitneraire_after(response) {
  curIdx = -1;
  listPanneau_after(response);
  initMap();
}

function checkPanneau(idx, idPanneau, go) {
  if (!$("#cItiInverse")[0].checked) {
    curIdx = idx;
  }
  else {
    curIdx = idx - 2;
  }

  this.go = go;
  send('checkPanneau', null, checkPanneau_after, checkPanneau_after, { idPanneau: idPanneau })
  return true;
}


function uncheckPanneau(idx, idPanneau, go) {

  curIdx = idx;
  this.go = go;
  send('uncheckPanneau', null, checkPanneau_after, checkPanneau_after, { idPanneau: idPanneau })
  return true;
}

function checkPanneau_after(response) {
  listPanneau_after(response);
  //alert(response);
  //initMap();
  initMap();



  if (curIdx < markers.length - 1) {
    markers[curIdx + 1].openPopup();

    if (this.go == 1) {
      var coord = panneaux[curIdx + 1]['coord'].replace(' ', '').split(",");
      window.open("https://www.google.com/maps/dir//" + coord[0] + "," + coord[1]);
    }
  }








};

function ajusterPanneau(idx, idPanneau, go) {

  if (confirm("êtes vous sur de voloir ajuster la position de ce panneau ?") == true) {
    curIdx = idx;
    this.go = 0;
    bLocating = true;
    var pos = navigator.geolocation.getCurrentPosition(ajusterPanneau_after, setItitneraireFromHere_error);
  }



}
function ajusterPanneau_after(pos) {

  bLocating = false;
  var coord = pos.coords.latitude + ',' + pos.coords.longitude;
  var idPanneau = panneaux[curIdx]['id'];
  send('ajusterPanneau', null, ajusterPanneau_after2, ajusterPanneau_after2, { idPanneau: idPanneau, coord: coord })
}


function ajusterPanneau_after2(response) {
  listPanneau_after(response);
  //alert(response);
  initMap();
}

function newPanneau() {
  if (curPos != null) {

    $('#titreNewPanneau')[0].innerHTML = "Nouveau panneau";
    $('#newPanneauId')[0].value = -1;
    $('#newPanneauNom')[0].value = '';
    $('#newPanneauCoord')[0].value = curPos.lat + ',' + curPos.lng;

    $('#newPanneauOfficiel').attr("checked", false).checkboxradio("refresh");
    $('#newPanneauPresent').attr("checked", true).checkboxradio("refresh");

    el = $('#newPanneauVille');
    el.val(0).attr('selected', true).siblings('option').removeAttr('selected');

    // Initialize the selectmenu
    el.selectmenu();

    // jQM refresh
    el.selectmenu("refresh", true);




    let popup = $('#newPanneau')[0];
    popup.style.display = '';

  }
  else {
    alert('Position inconnue');
  }


}

function newPanneau_cancel() {
  let popup = $('#newPanneau')[0];
  popup.style.display = 'none';
}
function newPanneau_valid() {
  var nom = $('#newPanneauNom')[0].value;

  if (nom != '') {


    var id = $('#newPanneauId')[0].value;


    var coord = $('#newPanneauCoord')[0].value;
    var id_ville = $('#newPanneauVille')[0].value;
    var officiel = $('#newPanneauOfficiel')[0].checked;



    send('newPanneau', null, newPanneau_after, newPanneau_after, { id: id, coord: coord, nom: nom, id_ville: id_ville, officiel: officiel })
  }
  else {
    alert('Nom du panneau obligatoire');
  }
  newPanneau_cancel();
}

function newPanneau_after(response) {

  send('liste_panneau', 'choix', newPanneau_after_done, newPanneau_after_done)
  //listPanneau_after(response);
  //alert(response);
  //initMap();

}
function newPanneau_after_done(response) {
  initIti();
  initMap();


}

function selection_panneau(idx) {


  let panneau = panneaux[idx];
  let pos = tabSelect.indexOf(panneaux[idx]['id']);
  if (pos == -1) {
    tabSelect.push(panneaux[idx]['id']);
  }
  else {
    tabSelect.splice(pos, 1);
  }



  initMap();
}

function selection_save() {
  $('#newIti')[0].style.display = '';
  $('#nomIti')[0].value = '';
}

function newIti_valid() {
  nom = $('#nomIti')[0].value;
  if (nom != '') {
    send('newIti', null, newIti_after, newIti_after, { nom: nom, lst: tabSelect.join(',') })
  }
  else {
    alert('Nom de l\'itinéraire obligatoire');
  }

  newIti_cancel();
}
function newIti_cancel() {
  $('#newIti')[0].style.display = 'none';
}
function newIti_after() {
  tabSelect = [];
  initMap();

}

function edit_panneau(idx) {
  
  curIdx = idx;
  send('choix', null, edit_panneau_init, edit_panneau_init, {})
  
}

function edit_panneau_init(idx) {
  $('#titreNewPanneau')[0].innerHTML = "Modifier un panneau";
  $('#newPanneau')[0].style.display = '';
  var panneau = panneaux[curIdx];
  $('#newPanneauId')[0].value = panneau['id'];
  $('#newPanneauCoord')[0].value = panneau['coord'];
  var coord = panneau['coord'].replace(' ', '').split(",");
  $('#newPanneauNom')[0].value = panneau['nom'];
  $('#newPanneauVille')[0].value = panneau['id_ville'];
  //$('#newPanneauOfficiel')[0].checked = (panneau['officiel'] == 'TRUE') ? true : false;
  //$('#newPanneauVille').attr("value",panneau['id_ville']).checkboxradio("refresh");
  el = $('#newPanneauVille');
  el.val(panneau['id_ville']).attr('selected', true).siblings('option').removeAttr('selected');



  // Initialize the selectmenu
  el.selectmenu();

  // jQM refresh
  el.selectmenu("refresh", true);




  $('#newPanneauOfficiel').attr("checked", true).checkboxradio("refresh");
  $('#newPanneauPresent').attr("checked", true).checkboxradio("refresh");

  //
}

function switchAutoPan() {
  bAutoPan = !bAutoPan;


}
function autoPan() {
  bAutoPan = $("#cAutoPan")[0].checked;
  if ((bAutoPan) && (!bLocating)) {
    bLocating = true;
    navigator.geolocation.getCurrentPosition(autoPan_after, null);
  }

}
function autoPan_after(pos) {
  bLocating = false;
  //map.setView(new L.LatLng(pos.coords.latitude, pos.coords.longitude), 13);
  map.setView(new L.LatLng(pos.coords.latitude, pos.coords.longitude));
  if (bAutoPan) {
    $('#aAutoPan')[0].innerHTML = 'Suivi activé';
  }
  else {
    $('#aAutoPan')[0].innerHTML = 'Suivi désactivé';
  }
  initMap();

}



function newVille() {
  $('#nomVille')[0].value = '';
  $('#newVille')[0].value = -1;
  let popup = $('#newVille')[0];
  popup.style.display = '';


}

function newVille_cancel() {
  let popup = $('#newVille')[0];
  popup.style.display = 'none';
}

function newVille_valid() {
  var nom = $('#nomVille')[0].value;
  if (nom != '') {

    send('newVille', null, newVille_after, newVille_after, { nom: nom })
  }
  else {
    alert('Nom de la ville obligatoire');
  }
  newVille_cancel();




}

function newVille_after(response) {



  $('#newPanneauVille').find('option').remove();
  $('#newPanneauVille').append("<option value='0'>Villes</option");
  for (let i = 0; i < response.data.length; i++) {
    ville = response.data[i];
    $('#newPanneauVille').append("<option value='" + ville['id'] + "'>" + ville['nom'] + "</option");
  }



  $('#newPanneauVille').selectmenu('refresh', true);

}


