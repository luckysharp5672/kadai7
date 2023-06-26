<?php
session_start();

require 'dbconnect.php';

// メッセージを取得
$query = "SELECT * FROM messages";
$statement = $pdo->prepare($query);
$statement->execute();
$messages = $statement->fetchAll(PDO::FETCH_ASSOC);

// ログインしているかをチェックし、username を取得
$username = isset($_SESSION['username']) ? $_SESSION['username'] : '';
?>

<!DOCTYPE html>
<html>
<head>
    <title>山散歩でのデジタル掲示板</title>
    <style>
        /* CSSスタイルをここに追加 */
    </style>
    <script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=loadMapScenario&key=APIKEY' async defer></script>

</head>
<body>
    <h1>デジタル掲示板</h1>
    <div id="currentUsername" style="display: none;"><?php echo $username; ?></div>
    <button id="getLocation">現在位置の取得</button>
    <div id="location">位置：未取得</div>
    <div id="myMap" style="position:relative;width:600px;height:400px;"></div>
    <form id="messageForm">
        <label for="message">メッセージ:</label><br>
        <textarea id="message" name="message"></textarea><br>
        <button type="button" id="postButton">投稿</button>
    </form>
    <!-- メッセージを表示する -->
        <div id="messages">
            <?php foreach ($messages as $message) { ?>
                <div class="message">
                    <p>ユーザー名: <?php echo $message['username']; ?></p>
                    <p>メッセージ: <?php echo $message['message']; ?></p>
                    <p>緯度: <?php echo $message['latitude']; ?></p>
                    <p>経度: <?php echo $message['longitude']; ?></p>
                </div>
            <?php } ?>
        </div>
        <style>
            .message {
                border: 1px solid #ccc;
                padding: 10px;
                margin-bottom: 10px;
            }
        </style>


    <button id="search">近くのメッセージを検索</button>
    
    <script src="/php1_yoshii_53/map.js"></script>
</body>
</html>

