<?php
$curl = curl_init();
$search_string = "movies 2019";
$url = "https://www.amazon.com/s/k=$search_string";
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER,false);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

$result = curl_exec($curl);

preg_match_all("|https://m.media-amazon.com/images/I/[^\s]*?._AC_UY218_.jpg|", $result, $matches);
$images = array_values(array_unique($matches[0]));

for($i = 0; $i < count($images); $i++) {
 echo "<div style='float: left; margin: 10 0 0 0; '>";
 echo "<img src='$images[$i]'><br />";
 echo"</div>";
}
//print_r($images);
curl_close($curl);













