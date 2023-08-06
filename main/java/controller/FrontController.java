package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlertVO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontController() {
        super();
    }
    
    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1. Client가 보낸 요청을 추출
    	String uri = request.getRequestURI();
    	System.out.println("uri : " + uri);
    	String cp = request.getContextPath();
    	System.out.println("cp : " + cp);
    	String command = uri.substring(cp.length());
    	System.out.println("commnad : " + command);
    	
    	// 2. 추출한 요청에 맞는 Action클래스의 execute() 메서드를 호출
    	ActionForward forward = null;
    	
    	// 메인페이지
    	if (command.equals("/main.do")) {
    		forward = new MainAction().execute(request, response);
    	}
    	// 로그인 페이지
    	else if (command.equals("/loginPage.do")) {
    		forward = new LoginPageAction().execute(request, response);
    	}
    	// 로그인
    	else if (command.equals("/login.do")) {
    		forward = new LoginAction().execute(request, response);    		
    	}
    	// 로그아웃 페이지
    	else if (command.equals("/logoutPage.do")) {
    		forward = new LogoutPageAction().execute(request, response);    		
    	}
    	// 로그아웃
    	else if (command.equals("/logout.do")) {
    		forward = new LogoutAction().execute(request, response);    		
    	}
    	// 회원가입 페이지
    	else if (command.equals("/signupPage.do")) {
    		forward = new SignupPageAction().execute(request, response);    		
    	}
    	// 회원가입
    	else if (command.equals("/signup.do")) {
    		forward = new SignupAction().execute(request, response);    		
    	}
    	// 회원정보 수정 페이지
    	else if (command.equals("/updateInfoPage.do")) {
    		forward = new UpdateInfoPageAction().execute(request, response);    		
    	}
    	// 회원정보 수정
    	else if (command.equals("/updateInfo.do")) {
    		forward = new UpdateInfoAction().execute(request, response);    		
    	}
    	// 비밀번호 변경 페이지
    	else if (command.equals("/updatePwPage.do")) {
    		forward = new UpdatePwPageAction().execute(request, response);    		
    	}
    	// 비밀번호 변경
    	else if (command.equals("/updatePw.do")) {
    		forward = new UpdatePwAction().execute(request, response);    		
    	}
    	// 장바구니 페이지
    	else if (command.equals("/cartPage.do")) {
    		forward = new CartPageAction().execute(request, response);    		
    	}
    	// 장바구니 다시담기 페이지
    	else if (command.equals("/cartRetry.do")) {
    		forward = new CartRetryAction().execute(request, response);    		
    	}
    	// 장바구니 추가
    	else if (command.equals("/insertCart.do")) {
    		forward = new InsertCartAction().execute(request, response);    		
    	}
    	// 장바구니 삭제
    	else if (command.equals("/deleteCart.do")) {
    		forward = new DeleteCartAction().execute(request, response);    		
    	}
    	// 차 목록 페이지
    	else if (command.equals("/teaListPage.do")) {
    		forward = new TeaListPageAction().execute(request, response);    		
    	}
    	// 차 상세 페이지
    	else if (command.equals("/teaDetailPage.do")) {
    		forward = new TeaDetailPageAction().execute(request, response);    		
    	}
    	// 주문내역 페이지
    	else if (command.equals("/buyListPage.do")) {
    		forward = new BuyListPageAction().execute(request, response);    		
    	}
    	// 주문내역 상세 페이지
    	else if (command.equals("/buyDetailPage.do")) {
    		forward = new BuyDetailPageAction().execute(request, response);    		
    	}
    	// 주문 페이지
    	else if (command.equals("/buyPage.do")) {
    		forward = new BuyPageAction().execute(request, response);    		
    	}
    	// 주문
    	else if (command.equals("/buy.do")) {
    		forward = new BuyAction().execute(request, response);    		
    	}
    	// 내 후기 목록 페이지
    	else if (command.equals("/myReviewsListPage.do")) {
    		forward = new MyReviewsListPageAction().execute(request, response);
    	}
    	// 후기 목록 페이지
    	else if (command.equals("/reviewsListPage.do")) {
    		forward = new ReviewsListPageAction().execute(request, response);    		
    	}
    	// 후기 상세 페이지
    	else if (command.equals("/reviewsDetailPage.do")) {
    		forward = new ReviewsDetailPageAction().execute(request, response);    		
    	}
    	// 후기 작성 페이지
    	else if (command.equals("/insertReviewsPage.do")) {
    		forward = new InsertReviewsPageAction().execute(request, response);    		
    	}
    	// 후기 수정 페이지
    	else if (command.equals("/updateReviewsPage.do")) {
    		forward = new UpdateReviewsPageAction().execute(request, response);
    	}
    	// 후기 작성
    	else if (command.equals("/insertReviews.do")) {
    		forward = new InsertReviewsAction().execute(request, response);    		
    	}
    	// 후기 수정
    	else if (command.equals("/updateReviews.do")) {
    		forward = new UpdateReviewsAction().execute(request, response);    		
    	}    	
    	// 후기 삭제 페이지
    	else if (command.equals("/deleteReviewsPage.do")) {
    		forward = new DeleteReviewsPageAction().execute(request, response);    		
    	}
    	// 후기 삭제
    	else if (command.equals("/deleteReviews.do")) {
    		forward = new DeleteReviewsAction().execute(request, response);    		
    	}
    	// 찜 목록 페이지
    	else if (command.equals("/favorPage.do")) {
    		forward = new FavorPageAction().execute(request, response);    		
    	}
    	// 찜 추가
    	else if (command.equals("/insertFavor.do")) {
    		forward = new InsertFavorAction().execute(request, response);    		
    	}
    	// 찜 삭제
    	else if (command.equals("/deleteFavor.do")) {
    		forward = new DeleteFavorAction().execute(request, response);    		
    	}
    	// 오시는 길 페이지
    	else if (command.equals("/mapPage.do")) {
    		forward = new MapPageAction().execute(request, response);    		
    	}
    	// 결제 성공
    	else if (command.equals("/paySuccess.do")) {
    		forward = new paySuccessAction().execute(request, response);    		
    	}
    	
    	// 3. 사용자에게 응답. View로 이동
    	if (forward != null) {
    		if (forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}
    		else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}    		
    	}
    	else {
    		AlertVO saVO = new AlertVO("error", "error", "error", "error", null);
    		request.setAttribute("sa", saVO);
    		request.getRequestDispatcher("alertFalse.jsp").forward(request, response);    		
    	}
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);	
	}

}
