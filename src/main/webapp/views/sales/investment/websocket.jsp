<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WebSocket Test</title>
    <script>
        var socket;

        function connect() {
            var url = "wss://api.upbit.com/websocket/v1"; // WebSocket 엔드포인트 URL

            // WebSocket 생성
            socket = new WebSocket(url);

            // WebSocket 이벤트 핸들러 정의
            socket.onopen = function(event) {
                console.log("WebSocket opened");

                // 서버로 메시지 전송 예시
                var message = JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]);
                socket.send(message);
            };
            socket.onmessage = function(event) {
                var reader = new FileReader();
                reader.onload = function() {
                    console.log("Received message: ", reader.result);
                };
                reader.readAsText(event.data);
            };


            socket.onclose = function(event) {
                console.log("WebSocket closed");
            };

            socket.onerror = function(error) {
                console.error("WebSocket error:", error);
            };
        }

        function disconnect() {
            if (socket) {
                socket.close();
                console.log("WebSocket disconnected");
            }
        }
    </script>
</head>
<body>
<h1>WebSocket Test</h1>

<button onclick="connect()">Connect</button>
<button onclick="disconnect()">Disconnect</button>
</body>
</html>
