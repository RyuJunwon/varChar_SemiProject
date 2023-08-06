package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlertVO;
import model.MemberDAO;
import model.MemberVO;

public class UpdatePwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		MemberDAO mDAO = new MemberDAO();
		MemberVO mVO = new MemberVO();
		
		mVO.setMemberSearch("비밀번호변경");
		mVO.setMemberId(request.getParameter("memberId"));
		mVO.setMemberPw(request.getParameter("memberPw"));
		
		if(mDAO.update(mVO)) {
			AlertVO saVO = new AlertVO("비밀번호변경", "비밀번호 변경 성공!", null, "success", "logout.do");
			request.setAttribute("sa", saVO);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("alertTrue.jsp");			
		}
		
		return forward;
	}
	
}
