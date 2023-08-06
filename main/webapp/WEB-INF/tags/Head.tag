<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 최신본임 -->
<header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="main.do"><!-- main.do --><img src="img/varLog3.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./main.jsp">Home</a></li>
                            <li><a href="teaListPage.do">상품</a>
                                <ul class="header__menu__dropdown">
                                    <li><a id="all" href="teaListPage.do">전체</a></li>
                                    <li><a id="greentea" href="teaListPage.do?teaCategory=녹차">녹차</a></li>
                                    <li><a id="redtea" href="teaListPage.do?teaCategory=홍차" >홍차</a></li>
                                    <li><a id="louis" href="teaListPage.do?teaCategory=루이보스" >루이보스</a></li>
                                    <li><a id="bluetea" href="teaListPage.do?teaCategory=우롱차" >우롱차</a></li>
                                    <li><a id="herb" href="teaListPage.do?teaCategory=허브차" >허브차</a></li>
                                    <!-- href에 tea.do는 똑같이 하되, cate를 다 다르게 해준다! -->
                                </ul>
                            </li>
                            <li><a href="reviewsListPage.do?searchName=ALL">후기</a></li>
                            <c:if test="${empty ssMemberId}">
                            <li><a href="loginPage.do">마이페이지</a>
                            	<ul class="header__menu__dropdown">
                                    <li><a id="cart" href="cartPage.do">장바구니</a></li>
                                    <li><a id="favor" href="loginPage.do">찜</a></li>
                                    <li><a id="buylist" href="loginPage.do">주문내역</a></li>
                                    <li><a id="review" href="loginPage.do">내 후기</a></li>
                                    <li><a id="upinfo" href="loginPage.do">회원정보변경</a></li>
                                    <!-- href에 tea.do는 똑같이 하되, cate를 다 다르게 해준다! -->
                                </ul>
                            </li>
                            </c:if>
                            <c:if test="${not empty ssMemberId}">
                           	<li><a href="updateInfoPage.do">마이페이지</a>
                            	<ul class="header__menu__dropdown">
                                    <li><a id="cart" href="cartPage.do">장바구니</a></li>
                                    <li><a id="favor" href="favorPage.do">찜</a></li>
                                    <li><a id="buylist" href="buyListPage.do">주문내역</a></li>
                                    <li><a id="review" href="myReviewsListPage.do?searchName=MEMBER">내 후기</a></li>
                                    <li><a id="upinfo" href="updateInfoPage.do">회원정보변경</a></li>
                                    <!-- href에 tea.do는 똑같이 하되, cate를 다 다르게 해준다! -->
                                </ul>
                            </li>
                            </c:if>
                            <li><a href="mapPage.do">오시는 길</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                        <c:if test="${empty ssMemberId}">
                        	<li><a href="signupPage.do"><!-- signup.do --><img src=img/signup.png alt="회원가입" width="26" height="26" border="1"></a></li>
                            <li><a href="loginPage.do"><!-- login.do --><img src="img/login.jpg" alt="로그인" width="26" height="26" border="1"></a></li>
                        </c:if> 
                        <c:if test="${not empty ssMemberId}">
                            <li><a href="favorPage.do"><!-- favorPage.do --><img alt="찜" src="https://static.vecteezy.com/system/resources/thumbnails/001/188/163/small/heart.png" width="24" height="24" border="1"></a></li>
                            <li><a href="cartPage.do"><!-- cartPage.do --><img src="https://cdn-icons-png.flaticon.com/512/263/263142.png" alt="장바구니" width="24" height="24" border="1"></a></li>
                            <li><a href="logoutPage.do"><!-- logout.do --><img src="img/logout.png" alt="로그아웃" width="24" height="24" border="1"></a></li>
                        </c:if>  
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>