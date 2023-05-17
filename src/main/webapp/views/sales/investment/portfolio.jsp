<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Admin</title>
    <meta content="" name="description">
    <meta content="" name="keywords">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Favicons -->
    <link href="/sales/assets/img/favicon.png" rel="icon">
    <link href="/sales/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/sales/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="/sales/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/sales/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/sales/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/sales/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/sales/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/sales/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <!-- Template Main CSS File -->
    <link href="/sales/assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Gp
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>
<style>
    .dropbtn {
        background-color: #04AA6D;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }

    .dropbtn:hover, .dropbtn:focus {
        background-color: #3e8e41;
    }

    #myInput {
        box-sizing: border-box;
        background-image: url('searchicon.png');
        background-position: 14px 12px;
        background-repeat: no-repeat;
        font-size: 16px;
        padding: 14px 20px 12px 45px;
        border: none;
        border-bottom: 1px solid #ddd;
    }

    #myInput:focus {outline: 3px solid #ddd;}

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f6f6f6;
        min-width: 230px;
        overflow: auto;
        border: 1px solid #ddd;
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown a:hover {background-color: #ddd;}
    .progress-bar {
        background-color: blueviolet;
    }
    .show {display: block;}
    .modal {
        width: 100vw;
        height: 100%;
        outline: 0;
        background-color: rgba(0, 0, 0, 0.5);
    }
    .modal-content {
        width: 60vw;
    }
</style>

<script>
    let socket;
//connect부분은 쓰레기 코드인데 어떻게 객체화해야할지 모르겠어서 대충하겠다...너무 지친다...
    function connect() {
        var url = "wss://api.upbit.com/websocket/v1"; // WebSocket 엔드포인트 URL

        // WebSocket 생성
        socket = new WebSocket(url);
        socket2 = new WebSocket(url);
        socket3 = new WebSocket(url);
        socket4 = new WebSocket(url);

        // WebSocket 이벤트 핸들러 정의
        socket.onopen = function(event) {
            console.log("WebSocket opened");
            // 서버로 메시지 전송 예시
            let message1 = JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-BTC"]}]);
            socket.send(message1);
        };
        socket2.onopen = function(event) {
            console.log("WebSocket opened");
            // 서버로 메시지 전송 예시
            let message2 = JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-ETH"]}]);
            socket2.send(message2);
        };
        socket3.onopen = function(event) {
            console.log("WebSocket opened");
            // 서버로 메시지 전송 예시
            let message3 = JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-DOGE"]}]);
            socket3.send(message3);
        };
        socket4.onopen = function(event) {
            console.log("WebSocket opened");
            // 서버로 메시지 전송 예시
            let message4 = JSON.stringify([{"ticket":"test"},{"type":"ticker","codes":["KRW-ADA"]}]);
            socket4.send(message4);
        };

        //소켓 메세지
        socket.onmessage = function(event) {
            let reader = new FileReader();
            reader.onload = function() {
              //console.log("Received message: ", reader.result);
               // let key = "trade_price";
                let jsonString = reader.result; // 문자열 값
                let json = JSON.parse(jsonString); // JSON 형식으로 변환된 객체
                let trade_price = Number(json["trade_price"]); // 숫자로 변환
                let formatted_trade_price = trade_price.toLocaleString("ko-KR", { style: "currency", currency: "KRW" });
                $("#content1_msg").text(formatted_trade_price);
            };
            reader.readAsText(event.data);
           // $('#bitcoin').text(json["trade_price"]);
        };
        socket2.onmessage = function(event) {
            let reader = new FileReader();
            reader.onload = function() {
                //console.log("Received message: ", reader.result);
                // let key = "trade_price";
                let jsonString = reader.result; // 문자열 값
                let json = JSON.parse(jsonString); // JSON 형식으로 변환된 객체
                let trade_price = Number(json["trade_price"]); // 숫자로 변환
                let formatted_trade_price = trade_price.toLocaleString("ko-KR", { style: "currency", currency: "KRW" });
                $("#content2_msg").text(formatted_trade_price);
            };
            reader.readAsText(event.data);


            // $('#bitcoin').text(json["trade_price"]);
        };
        socket3.onmessage = function(event) {
            let reader = new FileReader();
            reader.onload = function() {
                //console.log("Received message: ", reader.result);
                // let key = "trade_price";
                let jsonString = reader.result; // 문자열 값
                let json = JSON.parse(jsonString); // JSON 형식으로 변환된 객체
                let trade_price = Number(json["trade_price"]); // 숫자로 변환
                let formatted_trade_price = trade_price.toLocaleString("ko-KR", { style: "currency", currency: "KRW" });
                $("#content3_msg").text(formatted_trade_price);
            };
            reader.readAsText(event.data);


            // $('#bitcoin').text(json["trade_price"]);
        };
        socket4.onmessage = function(event) {
            let reader = new FileReader();
            reader.onload = function() {
                //console.log("Received message: ", reader.result);
                // let key = "trade_price";
                let jsonString = reader.result; // 문자열 값
                let json = JSON.parse(jsonString); // JSON 형식으로 변환된 객체
                let trade_price = Number(json["trade_price"]); // 숫자로 변환
                let formatted_trade_price = trade_price.toLocaleString("ko-KR", { style: "currency", currency: "KRW" });
                $("#content4_msg").text(formatted_trade_price);
            };
            reader.readAsText(event.data);


            // $('#bitcoin').text(json["trade_price"]);
        };


        socket.onclose = function(event) {
            console.log("WebSocket closed");
        };
        socket2.onclose = function(event) {
            console.log("WebSocket closed");
        };
        socket3.onclose = function(event) {
            console.log("WebSocket closed");
        };
        socket4.onclose = function(event) {
            console.log("WebSocket closed");
        };

        socket.onerror = function(error) {
            console.error("WebSocket error:", error);
        };
        socket2.onerror = function(error) {
            console.error("WebSocket error:", error);
        };
        socket3.onerror = function(error) {
            console.error("WebSocket error:", error);
        };
        socket4.onerror = function(error) {
            console.error("WebSocket error:", error);
        };


    }


    function disconnect() {
        if (socket) {
            socket.close();
            console.log("WebSocket disconnected");
        }
    }

    let portfolio= {
        init : ()=>{
            $('#portfolioBuy').click(()=>{
                portfolio.display();
            })//
        },//portfolio - init
        display : ()=>{
            // Data retrieved from https://netmarketshare.com
            Highcharts.chart('container2', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: '현재 "홍길동"님의 포트폴리오',
                    align: 'left'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                    name: '포트폴리오 비율',
                    colorByPoint: true,
                    data: [{
                        name: 'Tesla',
                        y: 18,
                        sliced: true,
                        selected: true
                    }, {
                        name: 'Microsoft',
                        y: 14.77
                    },  {
                        name: 'Exxon Mobil',
                        y: 4.86
                    }, {
                        name: 'Treasury note',
                        y: 2.63
                    }, {
                        name: 'Alphabet',
                        y: 1.53
                    }]
                }]
            });

        }
    }//portfolio


    let bsExchange = {
        init : ()=>{
            $('#bsExchangee_btn').click(()=>{
                console.log("clicked");
                $('#myModal').modal('show');
                $.ajax({
                    url:'/sales/bsexchange/generate',
                    type: 'get',
                    data: {
                        corp_code : '00126380',
                        bsns_year : '2022',
                        reprt_code : '11011'
                    }
                }).done(
                    (data)=>{
                        console.log("success");
                        bsExchange.display(data);
                    }
                )
                    .fail(
                        ()=>{
                            console.log("failure");
                        }
                    );
            })
        },

        display:(data)=>{
            const parsedData = JSON.parse(data);
            console.log("====");
            const tableBody = $('.table tbody');
            let year= 2022;
            $('#th1').text(year-2);
            $('#th2').text(year-1);
            $('#th3').text(year);

            tableBody.empty(); // 기존 테이블 내용 제거
            for(let i = 0 ; i<=25 ; i++) {
                const item = parsedData.list[i];
                if (item) {
                    const row = $('<tr></tr>');
                    const countryCell = $('<td></td>').text(item.account_nm);
                    const sellRateCell = $('<td></td>').text(item.bfefrmtrm_amount);
                    const buyRateCell = $('<td></td>').text(item.frmtrm_amount);
                    const seoulRate = $('<td></td>').text(item.thstrm_amount);
                    row.append(countryCell);
                    row.append(sellRateCell);
                    row.append(buyRateCell);
                    row.append(seoulRate);

                    tableBody.append(row);
                }
            }
        }
    }
    let stocksearch = {
        init : ()=>{
            $('#stockSearch_btn').click(()=>{
                $('.progress').show();
                stocksearch.startProgressBar();
                let keywords = $('#searchCompany').val();
                console.log("clicked");
                $.ajax({
                    url:'/sales/investment/search',
                    type: 'GET',
                    data: {
                        keywords : keywords
                    }
                }).done(
                    (data)=>{

                        console.log("success");
                        stocksearch.display(data);
                    }
                ).fail(
                        ()=>{
                            console.log("failure");
                        }
                    );

                stockexchange.display();
            })
        },//stocksearch.init;
        display : (data)=>{
            $('#tableFX').show();
            const bestMatches = JSON.parse(data).bestMatches;
            console.log(bestMatches);
            const tableBody = $('.table tbody');
            tableBody.empty(); // 기존 테이블 내용 제거
            for (let seq in bestMatches) {
                let item = bestMatches[seq];
                const row = $('<tr></tr>');
                let symbol = $('<td></td>').text(item["1. symbol"]);
                console.log(item["1. symbol"]);
                let name = $('<td></td>').text(item["2. name"]);
                let region = $('<td></td>').text(item["4. region"]);
                let button = $('<button></button>').text('+');
                button.on('click', function() {
                    // Handle the button click event here
                    console.log('Button clicked for symbol:', item["1. symbol"]);
                    let symbol2 = item["1. symbol"];
                    stockexchange.click(symbol2);
                });
                row.append(symbol);
                row.append(name);
                row.append(region);
                row.append(button);
                tableBody.append(row);
            }
        },
        hideProgressBar: () => {
            if (stocksearch.progressBar) {
                stocksearch.progressBar.stop().css('width', '0');
            }
        },
        startProgressBar: () => {
            stocksearch.progressBar = $('.progress-bar');
            stocksearch.progressBar.css('width', '0').animate({
                width: '100%'
            }, 1000, () => {
                $('.progress').hide();
            });
        },
    }
    // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
    let stockexchange = {
        init : ()=>{
            $('#chatGPT_btn').click(()=>{
                let symbol = $('#request').val();
                console.log("clicked");
                $('.progress').show();
                stockexchange.startProgressBar();
                $.ajax({
                    url:'/sales/investment/generate',
                    type: 'GET',
                    data: {
                        symbol : symbol
                    }
                }).done(
                    (data)=>{
                        console.log("success");
                        stockexchange.display(data);
                    }
                )
                    .fail(
                        ()=>{
                            console.log("failure");
                        }
                    );

                stockexchange.display();
            })

        },
        click: (symbol2)=>{
            $('.progress').show();
            $.ajax({
                url:'/sales/investment/generate',
                type: 'GET',
                data: {
                    symbol : symbol2
                }

            }).done(
                (data)=>{
                    console.log("success");
                    stockexchange.display(data);
                }
            )
                .fail(
                    ()=>{
                        console.log("failure");
                    }
                );
        },
        hideProgressBar: () => {
            if (stockexchange.progressBar) {
                stockexchange.progressBar.stop().css('width', '0');
            }
        },
        startProgressBar: () => {
            stockexchange.progressBar = $('.progress-bar');
            stockexchange.progressBar.css('width', '0').animate({
                width: '100%'
            }, 10000, () => {
                $('.progress').hide();
            });
        },
        display : (data)=>{
            const obj = JSON.parse(data);
            console.log(obj);
            $('#companyname').val(obj["Meta Data"]["2. Symbol"].toUpperCase());
            $('#stockprice').val(obj["Time Series (Daily)"]["2023-05-15"]["1. open"]);
            //chart
            const set = obj["Time Series (Daily)"];
            let ranges = [];
            let averages = [];
            for (let date in set) {
                let item = set[date];
                let low = parseInt(item["3. low"]);
                let high = parseInt(item["2. high"]);
                let open = parseInt(item["1. open"]);
                ranges.push([low, high]);
                averages.push([open]);
            }
            console.log("=====1======");
            console.log(ranges);
            console.log("=====2======");
            console.log(averages);
            Highcharts.chart('container', {

                title: {
                    text: 'STOCK TREND : ' + obj["Meta Data"]["2. Symbol"].toUpperCase(),
                    align: 'left'
                },

                subtitle: {
                    text: '통화기준 : $USD'+' __ powered by Alpha Vantage in NYSE',
                    align: 'left'
                },

                xAxis: {
                    type: 'datetime',
                    accessibility: {
                        rangeDescription: 'Range: Jul 1st 2022 to Jul 31st 2022.'
                    }
                },

                yAxis: {
                    title: {
                        text: 'Stock Price - USD'
                    }
                },

                tooltip: {
                    crosshairs: true,
                    shared: true,
                    valueSuffix: '$'
                },

                plotOptions: {
                    series: {
                        pointStart: Date.UTC(2022, 12, 19),
                        pointIntervalUnit: 'day'
                    }
                },

                series: [{
                    name: obj["Meta Data"]["2. Symbol"].toUpperCase(),
                    data: averages,//변수 data
                    zIndex: 1,
                    marker: {
                        fillColor: 'white',
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[0]
                    }
                }, {
                    name: '최고가 - 최저가',
                    data: ranges,//변수 data
                    type: 'arearange',
                    lineWidth: 0,
                    linkedTo: ':previous',
                    color: Highcharts.getOptions().colors[0],
                    fillOpacity: 0.3,
                    zIndex: 0,
                    marker: {
                        enabled: false
                    }
                }]
            });

        }//display
    }//



    $(()=>{
        $('#tableFX').hide();
        $('.progress').hide();
        bsExchange.init();
        stocksearch.init();
        stockexchange.init();
        portfolio.init();
        connect();


    })
</script>


<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="/sales">KB Finance<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="/sales/assets/img/logo.png" alt="" class="img-fluid"></a>-->



        <a href="/sales/gpt" class="btn btn-warning">Advice from GPT-4</a>
<%--        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>--%>

    </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->


<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="row">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">비트코인
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div id="content1_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">이더리움
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div id="content2_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-dark shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">도지코인
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div id="content3_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pending Requests Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">에이다
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div id="content4_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                    <figure class="highcharts-figure">
                        <div id="container"></div>
                        <p class="highcharts-description">
                        </p>
                    </figure>
                    <figure class="highcharts-figure">
                        <div id="container2"></div>
                        <p class="highcharts-description">
                        </p>
                    </figure>
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                    <h3>당신은 시총규모 3위 KB를 이끄는 지도자입니다. </h3>
                    <p class="fst-italic">
                        당신의 선택은 성공과 실패를 만들어냈습니다. 야망을 품고 도전하며, 뛰어난 투자 결정으로 미래를 형성해 나갑니다.
                    </p>
                    <p>
                    <hr>
                    <div>
                        <p> 2022년 감사인 : 삼정회계법인 </p>
                        <button type="button" id="bsExchangee_btn" class="btn btn-outline-warning" data-toggle="modal" data-target="#myModal">재무제표</button>
                        <button type="button" id="bsExchange2_btn" class="btn btn-outline-warning" data-toggle="modal" data-target="#myModal">재무제표</button>
                        <p>CFO "홍길동"님에게 승인된 단독 전결투자 한도는 7,000,000,000원입니다. 한도 이상 취급시 이사회의 승인이 필요합니다. </p>
                    </div>
                    <div class="input-group">
                        <input type="search" id="companyname" placeholder="포트폴리오 편입종목"class="form-control rounded" aria-label="Search" aria-describedby="search-addon" readonly/>
                        <input type="search" id="stockprice" placeholder="현재 기준가"class="form-control rounded"aria-label="Search" aria-describedby="search-addon" readonly/>
                    </div>
                    <div class="input-group">
                        <input type="search" id="portfolioAmount" class="form-control rounded" placeholder="주문 좌수" aria-label="Search" aria-describedby="search-addon" />
                        <button type="button" id="portfolioBuy" class="btn btn-success">주문체결</button>
                        <button type="button" id="portfolioSell" class="btn btn-danger">주문매도</button>
                    </div>
                    <hr>
                    <div class="input-group">
                    <input type="search" id="searchCompany" class="form-control rounded" placeholder="어떤 회사를 찾으시나요?" aria-label="Search" aria-describedby="search-addon" />
                    <button type="button" id="stockSearch_btn" class="btn btn-outline-warning">search</button>
                    </div>
                    <div class="input-group">
                    <input type="search" id="request" class="form-control rounded" placeholder="최준혁님. 빠른 검색을 위해선 코드를 직접 넣으세요!" aria-label="Search" aria-describedby="search-addon" />
                        <button type="button" id="chatGPT_btn" class="btn btn-outline-warning">search</button>
                    </div>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success" role="progressbar"
                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                        </div>
                    </div>

                    <div>
                        <table class="table" id="tableFX">
                            <h4 id="fXtableTitle"> </h4>
                            <thead>
                            <tr>
                                <th>코드</th>
                                <th>이름</th>
                                <th>상장국가</th>
                                <th>차트선택</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    </p>


                </div>
            </div>

        </div>
    </section><!-- End About Section -->


    <!-- ======= Features Section ======= -->
    <section id="features" class="features">

        <div class="container" data-aos="fade-up">

            <div class="row">

                <div class="image col-lg-6" style='background-image: url("/views/sales/earning/assets/img/features.jpg");' data-aos="fade-right"></div>

                <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">
                </div>
            </div>

        </div>

    </section>
    <!-- End Features Section -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6">
                    <div class="footer-info">
                        <h3>Gp<span>.</span></h3>
                        <p>
                            A108 Adam Street <br>
                            NY 535022, USA<br><br>
                            <strong>Phone:</strong> +1 5589 55488 55<br>
                            <strong>Email:</strong> info@example.com<br>
                        </p>
                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Our Newsletter</h4>
                    <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                    <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                    </form>

                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong><span>Gp</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>
</footer><!-- End Footer -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>





<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">KB 금융지주 2022년 당기 재무제표</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="location.reload()">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
                <section id="feature" class="features">
                    <div>
                        <table class="table" id="tableBS">
                            <h4 id="BStableTitle"></h4>
                            <thead>
                            <tr>
                                <th>계정과목</th>
                                <th>2020</th>
                                <th>2021</th>
                                <th>2022</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



</body>

<!-- Vendor JS Files -->
<script src="/sales/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/sales/assets/vendor/aos/aos.js"></script>

<script src="/sales/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/sales/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/sales/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/sales/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="/sales/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/sales/assets/js/main.js"></script>





</html>




