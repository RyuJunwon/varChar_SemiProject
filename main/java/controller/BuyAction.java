package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BuyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("total", request.getAttribute("total"));
		
		// 결제 창 띄우기 
		forward.setRedirect(false);
		forward.setPath("pay.jsp");
		
		return forward;
	}
	
}
