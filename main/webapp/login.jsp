<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<style type="text/css">
.breadcrumb__text .login input {
    width: 75%;
    height: 40px;
    border: 1px solid #ebebeb;
    padding-left: 20px;
    font-size: 16px;
    border-radius: 4px;
    color: #1c1c1c;
    font-weight: bold;
}
.login .btn {
    border: 2px solid #ebebeb;
}
.login {
	width: 80%;
	display: inline-block;
	text-align: right;
	color: #ffffff;
    font-weight: bold;
	}
form {
	width: 360px;
	margin: 0 auto;
	text-align: center;
}


</style>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <try:favicon />
    <title>로그인 페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
	<try:Humberger />
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<try:Head />
	<!-- Header Section End -->

    <!-- Hero Section Begin -->
    
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/orderList.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 style="margin-bottom: 20px;">로그인 해주세요! :D</h2>
                        <br>
                        <form action="login.do" method="post">
                        <div class="login">
                        	아이디  <input type="text" name="memberId" placeholder="아이디를 입력하세요" required style="margin-bottom: 20px; font-weight: normal;"><br>
                        	비밀번호  <input type="password" name="memberPw" placeholder="비밀번호를 입력하세요" required style="margin-bottom: 20px; font-weight: normal;"><br>
                        	<input class="btn" type="submit" value="로그인" style="color: #ebebeb"> </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <!-- 공란 -->
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
	<try:Footer />
	<!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>



</body>

</html>