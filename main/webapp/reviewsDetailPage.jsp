<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<try:favicon />
<title>후기 상세 페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
.checkout__form>a, .updatePw {
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

.shopping-cart {
	padding-bottom: 0px;
}

.blog-details {
	padding-top: 0px;
	border-bottom: none;
}

.shoping__cart__table table thead th {
	font-size: 18px;
}

.checkout__form input {
	text-align: center;
	font-size: 17px;
	color: #1c1c1c;
	text-transform: uppercase;
	letter-spacing: 1px;
	border: 1px solid #b2b2b2;
	padding: 14px 20px 12px;
	border-radius: 25px;
	margin: 50px;
	background-color: #ffffff;
}

.shoping__cart__item img {
	width: 200px;
	height: 200px;
}
</style>
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
	<try:Hero />
	<!-- Hero Section End -->

	<!-- Blog Details Hero Begin -->
	<section class="blog-details-hero set-bg" data-setbg="img/pw.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="blog__details__hero__text">
						<!-- 후기 제목 -->
						<h2>후기 상세</h2>
						<div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>Review Detail</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<section class="shopping-cart spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="shoping__cart__table">
							<table>
								<thead>
									<tr>
										<th class="shoping__product">상품정보</th>
										<th>상품이름</th>
										<th>시리얼번호</th>
										<th>구매개수</th>
										<th>회원아이디</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="shoping__cart__quantity"><img src="${ rdata.imageUrl }"
											alt=""></td>
										<td class="shoping__cart__quantity"> <h5> ${ rdata.teaName }</h5></td>
										<td class="shoping__cart__quantity"> ${ rdata.buySerial }</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">${ rdata.buyCnt }개 </div>
										</td>
										<td class="shoping__cart__total"> ${ rdata.memberId }</td>
										<td class="shoping__cart__item__close"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="blog-details spad">
			<div class="blog__details__text">
				<div class="container">
					<p>${ rdata.reviewContent }</p>
				</div>
			</div>
		</section>



		<div class="checkout__form">

			<!-- 후기내용수정 / 후기삭제 -->
			<!-- 후기 수정 : 내용만 가능한가?? 내기억으론 내용만 수정 가능 한데 ... -->
			<c:if test="${ rdata.memberId eq ssMemberId }">
				<form>
					<%-- <input type="text" name="imageUrl" value="${ rdata.imageUrl }">
					<input type="text" name="teaName" value="${ rdata.teaName }"> 
					<input type="text" name="buySerial" value="${ rdata.buySerial }"> 
					<input type="text" name="buyCnt" value="${ rdata.buyCnt }"> <input
						type="text" name="memberId" value="${ rdata.memberId }">  --%>
						<input type="hidden" name="reviewNum" value="${ rdata.reviewNum }"> 
						<input type="submit" value="후기수정" formaction="updateReviewsPage.do">
						<input type="submit" value="후기삭제" formaction="deleteReviewsPage.do">
				</form>
			</c:if> 
		</div>
	</section>
	<!-- Blog Details Section End -->


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