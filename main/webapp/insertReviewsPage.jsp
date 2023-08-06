<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<try:favicon />
<title>후기 작성 페이지</title>

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
<script
	src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
/* 에디터 최소 높이 */
.ck-editor__editable {
	min-height: 250px;
}

.shopping-cart {
	padding-bottom: 0px;
}

.blog-details {
	padding-top: 0px;
	border-bottom: none;
}
.shoping__cart__table table thead th {
font-size:18px;

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

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/info.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>
							후 기 작 성
						</h2>
						<div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>insertReview</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<form action="insertReviews.do" method="post">
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
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="shoping__cart__quantity"><img src="${ tdatas.imageUrl }"
											alt="">
										</td>
										<td class="shoping__cart__quantity">${ tdatas.teaName }</td>
										<td class="shoping__cart__quantity"> ${ rdata.buySerial }</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">${ bddatas.buyCnt }개</div>
										</td>
										<td class="shoping__cart__quantity">${ rdata.memberId }
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 
						<div class="checkout__form">
							<div class="shopping__cart_table">
								<h4>주문정보</h4>
								<br> <br> <br>
								<form action="insertReviews.do" method="post">
									<table>
										<tbody>
											<tr>
												<td class="shoping__cart__price"><h4 id="buySerial">시리얼번호 ${ buySerial }</h4></td>
												<td class="shopping__cart__item">상품이름 ${ teaName }</td>
												<td class="shoping__cart__item">회원이름 ${ memberId.name }</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>
						-->
					</div>
				</div>
			</div>
		</section>

		<div class="checkout__form">
			<input type="hidden" name="memberId" value="${ rdata.memberId }">
			<input type="hidden" name="buySerial" value="${ rdata.buySerial }"> <br>
			<!-- CKEditor 부분 -->
			<section class="blog-details spad">
				<div class="container">
					<textarea id="editor" name="reviewContent" placeholder="150자 이내로 작성해주세요"></textarea>
					<!-- CKEditor -->
					<script>
                            ClassicEditor
                                .create(document.querySelector('#editor'), {
                                   language: "ko"
                                })
                                .catch( error => {
                                    console.error( error );
                                });
      				</script>
				</div>
			</section>
			<div class="abc center-content"
				style="margin-top: 2px; margin-bottom: 100px; text-align: center;">
				<input class="primary-btn" type="submit" value="후기작성">
			</div>
		</div>
	</form>

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