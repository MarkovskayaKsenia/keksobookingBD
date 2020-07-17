<?php


require_once 'configdb.php';
require_once 'upload_files.php';

try {
  $pdo = new PDO("$driver:host=$host;dbname=$db_name;charset=$charset", $db_user, $db_pass, $options);
  $pdo->beginTransaction();
  //Ищем id типа жилья.
  $typeStm = $pdo->prepare("SELECT id FROM housing_list WHERE housing_type = :type_desc");
  $typeStm->execute(['type_desc' => $_POST['type']]);
  $type_id = $typeStm->fetch(PDO::FETCH_COLUMN);

  //Ищем id справочника количества комнат
  $roomsStm = $pdo->prepare("SELECT id FROM rooms_list WHERE rooms = :rooms");
  $roomsStm->execute(['rooms' => $_POST['rooms']]);
  $rooms_id = $roomsStm->fetch(PDO::FETCH_COLUMN);

  //Ищем id справочника количества гостей
  $guestsStm = $pdo->prepare("SELECT id FROM guests WHERE guests_num = :guests");
  $guestsStm->execute(['guests' => $_POST['capacity']]);
  $guests_id = $guestsStm->fetch(PDO::FETCH_COLUMN);

//Загрузка аватара.
  $authorStm = $pdo->prepare("INSERT INTO authors (avatar) VALUES(:avatar)");
  try {
    $authorStm->execute(['avatar'=> uploadAvatar($_FILES)]);
    $author_id = $pdo->lastInsertId();
  } catch (PDOException $e) {
    $pdo->rollBack();
     echo 'PDOException: ' . $e->getMessage();
    exit();
  }

//Загрузка пердложения
  $offerStm = $pdo->prepare("INSERT INTO offers (author_id, title, address, price, type_id, rooms_id, guests_id, checkin, checkout, description) VALUES (:author_id, :title, :address, :price, :type_id, :rooms_id, :guests_id, :checkin, :checkout, :description)");
  $offerStm->execute(['author_id' => $author_id,
                      'title' => htmlspecialchars($_POST['title']),
                      'address' => $_POST['address'],
                      'price' => $_POST['price'],
                      'type_id' => $type_id,
                      'rooms_id' => $rooms_id,
                      'guests_id' => $guests_id,
                      'checkin' => $_POST['timein'],
                      'checkout' => $_POST['timeout'],
                      'description' => htmlspecialchars($_POST['description'])
  ]);
  $offer_id = $pdo->lastInsertId();

  //Загрузка удобств.
  $featuresStm = $pdo->prepare("INSERT INTO offers_features (offer_id, feature_id) VALUES (:offer_id, :feature_id)");
  $featureUnit = $pdo->prepare("SELECT id FROM features_list WHERE feature = :feature");
  foreach($_POST['features'] as $feature) {
    $featureUnit->execute(['feature' =>$feature]);
    $feature_id = $featureUnit->fetch(PDO::FETCH_COLUMN);
    $featuresStm->execute(['offer_id' => $offer_id, 'feature_id' => $feature_id]);
  }
  //Загрузка координат
  $locationStm = $pdo->prepare("INSERT INTO offers_locations (offer_id, coord_x, coord_y) VALUES (:offer_id, :coord_x, :coord_y)");
  $locationCoords = explode(',', $_POST['address']);
  $coord_x = $locationCoords[0];
  $coord_y = $locationCoords[1];
  $locationStm->execute(['offer_id' => $offer_id, 'coord_x' => $coord_x, 'coord_y' => $coord_y]);

//Загрузка фотографий объявления
  if(!empty($_FILES['images']['name'][0])) {
  $imgStm = $pdo->prepare("INSERT INTO offers_photos (offer_id, photo) VALUES (:offer_id, :photo)");
  restructFilesImg();
   $images = $_FILES['images'];
  foreach($images as $k => $v) {
try{
    $imgStm->execute(['offer_id' => $offer_id, 'photo' => uploadPhotos($v)]);
} catch(PDOException $e){
    $pdo->rollBack();
  echo 'PDOException: ' .$e->getCode() . '|' . $e->getMessage();
  exit();
}
  }
}


$pdo->commit();
  header('Location:/');
} catch(PDOException $e) {
  $pdo->rollBack();
  echo 'PDOException: ' .$e->getCode() . '|' . $e->getMessage();
  exit();
}



