<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>collapsible demo</title>
  <link rel="stylesheet" href="//code.jquery.com/mobile/1.5.0-alpha.1/jquery.mobile-1.5.0-alpha.1.min.css">
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="//code.jquery.com/mobile/1.5.0-alpha.1/jquery.mobile-1.5.0-alpha.1.min.js"></script>


  <link rel="stylesheet" href="leaflet/leaflet.css" />
  <script src="leaflet/leaflet.js"></script>
  <script src="leaflet/plugin/geolet/geolet.js"></script>
  <script src="leaflet/plugin/color/color.js"></script>
  <script src="leaflet/plugin/textIcon/leaflet-text-icon.js"></script>
  <link rel="stylesheet" href="leaflet/plugin/textIcon/leaflet-text-icon.css" />
  <script src="collage.js?v=<?php echo uniqid() ?>"></script>

  <style>
    .ui-tabs {
      position: relative;
      padding: 0;
    }

    .ui-content {
      border-width: 0;
      overflow: visible;
      overflow-x: hidden;
      padding: 0;
    }

    .ui-panel {
      overflow-y: scroll;
    }
  </style>


  <?php


  /*
if (($handle = fopen('data/data.csv', 'r')) === false) {
    die('Error opening file');
}
*/

  include 'info.php';




  mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
  $mysqli = new mysqli($serveur, $user, $pwd, $db, $port);
  $mysqli->set_charset("utf8");

  $login=isset($_SESSION['logged']);

  
  if (!$login)
  {

  }
  else
  {
    
  }



  $mysqli->real_query("SELECT * from panneau order by zone,nom");
  $result = $mysqli->use_result();


  $panneau = "";
  $sData = '';
  foreach ($result as $row) {


    $obj = '';
    foreach ($row as $key => $value) {
      if ($obj != '') $obj .= ',';
      $obj .= '"' . $key . '":"' . str_replace('"', '',  $value) . '"';
    }
    $sData .= '<tr style="display:none" id="tr_' . $row['id'] . '">';
    $sData .= '<td><label onmouseup="clickVille()"><input type="checkbox" name="panneau_' . $row['id'] . '" id="panneau_' . $row['id'] . '">' . $row['zone'] . ' : ' . $row['nom'] . '</label></td>';
    $sData .= '<td>go</td>';
    $sData .= "</tr>";

    if ($panneau != '') $panneau .= ",";
    $panneau .= "{" . $obj . "}" . chr(13);
  }
  $panneau = "[" . $panneau . "]";

  $mysqli->real_query("SELECT distinct zone from panneau order by zone");
  $result = $mysqli->use_result();


  $tabVille = array();
  foreach ($result as $row) {

    //var_export($row);
    $tabVille[$row["zone"]] = false;
  }
  //exit;
  $ville = json_encode($tabVille);





  ?>

  <script>
    var data = <?php echo $panneau ?>;
    var ville = JSON.parse('<?php echo  str_replace("'", "\'", $ville) ?>');
    //alert(ville);

    var mapLoaded = false;
    $(document).on("pagecontainershow", function() {
      ScaleContentToDevice();
    });

    $(window).on("resize orientationchange", function() {
      ScaleContentToDevice();
    });
  </script>
  <style>
    body {
      overflow: hidden;
    }
  </style>
</head>

<body onload="init()">

  <div data-role="page" id="page1">

    <div role="main" class="ui-content">
      <div data-role="tabs">
        <div data-role="navbar">
          <ul>
            <li><a href="#Login" class="ui-btn-active">Connexion</a></li>
            <li><a href="#map">Carte</a></li>
            <li><a href="#Boucle">Boucle</a></li>
            <li><a href="#Ville">Villes</a></li>
            <li><a href="#Panneau">Panneaux</a></li>
          </ul>
        </div>
        <div id="Boucle" style="border: 1px solid black; overflow-y: scoll;">
          <table data-role="table" id="table_boucle" data-mode="reflow" class="ui-responsive table-stroke ui-table ui-table-reflow">

            <tbody>
              <?php foreach ($tabVille as $ville => $value) {

              ?>
                <tr>
                  <td>

                    <label onmouseup="clickVille()">
                      <input type="checkbox" name="ville_<?php echo $i; ?>" id="ville_<?php echo $ville; ?>"><?php echo $ville ?>
                    </label>



                  </td>
                </tr>
              <?php } ?>

            </tbody>
          </table>
        </div>

        <div id="Ville" style="border: 1px solid black; overflow-y: scoll;">
          <table data-role="table" id="table_ville" data-mode="reflow" class="ui-responsive table-stroke ui-table ui-table-reflow">

            <tbody>
              <?php foreach ($tabVille as $ville => $value) {

              ?>
                <tr>
                  <td>

                    <label onmouseup="clickVille()">
                      <input type="checkbox" name="ville_<?php echo $i; ?>" id="ville_<?php echo $ville; ?>"><?php echo $ville ?>
                    </label>



                  </td>
                </tr>
              <?php } ?>

            </tbody>
          </table>
        </div>

        <div id="Panneau" style="border: 1px solid black; overflow-y: scoll;">
          <table data-role="table" id="table_panneau" data-mode="reflow" class="ui-responsive table-stroke ui-table ui-table-reflow">
            <?php
            echo $sData;
            ?>

          </table>
        </div>
        <div id="map" style="border: 1px solid black;">
          <p>Chargement de la carte</p>
        </div>
        <div id="Login" style="border: 1px solid black;">
          <form action="#" method="get">

            <div data-role="fieldcontain" class="ui-field-contain ui-body ui-br">
              <label for="txtLogin" class="ui-input-text">Identifiant</label>
              <input type="text" name="txtLogin" id="txtLogin" value="" class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset">
            </div>
            <div data-role="fieldcontain" class="ui-field-contain ui-body ui-br">
              <label for="txtPassword" class="ui-input-text">Mot de passe</label>
              <input type="password" name="txtPassword" id="txtPassword" value="" class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset">
            </div>

            <div data-theme="a" class="ui-btn ui-btn-corner-all ui-shadow ui-btn-up-a" aria-disabled="false">
            
            <button type="submit" data-theme="a" class="ui-btn-hidden" aria-disabled="false">Submit</button></div>
          </form>
        </div>
      </div>
    </div>
  </div>
