<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">

<head>

<style type="text/css">
#cartform{
	display: flex;
	align-items: center;
}
#cartform input, #cartform button{
	margin-right:10px;
}
.product__item__text > div {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.blog__sidebar__item__tags {
	text-align: center;
}
#heartbox{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	border: 1px solid red;
	display: inline-block;
	background: radial-gradient(circle, pink, white);
	position: relative;
}
#heartbox #fc{
      position: absolute; 
      top: 50%; 
      left: 50%; 
      transform: translate(-50%, -50%); 
	cursor:pointer;
}

</style>



    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <try:favicon />
    <title>상품 상세 페이지</title>

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

    <script src="https://kit.fontawesome.com/7b2dcea907.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    $(document).ready(function(){
        var favor = ${favor};

        if(favor > 0){
           $("#fc").removeClass("fa-regular").addClass("fa-solid");
        } else {
           $("#fc").removeClass("fa-solid").addClass("fa-regular");
        }

        $("#fc").on("click", function(){
           $.ajax({
              url: 'favor.do?teaNum='+${ tdata.teaNum }+'&fresult=' + favor,
              type: 'POST',
              success: function(fresult){
                 console.log('fresult [' + fresult + ']');
                 if (fresult == 1) {
                    $("#fc").removeClass("fa-regular").addClass("fa-solid");
                    favor = 1;
                 } else if (fresult == 0) {
                    $("#fc").removeClass("fa-solid").addClass("fa-regular");
                    favor = 0;
                 }
              },
              error: function(error){
                 alert('error [' + error + ']');
              }
           });
        });

	// 이거 진짜 나중에
        $('#moreReviews').click(function(){
        	$.ajax({
        		url: 'TeaDetailReviews.do?teaNum='+${ tdata.teaNum }+'&count='+${ count + 4 },
        		type: 'GET',
        		success: function(result){
        			var html = "";
        			for (var i = 0; i < result.length; i++) {
        				var resultData = result[i];
        				console.log(resultData);
		        		html += "<div class='col-lg-3 col-md-4 col-sm-6'>";
			            html += "	<div class='product__item'>";
			            html += "		<a href='reviewsDetailPage.do?reviewNum=${ r.reviewNum }'>";
					    html += "			<div class='product__item__pic set-bg' data-setbg='${ r.imageUrl }'>";
					    html += "			</div>";
			            html += "		</a>";
			            html += "		<div class='product__item__text'>";
			            html += "			<div class='reviewsCon ${ r.reviewNum }'>${ r.reviewContent }</div>";
			            html += "				<script type='text/javascript'>";
						html +=	"					var con = $('.reviewsCon.'+${ r.reviewNum }).text()";
						html +=	"					console.log(con)";
						html +=	"					$('.reviewsCon.'+${ r.reviewNum }).text(con)";
						html +=	"					var htm = $('.reviewsCon.'+${ r.reviewNum }).html()";
						html +=	"					console.log(htm)";
						html +=	"					htm = htm.replace(/&nbsp;/g, '')";
						html +=	"					$('.reviewsCon.'+${ r.reviewNum }).text(htm)";
						html += "                </" + "script>"; 
			            html += "			<h6>${ r.memberId }</h6>";
			            html += "		</div>";
			            html += "	</div>";
			            html += "</div>";
			            $(".pageInfo_wrap").html("");
			            $('#reviewsRow').append(html);
        			}
        		},
        		error: function(error){
        			alert('error [' + error + ']');
        		}
        	})
        });
     });
    </script>

</head>

<body>
	
	<!-- fa fa heart(찜)와 fa fa cart(장바구니)는 spring 이후에 본격적으로 다루기 or Ajax라도 써서 구현을 해두기 -->
	
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

    <!-- Hero Section Begin -->
    <try:Hero/>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="https://images5.alphacoders.com/408/408361.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품 상세 페이지</h2>
                        <div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>Tea Detail</span>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${tdata.imageUrl}" alt="대표 이미지">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${ tdata.teaName }</h3>         
                        <a href="reviewsListPage.do?searchName=REVIEW&reviewSearch=${ tdata.teaName }"><strong>리뷰 : </strong></a><span>${ reviewCnt }개</span>
                        <div class="product__details__price">${tdata.teaPrice}</div>
                        <p>${tdata.teaContent}</p>
                        <form id="cartform" action="insertCart.do">
                        <input type="hidden" name="teaNum" value="${ tdata.teaNum }">
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" name="teaCnt" value="1">    
                                	
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="primary-btn">장바구니 추가</button> <!-- 장바구니에 추가하기 -->   
                        <div id="heartbox"> 
                        <i id="fc" class="fa-solid fa-heart" style="color: #f22202;"></i> <!-- 찜 올리기 -->
                        </div>
                        </form> 
                                       
                        
                        <ul>
                            <li><b>재고</b> <span>${tdata.teaCnt}</span></li>
                            <li><b>가격</b> <span>${tdata.teaPrice}</span></li>
                            <li><b>Share on</b>
                                <!--  sns 연계는 나중에
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                                -->
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상품설명</h6>
                                    <p>${tdata.teaContent}</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <div class="row">
						                <div class="col-lg-12">
						                    <div class="section-title related__product__title">
						                        <h2>Reviews</h2>
						                    </div>
						                </div>
						            </div>
						            <div id="reviewsRow" class="row">
						            	<c:forEach var="rs" items="${ rsdatas }">
							                <c:if test="${ rs.rdatas eq null }">
							                	후기 없음
							                </c:if>
						            		<c:if test="${ rs.rdatas ne null }">
								            	<c:forEach var="r" items="${ rs.rdatas }">
									                <div class="col-lg-3 col-md-4 col-sm-6">
									                    <div class="product__item">
									                    	<a href="reviewsDetailPage.do?reviewNum=${ r.reviewNum }">
										                        <div class="product__item__pic set-bg" data-setbg="${ r.imageUrl }">
										                        </div>
									                        </a>
									                        <div class="product__item__text">
									                            <div class="reviewsCon ${ r.reviewNum }">${ r.reviewContent }</div>
									                            <script type="text/javascript">
																	var con = $('.reviewsCon.'+${ r.reviewNum }).text();
																	console.log(con);
																	$('.reviewsCon.'+${ r.reviewNum }).text(con);
																	var htm = $('.reviewsCon.'+${ r.reviewNum }).html();
																	console.log(htm);
																	htm = htm.replace(/&nbsp;/g, '');
																	$('.reviewsCon.'+${ r.reviewNum }).text(htm);
																</script>
									                            <h6>${ r.memberId }</h6>
									                        </div>
									                    </div>
									                </div>
								                </c:forEach>
							                </c:if>
						                </c:forEach>
						            </div>
						            <div class="blog__sidebar__item__tags">
			                            <a id="moreReviews" href="teaDetailPage.do?teaNum=${ tdata.teaNum }&count=${ count+4 }">더 보 기</a>
			                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    
    <!-- Related Product Section End -->

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