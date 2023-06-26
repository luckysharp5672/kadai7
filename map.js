let map, currentLatitude, currentLongitude;
let username = document.getElementById('currentUsername').textContent || "user";


// 修正後のコード
if (username === "") {
    // ユーザー名が取得できない場合の処理
    console.log("ユーザー名が取得できませんでした。");
} else {
    // ユーザー名が取得できた場合の処理
    console.log("ユーザー名:", username);
}

// 他の処理に組み込む例
// document.getElementById('myDiv').textContent = "ユーザー名: " + username;


function loadMapScenario() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            currentLatitude = position.coords.latitude;
            currentLongitude = position.coords.longitude;

            map = new Microsoft.Maps.Map(document.getElementById('myMap'), {
                center: new Microsoft.Maps.Location(currentLatitude, currentLongitude),
                zoom: 15
            });

            var center = map.getCenter();

            var pin = new Microsoft.Maps.Pushpin(center, {
                color: 'red'
            });

            map.entities.push(pin);

            // 現在の位置が取得できたら、サーバにリクエストを送信
            fetch('get_nearby_messages.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'latitude=' + encodeURIComponent(currentLatitude) + '&longitude=' + encodeURIComponent(currentLongitude)
            })
            .then(response => response.json())
            .then(nearbyMessages => {
                // 近くのメッセージを処理するコードをここに書く
            });
        }, function(error) {
            console.error("Error Code = " + error.code + " - " + error.message);
        });
    } else {
        console.error("Your browser doesn't support the Geolocation API");
    }
}

document.getElementById('getLocation').addEventListener('click', function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            currentLatitude = position.coords.latitude;
            currentLongitude = position.coords.longitude;
            console.log(currentLatitude, currentLongitude);

            var location = new Microsoft.Maps.Location(currentLatitude, currentLongitude);
            var pushpin = new Microsoft.Maps.Pushpin(location, { color: 'blue' });
            map.entities.push(pushpin);

            map.setView({ center: location, zoom: 15 });

            // 現在位置を表示
            document.getElementById('location').innerHTML = "位置：緯度 " + currentLatitude + " 経度 " + currentLongitude;
        },
        function(error) {
            console.error("Error occurred. Error code: " + error.code);
        });
    } else {
        console.error("Geolocation is not supported by this browser.");
    }
});

document.getElementById('postButton').addEventListener('click', function() {
    // メッセージを取得
    let message = document.getElementById('message').value;
    
    if(message == "") {
        alert("メッセージを入力してください。");
        return;
    }
    
    // ユーザー名、メッセージ、緯度、経度をPOSTデータとしてエンコード
    var postData = 'username=' + encodeURIComponent(username) +
                '&message=' + encodeURIComponent(message) +
                '&latitude=' + encodeURIComponent(currentLatitude) +
                '&longitude=' + encodeURIComponent(currentLongitude);

    // post_message.phpエンドポイントにPOSTリクエストを送信
    fetch('post_message.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: postData
    })
    .then(response => response.text())
    .then(result => {
        console.log(result);  // "Message posted successfully."
    });
});
