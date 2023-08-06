<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="">

<!-- ● memberID 데이터 필요 -->
<!-- ● memberID, memberPw,
	   memberName, memberAddress,
	   memberPhone, memberEmail 데이터 보냄 -->


<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <try:favicon />
    <title>회원 정보 수정 페이지</title>

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
    	.checkout__form > a, .updateInfo {
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
    	function checkPh() {
 	  		var ph = document.getElementById('memberPhone').value;
 	  	    var mail = document.getElementById('memberEmail').value;
 	        const test= "@";    		
       		if((ph.length == 11 && mail == '') || (ph == '' && mail == '') || (ph == '' && mail.indexOf(test) !== -1) || (ph.length == 11 && mail.indexOf(test) !== -1)){
       			return true;
       		}
       		else if(ph.length !== 11){
   			alert('전화번호는 하이픈(-) 공백없이 11자리 입력해주세요.');
       		return false;
       		}
       		else if(mail.indexOf(test) == -1){
       		alert('이메일은 @포함 정확하게 입력하세요');
            return false;
       		}            			
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
    <section class="breadcrumb-section set-bg" data-setbg="img/info.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>회원 정보 수정</h2>
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
        	<h6><span class="icon_tag_alt"></span> 전화번호는 하이픈(-) 공백없이 11자리 입력해주세요.</h6>
        </div>
            <div class="checkout__form">
            
            	<!-- 정보수정 / 비번변경 버튼 -->
                <a href="updateInfoPage.do" class="mInfo__btn"> 회원 정보 수정 </a><a href="updatePwPage.do" class="mPw__btn"> 비밀번호 변경 </a>
                
                <!-- 회원정보 입력란 폼 -->
                <form action="updateInfo.do" method="post" onsubmit="return checkPh();">
                	<div class="checkout__input">
                    	<p>아이디</p>
                    	<input type="text" name="memberId" value="${ mdata.memberId }" readonly>
                    </div>
                	<div class="checkout__input">
                    	<p>이름</p>
                    	<input type="text" name="memberName" value="${ mdata.memberName }">
                    </div>
                    <div class="checkout__input">
                        <p>전화번호</p>
                        <c:if test="${ mdata.memberPhone == 0 }">
                        	<input type="text" id="memberPhone" name="memberPhone">
                        </c:if>
                        <c:if test="${ mdata.memberPhone != 0 }">
                        	<input type="text" id="memberPhone" name="memberPhone" value="0${ mdata.memberPhone }"> 
                        </c:if>
                    </div>
                    <div class="checkout__input">
                        <p>이메일</p>
                        <input type="text" id="memberEmail" name="memberEmail" value="${ mdata.memberEmail }">
                    </div>
                        <div class="checkout__input">
                        <p>주소</p>
                        <try:addressAPI/>
                    </div>
                    <input class="updateInfo" type="submit" value="수정">
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