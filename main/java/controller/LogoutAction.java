package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AlertVO;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		session.removeAttribute("ssMemberId");
		
		AlertVO saVO = new AlertVO("로그아웃", "메인으로 이동합니다.", null, "success", "main.do");
		request.setAttribute("sa", saVO);
		forward.setRedirect(false);
		forward.setPath("alertTrue.jsp");
		
		return forward;
	}

}
