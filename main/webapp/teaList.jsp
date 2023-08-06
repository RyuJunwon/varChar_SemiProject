<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<try:favicon />
<title>상품 목록 페이지</title>

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
#liFavor{
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
	<try:Hero />
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="https://images.unsplash.com/photo-1594135549290-f3a299aee716?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>상품 목록</h2>
						<div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>TeaList</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>상품</h4>
							<ul>
								<li><a href="teaListPage.do">전체</a></li>
								<li><a href="teaListPage.do?teaCategory=녹차">녹차</a></li>
								<li><a href="teaListPage.do?teaCategory=홍차">홍차</a></li>
								<li><a href="teaListPage.do?teaCategory=루이보스">루이보스</a></li>
								<li><a href="teaListPage.do?teaCategory=우롱차">우롱차</a></li>
								<li><a href="teaListPage.do?teaCategory=허브차">허브차</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 범인 색출 -->
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>상품 목록</h2>
						</div>
					</div>
					<div class="row">
			               <c:if test="${ empty tdatas }">
			                  	<h3>💚💚 검색된 상품이 없어용..💚💚</h3>
			                  </c:if>
			              <c:if test="${ not empty tdatas }">
					<c:forEach var="tdata" items="${ tdatas }">
						<div class="col-lg-4 col-md-6 col-sm-6">
		                    <div class="product__item">
		                        <div class="product__item__pic set-bg" data-setbg="${ tdata.imageUrl }">
		                            <ul class="product__item__pic__hover">
		                            <c:if test="${ empty ssMemberId }">
			                            <li><a href="loginPage.do"><i class="fa fa-heart"></i></a></li>
		                            </c:if>
		                            <c:if test="${ not empty ssMemberId }">
			                            <li><a><i id="${ tdata.teaNum }" class="fa fa-heart"></i></a></li>		                            	
		                            </c:if>
			                            <!-- <li><a href="#"><i class="fa fa-retweet"></i></a></li> -->
			                            <li><a href="insertCart.do?teaNum=${ tdata.teaNum }&teaCnt=1"><i class="fa fa-shopping-cart"></i></a></li>
		                            </ul>
		                        </div>
		                        <div class="product__item__text">
		                            <h6><a href="teaDetailPage.do?teaNum=${ tdata.teaNum }">${ tdata.teaName }</a></h6>
		                            <h5>${ tdata.teaPrice } ₩</h5>
		                        </div>
		                    </div>
		                </div>
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){

        $("#"+${ tdata.teaNum }).on("click", function(){
           $.ajax({
              url: 'favor.do?teaNum='+${ tdata.teaNum }+'&fresult=2',
              type: 'POST',
              success: function(fresult){
                 console.log('fresult [' + fresult + ']');
                 if (fresult == 1) {
                	 Swal.fire({
                		  position: 'top',
                		  icon: 'success',
                		  title: '찜 추가!',
                		  showConfirmButton: false,
                		  timer: 1000
                	})
                 }
                 else {
                	 Swal.fire({
                		  position: 'top',
                		  icon: 'success',
                		  title: '찜 삭제!',
                		  showConfirmButton: false,
                		  timer: 1000
                	})
                 }
              },
              error: function(error){
                 alert('error [' + error + ']');
              }
           });
        });

     });
    
    </script>
					</c:forEach>
					</c:if>
					</div>
					<div class="product__pagination">
						<c:if test="${ startPage > 1 }">
							<a href="teaListPage.do?page=${ startPage - 1 }&teaSearchWord=${ teaSearchWord }&teaCategory=${ teaCategory }"><i class="fa fa-long-arrow-left"></i></a>
						</c:if>
						<c:forEach begin="${ startPage }" end="${ endPage }" var="p">
							<a href="teaListPage.do?page=${ p }&teaSearchWord=${ teaSearchWord }&teaCategory=${ teaCategory }">${ p }</a>
						</c:forEach>
						<c:if test="${ endPage < totalPageCnt }">
							<a href="teaListPage.do?page=${ endPage + 1 }&teaSearchWord=${ teaSearchWord }&teaCategory=${ teaCategory }"><i class="fa fa-long-arrow-right"></i></a>
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
	</section>
	<!-- Product Section End -->

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