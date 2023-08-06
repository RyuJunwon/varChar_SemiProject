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
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<try:favicon />
<title>후기 목록 페이지</title>

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

<style>
.blog__item__text > div {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.reviewsCon {
    font-size: 16px;
    font-family: "Cairo", sans-serif;
    color: #6f6f6f;
    font-weight: 400;
    line-height: 26px;
    margin: 0 0 15px 0;
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
	<section class="breadcrumb-section set-bg" data-setbg="img/pw.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>상품 후기</h2>
						<div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>ReviewList</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->

	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="blog__sidebar">
						<div class="blog__sidebar__search">
							<form action="reviewsListPage.do">
								<input type="hidden" name="searchName" value="REVIEW">
								<input type="text" name="reviewSearch" placeholder="상품명으로 검색하세요">
								<button type="submit">
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
						<div class="blog__sidebar__item">
							<h4>카테고리</h4>
							<ul>
								<li><a href="reviewsListPage.do?searchName=CATEGORY&reviewSearch=녹차">녹차</a></li>
								<li><a href="reviewsListPage.do?searchName=CATEGORY&reviewSearch=홍차">홍차</a></li>
								<li><a href="reviewsListPage.do?searchName=CATEGORY&reviewSearch=우롱차">우롱차</a></li>
								<li><a href="reviewsListPage.do?searchName=CATEGORY&reviewSearch=루이보스차">루이보스차</a></li>
								<li><a href="reviewsListPage.do?searchName=CATEGORY&reviewSearch=허브차">허브차</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>후기 목록</h2>
						</div>
					</div>
					<div class="row">
					<!-- 리뷰페이지에 리뷰 없을때 -->
						<c:if test="${ empty rdatas }">
						<h3 style="padding-bottom:150px;">💚💚작성된 후기가 없습니다💚💚</h3>					
						</c:if>
					<!-- 리뷰페이지에 리뷰 있을때 -->	
						<c:if test="${  not empty rdatas }">
						<c:forEach var="rdatas" items="${ rdatas }"> 
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="blog__item">
									<div class="blog__item__pic">
										<img src="${ rdatas.imageUrl }" alt="사진예시">
									</div>
									<div class="blog__item__text">
										<h5>
											<a href="#"> ${ rdatas.teaName }</a> <br>
											<a href="#"> ${ rdatas.memberId }</a>
										</h5>
										<div class="reviewsCon ${ rdatas.reviewNum }">${ rdatas.reviewContent }</div>
										<script type="text/javascript">
											var con = $('.reviewsCon.${ rdatas.reviewNum }').text();
											console.log(con);
											$('.reviewsCon.'+${ rdatas.reviewNum }).text(con);
											var htm = $('.reviewsCon.'+${ rdatas.reviewNum }).html();
											console.log(htm);
											htm = htm.replace(/&nbsp;/g, '');
											$('.reviewsCon.'+${ rdatas.reviewNum }).text(htm);
										</script>
										<a href="reviewsDetailPage.do?reviewNum=${ rdatas.reviewNum }"
											class="blog__btn">더보기<span class="arrow_right"></span></a>
									</div>
								</div>
							</div>
                    </c:forEach>
                    </c:if>
						<div class="col-lg-12">
							<div class="product__pagination blog__pagination">
								<c:if test="${ startPage > 1 }">
									<a href="reviewsListPage.do?searchName=${ searchName }&pMemberId=${ pMemberId }&reviewSearch=${ reviewSearch }&page=${ startPage - 1 }"><i
										class="fa fa-long-arrow-left"></i></a>
								</c:if>
								<c:forEach begin="${ startPage }" end="${ endPage }" var="p">
									<a href="reviewsListPage.do?searchName=${ searchName }&pMemberId=${ pMemberId }&reviewSearch=${ reviewSearch }&page=${ p }">${ p }</a>
								</c:forEach>
								<c:if test="${ endPage < totalPageCnt }">
									<a href="reviewsListPage.do?searchName=${ searchName }&pMemberId=${ pMemberId }&reviewSearch=${ reviewSearch }&page=${ endPage + 1 }"><i
										class="fa fa-long-arrow-right"></i></a>
								</c:if>

								<!-- 페이징
                            	<a href="#"><i class="fa fa-long-arrow-left"></i></a>
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                            	-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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