package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlertVO;

public class LogoutPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		AlertVO saVO = new AlertVO("로그아웃", "로그아웃 하시겠습니까?", null, "question", "logout.do");
		request.setAttribute("sa", saVO);
		forward.setRedirect(false);
		forward.setPath("alertChoose.jsp");
		
		return forward;
	}

}
