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
    <title>주문 페이지</title>

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
    <link rel="icon" type="image/x-icon" href="img/favicon.ico">
    <style type="text/css">
    	.checkout__form > a {
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
    		color: #1c1c1c;
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
    	#payment-request-button {
    		display: block;
   	 		font-size: 17px;
    		color: #ffffff;
    		text-transform: uppercase;
    		letter-spacing: 1px;
    		border: 1px solid #b2b2b2;
    		padding: 14px 20px 12px;
    		border-radius: 10px;
    		margin: 0 auto;
    		background-color: #23512e;
    	}
    	.payment-widget-cache-vxvyh2 {
    		padding: 24px 200px 24px 200px;
    	}
    </style>
   <script type="text/javascript">
    	function checkPh() {
 	  		var ph = document.getElementById('memberPhone').value;
                		
       		if(ph.length == 11 || ph == ''){
       			return true;
       		}
   			alert('전화번호는 하이픈(-) 공백없이 11자리 입력해주세요.');
                			
       		return false;
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
                        <h2>주문</h2>
                        <div class="breadcrumb__option">
                            <a href="main.jsp">Home</a>
                            <span>Order</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
            <div class="checkout__form">
                <!-- 회원정보 입력란 폼 -->
                <form action="buy.do?total=${ total }" method="post" onsubmit="return checkPh();">
                	<div class="checkout__input">
                    	<p>아이디</p>
                    	<input type="text" name="memberID" value="${ mVO.memberId }" readonly placeholder="아이디" required>
                    </div>
                	<div class="checkout__input">
                    	<p>이름</p>
                    	<input type="text" name="memberName" value="${ mVO.memberName }" readonly placeholder="이름" required>
                    </div>
                    <div class="checkout__input">
                        <p>전화번호</p>
                        <input type="text" id="memberPhone" name="memberPhone" placeholder="전화번호는 하이픈(-) 공백없이 11자리 입력해주세요." value="0${ mVO.memberPhone }" required>
                    </div>
                    <div class="checkout__input">
                        <p>주소</p>
                        <try:addressAPI/>
                    </div>
                </form>
            </div>
    </section>
    <!-- Checkout Section End -->

<c:set var="memberId" value="${ ssMemberId }"/>
<link rel="icon" type="image/svg+xml" href="/vite.svg" />

<div style="width: 1000px; height: 300px; margin: 0 auto;">
	<script src="https://js.tosspayments.com/v1/payment-widget"></script>


	<div id="payment-method"></div>
    <br><br><br><button id="payment-request-button">결제하기</button><br><br><br><br>
    
<%--     <!-- 총 가격 구하기 -->
    <c:set var="sum" value="0" />
    <c:forEach var="v" items="bdatas">
    	<c:set var="sum" value="${ sum + (v.teaPrice * v.teaCnt) }" />
    </c:forEach> --%>
    
    <!-- 결제 -->
    <script>
    const paymentWidget = PaymentWidget(
        "test_ck_Kma60RZblrqA7NX2LnErwzYWBn14",
        // 비회원 customerKey
    	PaymentWidget.ANONYMOUS
    );
    
    /**
     * 결제창을 렌더링합니다.
     * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
     */
     var total =  ${ total };
     
     paymentWidget.renderPaymentMethods("#payment-method", { value: total });

    const paymentRequestButton = document.getElementById(
        "payment-request-button"
    );
    paymentRequestButton.addEventListener("click", () => {
        /** 결제 요청
         * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
         */
        paymentWidget.requestPayment({
        	orderId: generateRandomString(),
        	orderName: '${ memberId }',
            //successUrl: window.location.origin + "/success.jsp",
            successUrl: "http://localhost:8080/varchar_semi_finished/paySuccess.jsp",
            failUrl: "http://localhost:8080/varchar_semi_finished/payFail.jsp",
        });
    });
      
    function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
    }
    </script>
</div>
    
    <!-- Footer Section Begin -->
	<div style="margin-top: 300px;"><try:Footer/>
	</div>
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