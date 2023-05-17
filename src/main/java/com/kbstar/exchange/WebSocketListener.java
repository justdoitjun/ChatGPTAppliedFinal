package com.kbstar.exchange;

import okhttp3.WebSocket;
import okio.ByteString;

public class WebSocketListener {

    public void onOpen(WebSocket webSocket, okhttp3.Response response) {
        // 웹소켓이 열렸을 때 처리할 내용
        System.out.println("WebSocket opened");
    }


    public void onMessage(WebSocket webSocket, String text) {
        // 텍스트 메시지를 수신했을 때 처리할 내용
        System.out.println("Received message: " + text);
    }


    public void onMessage(WebSocket webSocket, ByteString bytes) {
        // 바이트 메시지를 수신했을 때 처리할 내용
        System.out.println("Received bytes: " + bytes.hex());
    }


    public void onClosing(WebSocket webSocket, int code, String reason) {
        // 웹소켓이 닫히기 직전에 처리할 내용
        System.out.println("WebSocket closing");
    }


    public void onClosed(WebSocket webSocket, int code, String reason) {
        // 웹소켓이 닫혔을 때 처리할 내용
        System.out.println("WebSocket closed");
    }


    public void onFailure(WebSocket webSocket, Throwable t, okhttp3.Response response) {
        // 웹소켓 통신 실패 시 처리할 내용
        t.printStackTrace();
    }
}
