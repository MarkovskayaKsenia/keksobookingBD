<?php
//header('Access-Control-Allow-Origin: *');
//header('Content-Type: application/json');
require_once 'configdb.php';
try {
  $pdo = new PDO("$driver:host=$host;dbname=$db_name;charset=$charset", $db_user, $db_pass, $options);
} catch (PDOException $e) {
  echo "Не могу подключиться к базе данных" . $e->getCode() . '|' . $e->getMessage();
  exit();
}

$offers_query = $pdo->query('SELECT off.id, off.author_id, off.title, off.address, off.price, hl.housing_type, rl.rooms, g.guests_num AS guests, off.checkin, off.checkout, off.description FROM offers AS off, housing_list AS hl, rooms_list AS rl, guests AS g WHERE off.type_id = hl.id AND off.rooms_id = rl.id AND off.guests_id = g.id');
$features_query = $pdo->query('SELECT offer_id, feature FROM offers_features AS of, features_list AS fl WHERE of.feature_id = fl.id');
$features_data = $features_query->fetchAll(PDO::FETCH_COLUMN | PDO::FETCH_GROUP);
$authors_query = $pdo->query('SELECT * FROM authors');
$authors_data = $authors_query->fetchAll(PDO::FETCH_ASSOC);
$locations_query = $pdo->query('SELECT * FROM offers_locations');
$locations_data = $locations_query->fetchAll(PDO::FETCH_ASSOC);
$photos_query = $pdo->query("SELECT offer_id, photo FROM offers_photos");
$photos_data = $photos_query->fetchAll(PDO::FETCH_COLUMN | PDO::FETCH_GROUP);


$ads_list = [];
while ($row = $offers_query->fetch(PDO::FETCH_ASSOC)) {
  $arr = [];
  foreach ($features_data as $key => $elem) {
    if ($row['id'] == $key) {
      $row['features'] = $elem;
    }
  }
  foreach ($photos_data as $key => $elem) {
    if ($row['id'] == $key) {
      $row['photos'] = $elem;
    }
  }
  foreach ($locations_data as $elem) {
    if ($row['id'] == $elem['offer_id']) {
      $row['location']['x'] = $elem['coord_x'];
      $row['location']['y'] = $elem['coord_y'];
    }
  }

  foreach ($authors_data as $elem) {
    if ($elem['id'] == $row['author_id']) {
      $arr['author']['avatar'] = $elem['avatar'];
      $arr['offer']['title'] = $row['title'];
      $arr['offer']['address'] = $row['address'];
      $arr['offer']['price'] = $row['price'];
      $arr['offer']['type'] = $row['type'];
      $arr['offer']['rooms'] = $row['rooms'];
      $arr['offer']['guests'] = $row['guests'];
      $arr['offer']['checkin'] = $row['checkin'];
      $arr['offer']['checkout'] = $row['checkout'];
      $arr['offer']['features'] = $row['features'];
      if ($arr['offer']['features'] == null) {
        $arr['offer']['features'] = [];
      }

      $arr['offer']['description'] = $row['description'];
      $arr['offer']['photos'] = $row['photos'];
      if ($arr['offer']['photos'] == null) {
        $arr['offer']['photos'] = [];
      }
      $arr['location'] = $row['location'];


    }
  }
  $ads_list[] = $arr;
}


$json = json_encode($ads_list, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
echo($json);






















