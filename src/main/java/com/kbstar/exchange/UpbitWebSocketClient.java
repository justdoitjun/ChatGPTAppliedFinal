package com.kbstar.exchange;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

public class UpbitWebSocketClient extends WebSocketListener {
    public static void main(String[] args) {
        OkHttpClient client = new OkHttpClient();
        Request request = new Request.Builder()
                .url("wss://api.upbit.com/websocket/v1")
                .build();

        UpbitWebSocketClient webSocketClient = new UpbitWebSocketClient();
        WebSocket webSocket = client.newWebSocket(request, webSocketClient);
    }

    @Override
    public void onOpen(WebSocket webSocket, okhttp3.Response response) {
        // 웹소켓이 열리면 요청할 정보를 전송
        String message = "{\"type\":\"ticker\",\"codes\":[\"KRW-BTC\"]}";
        webSocket.send(message);
    }

    @Override
    public void onMessage(WebSocket webSocket, String text) {
        // 웹소켓으로부터 메시지를 수신받으면 처리
        System.out.println("Received message: " + text);
    }

    @Override
    public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
        // 웹소켓 통신 실패 시 처리
        t.printStackTrace();
    }
}
