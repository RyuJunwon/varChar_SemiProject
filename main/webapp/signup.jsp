<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try" %>
<!DOCTYPE html>
<html lang="ko">

<head>

<style type="text/css">
.signup__image {
	/*border: 1px;*/
	margin: 10px;
	padding: 0px;
	animation: fadein 6s ease 4s;
	-webkit-animation: fadein 4s; /* Safari and Chrome */
}

.signup__image img {
	width: 100%;
}

@keyframes fadein {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.checkout__input input {
	color: solid #1c1c1c;
}


</style>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<try:favicon />
<title>회원 가입 페이지</title>


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
</head>

<body>
<script type="text/javascript">

function test() { // 회원가입 버튼에서 실행될 함수 (버튼을 submit으로 설정 X)
    var p1 = document.getElementById('pw').value; 
    // MemberVO의 패스워드 멤버변수 memberPw와 동일한 name을 갖춰서 보내야할 인풋값
    var p2 = document.getElementById('pw2').value; 
    // 단순 2차 비번 확인용
    var ph = document.getElementById('memberPhone').value; // 연락처
    var mail = document.getElementById('memberEmail').value; // 이메일
    const test = "@"; // 이메일
    
    if (p1 !== p2) { // 비번이 일치하지 않을 경우
        alert("비밀번호가 일치하지 않아서 회원가입을 완료할 수 없습니다.");
    } else if (p1.length < 8) { // 비번 일치여부와는 관계없이 8글자 미만일경우
        alert("비밀번호는 8글자 이상으로 설정해야 합니다.");
    } else {
        // 연락처와 이메일 유효성 검사
        const phoneRegex = /^\d{11}$/; // 11자리의 숫자만 허용 (하이픈 없음)
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 정규표현식을 통한 이메일 유효성 검사
        const isPhoneValid = ph.length === 0 || ph.match(phoneRegex);
        const isEmailValid = mail.length === 0 || mail.match(emailRegex);

        if (isPhoneValid && isEmailValid) {
            // 연락처와 이메일 모두 유효성 검사를 통과한 경우
            return true;
        } else if (!isPhoneValid && !isEmailValid) {
            // 둘 다 입력되지 않은 경우 유효성 검사를 제외하고 회원가입 진행
            return true;
        } else {
            // 유효성 검사를 통과하지 못한 경우
            if (!isPhoneValid) {
                alert('연락처를 11자리 숫자로 입력해주세요.');
            }
            if (!isEmailValid) {
                alert('이메일을 정확하게 입력하세요.');
            }
        }
    }
    return false;
}


</script>
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
     <!-- 공란 -->
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="img/pw.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>회원가입</h2>
						<div class="breadcrumb__option">
                            <a href="main.jsp">Home</a>
                            <span>Sign Up</span>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
			</div>
			<div class="checkout__form">
				<h4>회원가입</h4>
				<!-- Ctrl한테 보내줘야 할 Form시작 -->
				<form action="signup.do" method="post" id="signup" onsubmit="return test();">
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="signup__image">
								<img src="img/signup/signupPage.jpg" alt="">
							</div>
						</div>
						
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											아이디<span>*</span>
										</p>
										<input type="text" name="memberId" placeholder="아이디를 입력하세요" required>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											비밀번호<span>*</span>
										</p>
										<input id="pw" type="password" name="memberPw" placeholder="비밀번호를 입력하세요 (최소 8글자부터)" required>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											비밀번호 확인<span>*</span>
										</p>
										<input id="pw2" type="password"  placeholder="한번 더 입력하세요." required>
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									이름<span>*</span>
								</p>
								<input type="text" name="memberName" placeholder="이름을 입력하세요" required>
							</div>
							<div class="checkout__input">
								<p>
									주소
								</p>
								<try:addressAPI/>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											연락처
										</p>
										<input id="memberPhone" type="text" name="memberPhone" placeholder="-(하이픈)을 빼고 입력하세요">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Email
										</p>
										<input type="text" id="memberEmail" name="memberEmail" placeholder="@ 포함 정확하게 입력하세요">
									</div>
								</div>
							</div>
							<button type="submit" value="회원가입" class="site-btn">가입하기</button>
					</div>
					</div>
				</form>
				<!-- Ctrl한테 보내줘야 할 Form끝 -->
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

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