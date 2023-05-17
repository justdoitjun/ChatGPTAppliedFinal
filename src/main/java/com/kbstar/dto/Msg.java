package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Msg {
    private String sendid;  //  보내는 사람 id
    private String receiveid;   //받는 사람 id
    private String content1;    //컨텐츠 데이터
}
