<?php

function getRandomFileName($path, $extension) {
  $path = $path ? $path : '';
  do {
    $name = md5(microtime() . rand(0, 9999));
    $file = $path . $name . '.' . $extension;
  } while(file_exists($file));
  return $name . '.' . $extension;
}


function uploadAvatar(array $arr) {

   if($arr['avatar']['error'] !=  UPLOAD_ERR_NO_FILE) {
    $avatar = $arr['avatar'];
    $newAvatarPath = __DIR__ . '/img/avatars/';

    $allowedExtensions = ['jpg', 'png'];
    $extension = pathinfo($avatar['name'], PATHINFO_EXTENSION);
    $srcAvatarName = getRandomFileName($newAvatarPath, $extension) ;

    if (!in_array($extension, $allowedExtensions)) {
      throw new PDOException('Загрузка файлов с таким расширением запрещена!');

    } elseif ($avatar['error'] != UPLOAD_ERR_OK) {
      throw new PDOException ('Ошибка при загрузке файла: UPLOAD_ERR_OK');
    } elseif (!move_uploaded_file($avatar['tmp_name'], $newAvatarPath . $srcAvatarName)) {
      throw new PDOException ('Ошибка при загрузке файла из временной папки: '. $newAvatarPath . $srcAvatarName);

  } else {
      $result = 'img/avatars/' . $srcAvatarName;
    }
} else {
    $result = 'img/avatars/default.png';
  }
  return $result;
}


function restructFilesImg() {
 foreach($_FILES['images'] as $key => $value) {
   foreach($value as $k => $v) {
     $_FILES['images'][$k][$key] = $v;
   }
   unset($_FILES['images'][$key]);
 }
 }

function uploadPhotos(array $arr) {

  if($arr['error'] !=  UPLOAD_ERR_NO_FILE) {
    $newPhotoPath = __DIR__ . '/img/photos/';

    $allowedExtensions = ['jpg', 'png'];
    $extension = pathinfo($arr['name'], PATHINFO_EXTENSION);
    $srcPhotoName = getRandomFileName($newPhotoPath , $extension)  ;
    if (!in_array($extension, $allowedExtensions)) {
      throw new PDOException('Загрузка файлов с таким расширением запрещена!');

    } elseif ($arr['error'] != UPLOAD_ERR_OK) {
      throw new PDOException ('Ошибка при загрузке файла: UPLOAD_ERR_OK');

    } elseif (file_exists($newPhotoPath . $srcPhotoName)){
      throw new PDOException ('Фоточка хаты с таким именем уже существует');    }
    elseif (!move_uploaded_file($arr['tmp_name'], $newPhotoPath . $srcPhotoName)){
      throw new PDOException ('Ошибка при загрузке файла из временной папки: '. $newPhotoPath . $srcPhotoName);

    } else {
      $result = 'img/photos/' . $srcPhotoName ;
    }
  } else {
    throw new PDOException('Нет такого файла');
  }
  return $result;
}

