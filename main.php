<div data-role="page" id="page1">

    <div role="main" class="ui-content">
        <div data-role="tabs">
            <div data-role="navbar">
                <ul>
                    <li><a href="#Boucle">Choix</a></li>
                    <li><a href="#map">Carte</a></li>
                    
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

        </div>
    </div>
</div>