<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try" %>
<!DOCTYPE html>
<html lang="zxx">

<!-- ● fdatas 객체배열
		{ favorNum(찜번호),
		  imageUrl(사진url),
	   	  teaName(상품이름),
	   	  teaPice(상품가격) } 데이터 필요 -->
<!-- ● favorNum(찜번호) 데이터 보냄 -->

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<try:favicon />
<title>찜 목록 페이지</title>

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
.shoping__cart__table {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.shoping__cart__table form table tbody tr td input {
		display: inline-block;
    	font-size: 17px;
    	color: #ffffff;
    	text-transform: uppercase;
    	letter-spacing: 1px;
    	border: 1px solid #b2b2b2;
    	padding: 14px 20px 12px;
    	border-radius: 25px;
    	background-color: #a9a9a9;
    }
    
#favorClick{
	cursor:pointer;
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
	<try:Hero/>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/favor.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2> ❤️ 찜 ❤️ </h2>
						<div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>Wish List</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container edit">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table ">
						 <c:if test="${empty fdatas}">
							<h3 style="padding-bottom: 150px">💚찜한 상품이 없어용💚</h3>
						</c:if> 
						<c:if test="${ not empty fdatas }"> 
							<form method="post"  onSubmit="return false;">
							<input type="hidden" name="favorNum" value="${ favorNum }">
							<table>
								<thead>
									<tr>
										<th>상품 번호</th>
										<th>상품</th>
										<th>상품 이름</th>
										<th>가격</th>
										<th>찜 삭제</th>
									</tr>
								</thead>
								<tbody id ="tbodyFavor">
									 <c:forEach var="fdatas" items="${fdatas}"> 
										<tr>
											<td id="trFavor${fdatas.teaNum }" class="shoping__cart__quantity">${fdatas.teaNum }</td>
											<td><img src="${fdatas.imageUrl}" alt="${fdatas.teaName}" width= "150px" height="150px"></td>
											<td class="shoping__cart__quantity"><a href="teaDetailPage.do?favor=1&teaNum=${ fdatas.teaNum }">${ fdatas.teaName }</a></td>
											<td class="shoping__cart__quantity">${fdatas.teaPrice}원</td>
											<td class="shoping__cart__quantity">
											<a href="deleteFavor.do?teaNum=${ fdatas.teaNum }">
												<input type="button" value="찜 삭제">
											</a>
											</td>
										</tr>

									</c:forEach> 
								</tbody>
							</table>
						</form>
						</c:if> 
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Shoping Cart Section End -->

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