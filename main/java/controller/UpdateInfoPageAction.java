package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class UpdateInfoPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		
		HttpSession session = request.getSession();
		
		mVO.setMemberId((String)session.getAttribute("ssMemberId"));
		mVO.setMemberSearch("회원정보변경");
		mVO = mDAO.selectOne(mVO);
		
		System.out.println("UpdateInfoPageAction mVO : " + mVO);
		request.setAttribute("mdata", mVO);
		
		forward.setRedirect(false);
		forward.setPath("updateInfo.jsp");
		
		return forward;
	}
	
}
