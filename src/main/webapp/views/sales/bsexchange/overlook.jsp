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
<script>








    let bsExchange = {
        init : ()=>{
            $('#bsExchangee_btn').click(()=>{
                console.log("clicked");
                $('#tableFX').show();
                $('#fXtableTitle').text("삼성전자 재무제표");
                $('#fXtableTitle').show();


                $.ajax({
                    url:'/sales/bsexchange/generate',
                    type: 'get',
                    data: {
                        corp_code : $('#request1').val(),
                        bsns_year : $('#request2').val(),
                        reprt_code : $('#request3').val()
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
            let year= $('#request2').val();
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

    $(()=>{
        $('#tableFX').hide();
        $('#fXtableTitle').hide();
        bsExchange.init();
    });//
</script>

<body>
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="/sales">KB Finance<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="/sales/assets/img/logo.png" alt="" class="img-fluid"></a>-->


        <a href="/sales/gpt" class="get-started-btn scrollto">Advice from GPT-4</a>
        <%--        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Large Modal</button>--%>

    </div>
</header><!-- End Header -->



<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="row">
                <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                    <img src="/sales/assets/img/about.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                    <h3>당신은 38개국의 시장을 지배하는 경영인입니다.</h3>
                    <p class="fst-italic">
                      아주 오랫동안 해안이 시야에서 사라지는 것을 받아들이지 않고서는 새로운 대지를 발견할 수 없습니다. 당신은 믿음과 신뢰를 기반으로,신중하고 철저한 검토를 통해 신뢰를 확립합니다.
                    </p>
                    <div class="input-group">
                        <input type="search" id="request1" class="form-control rounded" placeholder="최준혁님. 어떤 고유번호를 선택하실건가요? 00126380" aria-label="Search" aria-describedby="search-addon" />
                        <input type="search" id="request2" class="form-control rounded" placeholder="최준혁님. 어떤 연도를 선택하실건가요? 2018" aria-label="Search" aria-describedby="search-addon" />
                        <input type="search" id="request3" class="form-control rounded" placeholder="최준혁님. 어떤 사업자보 코드를 선택하실건가요? 11011" aria-label="Search" aria-describedby="search-addon" />
                        <button type="button" id="bsExchangee_btn" class="btn btn-outline-warning">search</button>
                    </div>
                    <div>
                        예시
                        00126380 / 2018 / 11011
                    </div>

                </div>
            </div>


            <div>
                <table class="table" id="tableFX">
                    <h4 id="fXtableTitle"> </h4>
                    <thead>
                    <tr>
                        <th id="th0">계정과목</th>
                        <th id="th1"></th>
                        <th id="th2"></th>
                        <th id="th3"></th>
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


        </div>
    </section><!-- End About Section -->











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





</body>

</html>