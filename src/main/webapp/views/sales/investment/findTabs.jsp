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
    let netIncome = {
        init:()=>{
            $('#stockSearchGo_btn').click(()=>{
                console.log('clicked');
                window.location.href='/sales/investment/stock';
            })
            $('#portfolioGo_btn').click(()=>{
                console.log('clicked');
                window.location.href='/sales/investment/portfolio';
            })
            $('#webSocketGo_btn').click(()=>{
                console.log('clicked');
                window.location.href='/sales/investment/websocket';
            })
        }
    };
    $(()=>{
        netIncome.init();
    });
</script>

<body>



<!-- ======= Hero Section ======= -->


<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="row">

                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
                    <h3>당신은 야수의 심장을 지닌 경영인입니다.</h3>
                    <div class="input-group">
                        <button type="button" id="stockSearchGo_btn"class="btn btn-warning">주식 시황</button>
                        <div> || </div>
                        <button type="button" id="portfolioGo_btn"class="btn btn-warning">포트폴리오 모의투자</button>
                        <div> || </div>
                        <button type="button" id="webSocketGo_btn"class="btn btn-warning">가상자산 시세조회</button>
                    </div>

                </div>
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