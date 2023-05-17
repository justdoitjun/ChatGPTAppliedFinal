package com.kbstar.upbitexchange;

import com.kbstar.exchange.FXExchange;
import com.kbstar.exchange.UpBitExchange;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest2 {

    FXExchange fxExchange;
    @Test
    void contextLoads() {
        try {
            //1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
            UpBitExchange upBitExchange = new UpBitExchange();
            String input = "krw-btc";
            upBitExchange.generateCode(input);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
