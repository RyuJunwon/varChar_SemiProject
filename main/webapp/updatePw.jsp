<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try" %>
<!DOCTYPE html>
<html lang="">

<!-- ● memberID 데이터 필요 -->
<!-- ● memberPw 데이터 보냄 -->

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <try:favicon />
    <title>비밀번호 수정 페이지</title>

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
    <style type="text/css">
    	.checkout__form > a, .updatePw {
    		display: inline-block;
   	 		font-size: 17px;
    		color: #1c1c1c;
    		text-transform: uppercase;
    		letter-spacing: 1px;
    		border: 1px solid #b2b2b2;
    		padding: 14px 20px 12px;
    		border-radius: 25px;
    		margin: 50px;
    	}
    	.checkout__form {
    		text-align: center;
    	}
    	.col-lg-12 > icon_tag_alt > span {
    		color: #dd2222;
    	}
    	.checkout__input > input{
    		width: 50%;
    		height: 46px;
    		border: 1px solid #ebebeb;
    		padding-left: 20px;
    		font-size: 16px;
    		color: #b2b2b2;
    		border-radius: 4px;
    		text-align: center;
    		margin: auto;
    	}
    	.checkout h6{
    		color: #999999;
    		text-align: center;
   		 	background: #f5f5f5;
    		border-top: 1px solid #6AB963;
    		padding: 12px 0 12px;
    		margin-bottom: 20px;
    	}
    </style>
    <script type="text/javascript">
    	function checkPw() {
 	  		var nPw = document.getElementById('newPw').value;
       		var cnPw = document.getElementById('checkNewPw').value;
                		
       		if(nPw.length < 8){
   				alert('비밀번호 설정은 8글자 이상부터 가능합니다.');
                			
       			return false;
       		}
       		else if( nPw != cnPw ){
                alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                			
                return false;
            }
       		return true;
      	}
                </script>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <try:Humberger/>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <try:Head/>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/pw.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>비밀번호 변경</h2>
                        <div class="breadcrumb__option">
                            <a href="main.jsp">Home</a>
                            <span>My Page</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
        	<h6><span class="icon_tag_alt"></span> 비밀번호 8자리 이상 입력하세요.</h6>
        </div>
            <div class="checkout__form">
            
            	<!-- 정보수정 / 비번변경 버튼 -->
            	<a href="updateInfoPage.do" class="mInfo__btn"> 회원 정보 수정 </a><a href="updatePwPage.do" class="mPw__btn"> 비밀번호 변경 </a>
                
                <!-- 새 비밀번호 입력란 폼 -->
                <form action="updatePw.do" method="post" onsubmit="return checkPw()">
                	<input type="hidden" name="memberId" value="${ ssMemberId }">
                	<div class="checkout__input">
                    	<p>새 비밀번호</p>
                    	<input type="password" id=newPw name="memberPw" required>
                    </div>
                    <div class="checkout__input">
                        <p>비밀번호 확인</p>
                        <input type="password" id="checkNewPw" required>
                    </div>
                    	<input class="updatePw" type="submit" value="변경">
                </form>
                
            </div>
    </section>
    <!-- Checkout Section End -->

    <!-- Footer Section Begin -->
    <try:Footer/>
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