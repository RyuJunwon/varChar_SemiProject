<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>

<%
	// 결제 승인 API 호출하기 
 
	String orderId = request.getParameter("orderId");
	String paymentKey = request.getParameter("paymentKey");
  	String amount = request.getParameter("amount");
  	String secretKey = "test_sk_ZORzdMaqN3w6xajbz0N85AkYXQGw:";
  
  	Encoder encoder = Base64.getEncoder(); 
  	byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  	String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

  	paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);
  
  	URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
  
 	HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  	connection.setRequestProperty("Authorization", authorizations);
  	connection.setRequestProperty("Content-Type", "application/json");
  	connection.setRequestMethod("POST");
  	connection.setDoOutput(true);
  	JSONObject obj = new JSONObject();
  	obj.put("paymentKey", paymentKey);
  	obj.put("orderId", orderId);
  	obj.put("amount", amount);
  
  	OutputStream outputStream = connection.getOutputStream();
  	outputStream.write(obj.toString().getBytes("UTF-8"));
  
  	int code = connection.getResponseCode();
  	boolean isSuccess = code == 200 ? true : false;
  
  	InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
  
  	Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
  	JSONParser parser = new JSONParser();
  	JSONObject jsonObject = (JSONObject) parser.parse(reader);
  	responseStream.close();
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>결제 성공 페이지</title>
<try:favicon />
<meta http-equiv="x-ua-compatible" content="ie=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    

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
.shoping__cart__table table thead th.shoping__product {
	text-align: center
}

.shoping__cart__table table tbody td input {
	display: inline-block;
	font-size: 17px;
	color: #ffffff;
	text-transform: uppercase;
	letter-spacing: 1px;
	border: 1px solid #b2b2b2;
	padding: 14px 20px 12px;
	border-radius: 25px;
	background-color: #23512e;
}

.shoping__cart__table table tbody .orderInfo {
	font-size: 20px;
	color: #1c1c1c;
	list-style: none;
	line-height: 36px;
}

.shoping__cart__table h3 {
	font-size: 25px;
	color: #1c1c1c;
	list-style: none;
	line-height: 36px;
	display: block;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 100px;
}

#mainBtn {
    display: inline-block;
    font-size: 17px;
    color: #ffffff;
    text-transform: uppercase;
    letter-spacing: 1px;
    border: 1px solid #b2b2b2;
    padding: 14px 20px 12px;
    border-radius: 25px;
    text-align: center;
    background-color: #23512e;
}
.col-lg-12 p {
	font-size: 20px;
	color: #1c1c1c;
	list-style: none;
	line-height: 36px;
	display: block;
	text-align: center;
	margin-bottom: 50px;
	font-weight: bold;
}
.col-lg-12 {
	text-align: center;
}
</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<section class="breadcrumb-section set-bg"
		data-setbg="img/orderList.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>결제 성공!</h2>
						<div class="breadcrumb__option">
							<span>Success!</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
							<h3>
							💚 주문해주셔서 감사합니다:D 💚<br><br>💚 더 나은 상품으로 보답할게요 💚
							</h3>
					</div>
<%
if (isSuccess) { %>
        <p style="display: none;">결과 데이터 : <%= jsonObject.toJSONString() %></p>
        <p>주문자 : <%= jsonObject.get("orderName") %>    |    결제방법 : <%= jsonObject.get("method") %></p>
        <div style="display: none;">
            <% if(jsonObject.get("method").equals("카드")) { out.println(((JSONObject)jsonObject.get("card")).get("number"));} %>
            <% if(jsonObject.get("method").equals("가상계좌")) { out.println(((JSONObject)jsonObject.get("virtualAccount")).get("accountNumber"));} %>
            <% if(jsonObject.get("method").equals("계좌이체")) { out.println(((JSONObject)jsonObject.get("transfer")).get("bank"));} %>
            <% if(jsonObject.get("method").equals("휴대폰")) { out.println(((JSONObject)jsonObject.get("mobilePhone")).get("customerMobilePhone"));} %>
        </div>
       
    <%} else { %>
        <h1>결제 실패</h1>
        <p><%= jsonObject.get("message") %></p>
        <span>에러코드: <%= jsonObject.get("code") %></span>
        <%
    }
    %>
    
    <!-- 완료 버튼 -->
    <a id="mainBtn" href="paySuccess.do">메인으로</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

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