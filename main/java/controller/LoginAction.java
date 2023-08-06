package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AlertVO;
import model.MemberDAO;
import model.MemberVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();;
		
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		
		mVO.setMemberId(request.getParameter("memberId"));
		mVO.setMemberPw(request.getParameter("memberPw"));
		mVO.setMemberSearch("로그인");
		mVO = mDAO.selectOne(mVO);
		
		if (mVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("ssMemberId", mVO.getMemberId());
			forward.setPath("main.do");
			forward.setRedirect(true);
		} else {
			AlertVO saVO = new AlertVO("로그인실패", "로그인실패", null, "error", null);
			request.setAttribute("sa", saVO);
			forward.setPath("alertFalse.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}