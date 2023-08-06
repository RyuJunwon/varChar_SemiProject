<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try" %>
<!DOCTYPE html>
<html lang="zxx">

<!-- ● 객체배열
	   	{ buyNum(주문번호),
	   	  buySerial(주문시리얼번호)
	   	  buyCnt(주문한 상품 개수)
	  	  teaNum(상품번호),
	  	  teaName(상품이름) },
<!-- ● 객체배열
	   	{ memberName(회원이름),
	   	  memberPhone(회원연락처) },
	   paymentName(결제수단),
	   reviewDone(후기작성완료-boolean) 데이터 필요 -->
<!-- ● buySerial(주문시리얼번호),
 	   teaName(상품이름),
 	   memberId(회원아이디) 데이터 보냄 -->

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <try:favicon />
    <title>주문 상세 페이지</title>

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
    	.checkout__form table tbody a{
    		font-size: 16px;
    		color: #1c1c1c;
    		list-style: none;
    		line-height: 36px;
    	}
    	/* .checkout__form > #teaInfo {
    		font-size: 21px;
    		font-weight: 600;
    		border-bottom: 1px solid #e1e1e1
    	} */
    	.checkout__form > h4 {
       		border-bottom: none;
    	}
    	.shoping__cart__table table tbody tr td {
       		border-bottom: none;
       		vertical-align: top;
    	}
    	.shoping__cart__table table tbody tr td input {
    		display: inline-block;
    		font-size: 17px;
    		color: #ffffff;
    		text-transform: uppercase;
    		letter-spacing: 1px;
    		border: 1px solid #b2b2b2;
    		padding: 14px 20px 12px;
    		border-radius: 25px;
    		margin: 50px;
    		background-color: #23512e;
    		margin-top: 2px;
    	}
    	.shoping__cart__table table tbody tr .shoping__cart__item {
       		padding-left: 110px;
    	}
    	.shoping__cart__item img {
			width: 200px;
			height: 200px;
			float: left;
			
		}
		.shoping__cart__quantity img {
			max-width: 50%;
			font-size: 18px;
		}
		
		.shoping__cart__table table thead tr th { 
			font-size: 21px;
    		font-weight: 600;
    		border-bottom: 1px solid #e1e1e1
		}
		
		.shoping__cart__table {
			text-align: center;
		}
	    </style>
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
    <!-- Header Section End -->
    
    <try:Hero/>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/orderDetail.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>주문 상세</h2>
                        <div class="breadcrumb__option">
                            <a href="main.jsp">Home</a>
                            <span>Order Detail</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    
    <!-- 총 가격 구하기 -->
	<c:set var="reviewDone" value="false"/>
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<div class="checkout__form">
                		<c:forEach var="bn" items="${ bddatas }">
                			<c:set var="bNum" value="${ bn.buyNum }"/>
                		</c:forEach>
                		<h4>주문번호 : ${ bNum }</h4><br><br><br>
            		<div class="shoping__cart__table" >
						<table>
							<thead>
									<tr>
										<th class =teaInfo>상품 정보</th>
										<th class =teaInfo>상품 이름</th>
										<th class =teaInfo>구매 개수</th>
										<th class =teaInfo>후기 작성</th>
									</tr>
								</thead>
						</table>
						</div>                		
						<c:forEach var="v" items="${ bddatas }">
	                   	<form action="insertReviewsPage.do?buySerial=${ v.buySerial }" method="post">
	                   	<%-- <input type="hidden" name="buySerial" value="${ bddatas.buySerial }"> --%>
                   		<div class="shoping__cart__table" >
	                   		<!-- 상품목록 테이블 -->
                			<table>
								
									<tbody>
    									<c:set var="sum" value="0" />
    									<c:set var="sum" value="${sum + (v.teaPrice * v.buyCnt)}" />
									<tr>
                                    	<td class="shoping__cart__quantity">
                                        	<img src="${ v.imageUrl }" alt="${ v.teaName }">
                                    	</td>
										<td class="shoping__cart__quantity">
                							<a href="teaDetailPage.do?teaNum=${ v.teaNum }">${ v.teaName }</a>
                                    	</td>
										<td class="shoping__cart__quantity">
                							${ v.buyCnt } 개
                                    	</td>
                                    	<td class="shoping__cart__price">
                                    		<c:if test="${ v.reviewDone == true }">
                								<input type=submit value="후기작성">
                							</c:if>
                							<c:if test="${ v.reviewDone == false }">
                								<input type=submit  disabled value="작성완료" style="background-color: #788D7C;">
                							</c:if>
                                    	</td>
                					</tr>
                				</tbody>
							</table>
                    	</div>
						</form>
                		</c:forEach>
                	</div>
            	</div>
        	</div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

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