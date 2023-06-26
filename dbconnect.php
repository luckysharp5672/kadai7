<?php
$servername = " "; //sernameを入れてください
$username = " "; //usernameを入れてください
$password = " "; //passwordを入れてください
$dbname = " "; //dbnameを入れてください

try {
  // Create connection using PDO
  $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully"; 
}
catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>