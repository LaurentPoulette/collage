<?php

include 'db.php';
//var_dump($_POST);

if (isset($_POST['data'])) {
  $json = base64_decode($_POST['data']);
  $data = json_decode($json, true);
  //var_dump($data);

  $action = $data['action'];
  $form = $data['form'];

  if (isset($form['idActeur'])) {
    $idActeur = $form['idActeur'];
  } else {
    $idActeur = 0;
  }


  $result = 'erreur';
  switch ($action) {
    case 'init':
      $result = init();
      break;
    case 'login':
      $result = login();
      break;

    case 'liste_panneau':
      $result = liste_panneau();
      break;
    case 'optimisation':
      $result = optimisation();
      break;
    case 'checkPanneau':
      $result = checkPanneau();
      break;
    case 'uncheckPanneau':
      $result = uncheckPanneau();
      break;
    case 'setStart':
      $result = setStart();
      break;
    case 'setStop':
      $result = setStop();
      break;
    case 'ajusterPanneau':
      $result = ajusterPanneau();
      break;

    case 'newPanneau':
      $result = newPanneau();
      break;
    case 'villesPanneau':
      $result = villes();
      break;

    case 'newVille':
      $result = newVille();
      break;

    case 'newIti':
      $result = newIti();
      break;

    case 'cancel_iti':
      $result = cancel_iti();
      break;
  };

  echo json_encode($result);
}
