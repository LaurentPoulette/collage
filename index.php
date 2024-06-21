<?php
include_once 'data.php';

$version = 13;



if (!isset($_GET['idActeur'])) {

?>
    <html>

    <head>
        <link rel="stylesheet" href="rsc/css/collage.css?v=<?php echo $version ?>" />
    </head>

    <body>
        <table class='lstActeur'>
            <?php
            $rs = acteurs();
            foreach ($rs as $acteur) {
                $nb = $acteur['nb'];
                $done = $acteur['done'];
                if ($nb > 0) {
                    $iti = "( $done / $nb )";
                } else {
                    $iti = "";
                }
                echo '<tr><th><a href="?idActeur=' . $acteur['id'] . '">' . $acteur['nom'] . $iti . '</a><br/></th></tr>';
            }
            ?>
        </table>
    </body>

    </html>
<?php
    exit;
}

$idActeur = $_GET['idActeur'];
$iti = itiActeur($idActeur);
$isIti = ($iti[0]['nb'] != 0);

echo "<script>var isIti=" . ($isIti ? 'true' : 'false') . ";</script>";
?>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Collage TM</title>
    <link rel="stylesheet" href="//code.jquery.com/mobile/1.5.0-alpha.1/jquery.mobile-1.5.0-alpha.1.min.css">
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="//code.jquery.com/mobile/1.5.0-alpha.1/jquery.mobile-1.5.0-alpha.1.min.js"></script>


    <link rel="stylesheet" href="leaflet/leaflet.css" />
    <script src="leaflet/leaflet.js"></script>
    <script src="leaflet/plugin/geolet/geolet.js"></script>
    <script src="leaflet/plugin/color/color.js"></script>
    <script src="leaflet/plugin/textIcon/leaflet-text-icon.js"></script>
    <link rel="stylesheet" href="leaflet/plugin/textIcon/leaflet-text-icon.css" />

    <link rel="stylesheet" href="rsc/css/collage.css?v=<?php echo $version ?>" />
    <script src="collage.js?v=<?php $version ?>"></script>

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


</head>

<body onload="init()">
    <div data-role="page" id="page1">

        <div role="main" class="ui-content">
            <div data-role="tabs">
                <div data-role="navbar">
                    <ul>
                        <li id='bBoucle'><a href="#Boucle" class=>Choix</a></li>
                        <li id='bIti'><a href="#Iti" id='libIti'>Itinétaire</a></li>
                        <li id='bMap'><a href="#Map">Carte</a></li>
                        <!-- <li id='bEdit'><a href="#Edit">Carte</a></li>-->
                    </ul>
                </div>
                <div id="Boucle" style="border: 1px solid black; overflow-y: scoll;">

                    <form id="choix">

                        <button onclick="document.location.replace(document.location.href.split('?')[0]);">Se déconnecter</button>

                        <select name="last" id="last">
                            <option value="0" selected>Fraicheur : tous</option>
                            <option value="8">Collé il y a plus de 8 heures</option>
                            <option value="16">Collé il y a plus de 16 heures</option>
                            <option value="24">Collé il y a plus de 1 jour</option>
                            <option value="48">Collé il y a plus de 2 jour</option>
                            <option value="72">Collé il y a plus de 3 jour</>

                        </select>
                            <fieldset data-role="controlgroup" data-type="horizontal">


                                    

                                    <input type="radio" name="parcours" id="mode_ville" value="ville">
                                    <label for="mode_ville">Ville</label>
                                    <input type="radio" name="parcours" id="mode_circuit" value="circuit" checked="checked">
                                    <label for="mode_circuit">Circuit</label>

                             
                                </fieldset>


                           


                        <div id="zone_ville" style="display:none">
                            <fieldset data-role="controlgroup" data-type="horizontal">

                                        <input type="radio" name="mode" id="mode_tous" value="tous" checked="checked">
                                        <label for="mode_tous">Tous</label>
                                        <input type="radio" name="mode" id="mode_libre" value="libres">
                                        <label for="mode_libre">Libres</label>
                                        <input type="radio" name="mode" id="mode_officiel" value="officiels">
                                        <label for="mode_officiel">Officiels</label>
                                    </fieldset>
                            <table data-role="table" id="table_ville" data-mode="reflow" class="ui-responsive table-stroke ui-table ui-table-reflow">
                                <?php
                                $tabVille = villes();
                                ?>

                                <tbody>
                                    <tr>
                                        <td>

                                            <label>
                                                <input type="checkbox" name="ville_-2" id="ville_-2" />Toutes les villes
                                            </label>
                                        </td>
                                    </tr>
                                    <?php foreach ($tabVille as $row) {

                                    ?>
                                        <tr>
                                            <td>

                                                <label>
                                                    <input type="checkbox" name="ville_<?php echo $row['id']; ?>" id="ville_<?php echo $row['id']; ?>" /><?php echo $row['nom'] ?>
                                                </label>



                                            </td>
                                        </tr>
                                    <?php } ?>

                                </tbody>
                            </table>
                        </div>
                        <table data-role="table" id="table_circuit" data-mode="reflow" class="ui-responsive table-stroke ui-table ui-table-reflow">
                            <?php
                            $tabCircuit = circuits();
                            ?>

                            <tbody>
                                <?php foreach ($tabCircuit as $row) {

                                ?>
                                    <tr>
                                        <td>

                                            <label>
                                                <input type="checkbox" name="circuit_<?php echo $row['id']; ?>" id="circuit_<?php echo $row['id']; ?>" /><?php echo $row['nom'] ?>

                                            </label>



                                        </td>
                                    </tr>
                                <?php } ?>

                            </tbody>
                        </table>
                    </form>
                </div>
                <div id="Iti" style="border: 1px solid black; overflow-y: scoll;">

                    <table width="100%">
                        <tr>
                            <td>Optimiser</td>
                            <td>
                                <a href="#" onclick="setItitneraire()">dép-arr</a><br />
                            </td>
                            <td>
                                <a href="#" onclick="setItitneraireFromHere()">ici-ici</a><br />
                            </td>
                            <td>
                                <a href="#" onclick="setItitneraireToEnd()">ici-arr</a><br />
                            </td>
                        </tr>
                        <tr>
                            <td>Info</td>
                            <td id="infoNb">

                            </td>
                            <td id="infoDuree">

                            </td>
                            <td id="infoDistance">

                            </td>
                        </tr>
                    </table>
                    <button onclick="cancelIti()">Sortir de l'itinéraire en cours</button>

                    <div id="table_iti">


                    </div>

                    <div class="ui-grid-a" style="display:none">
                        <div class="ui-block-a">
                            <input type="checkbox" name="cAutoPan" id="cAutoPan" check /> <label for="cAutoPan">Suivi&nbsp;sur&nbsp;la&nbsp;carte</label>
                        </div>
                        <div class="ui-block-b">
                            <input type="checkbox" name="cItiInverse" id="cItiInverse" /><label for="cItiInverse">Sens&nbsp;inverse</label>
                        </div>

                    </div>

                    



                </div>
                <div id="Map" style="border: 1px solid black;">
                    <p>Chargement de la carte</p>
                </div>


            </div>
        </div>
        <div id="newPanneau" class="newPanneau" style="display: none">
            <h3 id="titreNewPanneau">Nouveau panneau</h3>
                                <div style="display: none;">
            <input type="text" id="newPanneauId" placeholder="id" disabled /><br />
            <input type="text" id="newPanneauCoord" placeholder="Coordonnées" /><br />
            </div>

            <input type="text" id="newPanneauNom" placeholder="Nom du panneau" /><br />
            

            <select id="newPanneauVille">
                <option value="0">Ville</option>
                <?php

                $tabVille = villes();
                foreach ($tabVille as $row) {
                    echo '<option value="' . $row['id'] . '">' . $row['nom'] . '</option>';
                }

                ?>
            </select><button onclick="newVille()">Nouvelle ville</button><br />
            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <input type="checkbox" name="newPanneauOfficiel" id="newPanneauOfficiel" /> <label for="newPanneauOfficiel">Officiel</label>
                </div>
                <div class="ui-block-b">
                    <input type="checkbox" name="newPanneauPresent" id="newPanneauPresent" /> <label for="newPanneauPresent">Présent</label>
                </div>
            </div><br/><br/><br/><br/>
            <!--<input type="checkbox" id="newPanneauOfficiel" placeholder="Nom du panneau" /><br/>-->
            <div class="ui-grid-a">

                <div class="ui-block-a"><button onclick="newPanneau_valid()">Valider</button></div>
                <div class="ui-block-b"><button onclick="newPanneau_cancel()">Annuler</button></div>
            </div>

        </div>
        <div id="newVille" class="newVille" style="display: none">

            <input type="text" id="nomVille" placeholder="nom de la ville" /><br />
            <div class="ui-grid-a">
                <div class="ui-block-a"> <button onclick="newVille_valid()">Valider</button></div>
                <div class="ui-block-b"> <button onclick="newVille_cancel()">Annuler</button></div>
            </div>
        </div>

        <div id="newIti" class="newVille" style="display: none">

            <input type="text" id="nomIti" placeholder="nom de l'itinéraire" /><br />
            <div class="ui-grid-a">
                <div class="ui-block-a"> <button onclick="newIti_valid()">Valider</button></div>
                <div class="ui-block-b"> <button onclick="newIti_cancel()">Annuler</button></div>
            </div>
        </div>

</body>

</html>