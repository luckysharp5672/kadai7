<?php
include 'dbconnect.php';

// リクエストからユーザー名、メッセージ、緯度、経度を取得
$username = $_POST['username'];
$message = $_POST['message'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];

// メッセージをデータベースに保存
$query = "INSERT INTO messages (username, message, latitude, longitude) VALUES (:username, :message, :latitude, :longitude)";
$statement = $pdo->prepare($query);
$statement->execute([
    ':username' => $username,
    ':message' => $message,
    ':latitude' => $latitude,
    ':longitude' => $longitude
]);

echo "Message posted successfully.";
?>
