<%@ page language="java" contentType="text/html; charset=UTF-8"
	 import="model.TeaVO, java.util.ArrayList" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="try"%>

<jsp:useBean id="tDAO" class="model.TeaDAO" />
<jsp:useBean id="tVO" class="model.TeaVO" />
<jsp:setProperty property="*" name="tVO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<try:favicon />
<title>장바구니 페이지</title>

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
.shoping__cart__item__close{
	cursor:pointer;
}
#cartRemove{
	cursor:pointer;
}
.shoping__checkout{
	width: 200px;
	float: right;
	background-color: #fff;
	padding-top: 0;
	margin: 10px;
}
.primary-btn {
	display: inline-block;
	width: 198px;
	height: 47px;
	border-radius: 5px; 

}
.col-lg-12 {
	padding-right: 0px; 
	}
.shoping__cart__table table> tbody > tr > td .quantity input {
    width: 140px;
    height: 50px;
    display: inline-block;
    position: relative;
    text-align: center;
    background: #f5f5f5;
    margin-bottom: 5px;
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
						<h2>쇼핑 카트</h2>
						<div class="breadcrumb__option">
							<a href="main.jsp">Home</a> <span>Shopping Cart</span>
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
						<c:if test="${empty sessionScope.cart}">
							<br>
							
							<img src="img/cart/cart.png" alt="">
							<br>
							<br>
							<h2>💚현재 장바구니 비어있어요💚
						</c:if>
						<c:if test="${not empty sessionScope.cart}">
							<table>
								<thead>
									<tr>
										<th>상품</th>
										<th>상품 이름</th>
										<th>가격</th>
										<th>수량</th>
										<th>총 금액</th>
										<th></th>
									</tr>
								</thead>
								<!-- 장바구니 담기는 기능  -->
								<tbody id ="tbodyCart">
									<c:set var="priceSum" value="0"/>
									<c:forEach var="cart" items="${cart}">
										<tr id="cartForEach${cart.teaNum}"> <!-- 여기 부터 -->
											<td id="tdCart" class="shoping__cart__quantity">
												<img src="${cart.imageUrl}" alt="${cart.teaName}"  width = "150px" height="150px">
											</td>
											<td class="shoping__cart__quantity">${cart.teaName}</td>
											<td class="shoping__cart__price">${cart.teaPrice}원</td>
											<td class="shoping__cart__quantity">
												<div class="quantity">
													<div>	
														<input id="Cnt${cart.teaNum}" type="number" value="${cart.teaCnt}" min="1" max="${cart.teaCheckCnt}">
													</div>
												</div>
											</td>
											<td id="price${cart.teaNum}" class="shoping__cart__total">???원</td>
											
											<td class="shoping__cart__item__close"><span id="${cart.teaNum}"
												class="icon_close"></span>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	
    var nowCnt = $("#Cnt"+${cart.teaNum}).val();
    var price = nowCnt * ${cart.teaPrice};
    
	var cartAction = 1;
	
	
	
    $("#price"+${cart.teaNum}).text(price);
	
	console.log("function ready 확인");
   $("#"+${cart.teaNum}).on("click",function(){
	   console.log("삭제 버튼 클릭 확인");
	   cartAction = 0;
      $.ajax({
         url: 'cart.do?cartAction='+cartAction+'&teaNum='+${cart.teaNum},
         type: 'POST',
         success: function(result){
            /////console.log('result ['+result+']');
            $("#cartForEach"+${cart.teaNum}).remove();
            //$("#cartForEach").append();
            
          
         },
         error: function(error){
            alert('error ['+error+']');
         }
      });
   });
   
   $("#Cnt"+${cart.teaNum}).change(function(){
	   	console.log("구매 갯수 변경 확인");
		cartAction = 1;
		var changeCnt = $("#Cnt"+${cart.teaNum}).val();
		
		if(changeCnt > ${cart.teaCheckCnt}){
			changeCnt = ${cart.teaCheckCnt};
			$("#Cnt"+${cart.teaNum}).val(changeCnt);
		}
		else if(changeCnt < 1){
			changeCnt = 1;
			$("#Cnt"+${cart.teaNum}).val(changeCnt);
		}
		
		console.log("변경 Cnt 확인"+changeCnt);
		
      $.ajax({
         url: 'cart.do?cartAction='+cartAction+'&teaNum='+${cart.teaNum}+'&teaCnt='+changeCnt,
         type: 'POST',
         success: function(result){
            console.log('result ['+result+']');
            
            var price2 = changeCnt * ${cart.teaPrice};
            console.log("총가격: "+price2);
            
            var tbodyCart = $("#aCart"+${cart.teaNum}).html();
            
            $("#aCart"+${cart.teaNum}).remove();
            
            console.log("확인1");
            
            $("#cartForEach").append(tbodyCart);
            
            console.log("확인2");
            
            priceSum = ${priceSum};
            console.log(priceSum);
            $("#price"+${cart.teaNum}).text(price2);
            
            
            console.log("확인3");
			// 성공하면 재고 변경
			
            $("#priceTotal").text(priceSum);
         },
         error: function(error){
            alert('error ['+error+']');
         }
      });
   });
   
   $("#cartRemove").on("click",function(){
	   console.log("장바구니 비우기 클릭 확인");
	   cartAction = 2;
	   Swal.fire({
		      title: '장바구니 비우기',
		      text: '장바구니를 비우시겠습니까?',
		      icon: 'question', // warning, success, info, error, question
		      confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		      cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		      showCancelButton: true, // cancle 버튼 보이기
		      confirmButtonText: '확인', // confirm 버튼 text
		   	  cancelButtonText: '취소' // cancel 버튼 text
		    }).then((result) => {
		        if (result.isConfirmed) {
      $.ajax({
         url: 'cart.do?cartAction='+cartAction,
         type: 'POST',
         success: function(result){
            console.log('result ['+result+']');
            $("#tbodyCart").remove();
            $("#tbodyCart").append();
			// 성공하면 cart 전체 remove
			
			priceSum = ${priceSum};
			console.log(priceSum);
            $("#priceTotal").text(priceSum);
            Swal.fire({
	      		icon: 'success',
	      		title: '장바구니 삭제 완료!',
	      		showConfirmButton: false,
	      		timer: 1000
      		})
         },
         error: function(error){
            alert('error ['+error+']');
         }
      });
		        	
		        }
		        else {
		        	location.href='#';
		        }
		    });
   });
	
});

</script>

											</td>

										</tr> <!--  -->
										<c:set var="priceSum" value="${ priceSum + cart.teaCnt * cart.teaPrice }"/>
									</c:forEach>
									
								</tbody>
							</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="teaListPage.do" class="primary-btn cart-btn" style="padding: 14px 48px 12px 45px;">쇼핑
							계속하기 </a> <a id="cartRemove" class="primary-btn cart-btn cart-btn-right" style="padding: 14px 25px 12px 25px;">
							<span class="icon_loading"></span> 장바구니 비우기
						</a>
					</div>
					<hr>
				</div>
				<div class="col-lg-6">
					<div class="shoping__continue"></div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__checkout">
						
						<c:if test="${ not empty ssMemberId }">
							<a href="buyPage.do" class="primary-btn">결제하기</a>						
						</c:if>
						<c:if test="${ empty ssMemberId }">
							<a href="loginPage.do" class="primary-btn">결제하기</a>						
						</c:if>
					</div>
				</div>
			</div>
		</div>
		</c:if>
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