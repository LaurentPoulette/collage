<div data-role="page" id="page1">

    <div role="main" class="ui-content">
        <div data-role="tabs">
            <div data-role="navbar">
                <ul>
                    <li><a href="#Login" class="ui-btn-active">Connexion</a></li>
                </ul>
            </div>

            <div id="Login" style="border: 1px solid black;">
                <form action="#" method="post" id="fLogin">

                    <div data-role="fieldcontain" class="ui-field-contain ui-body ui-br">
                        <label for="txtLogin" class="ui-input-text">Identifiant</label>
                        <input type="text" name="txtLogin" id="txtLogin" value="" class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset">
                    </div>
                    <div data-role="fieldcontain" class="ui-field-contain ui-body ui-br">
                        <label for="txtPassword" class="ui-input-text">Mot de passe</label>
                        <input type="password" name="txtPassword" id="txtPassword" value="" class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset">
                    </div>

                    <div data-theme="a" class="ui-btn ui-btn-corner-all ui-shadow ui-btn-up-a" aria-disabled="false">

                        <button type="button" onclick="send('login','fLogin');return false;" data-theme="a" class="ui-btn-hidden" aria-disabled="false">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>