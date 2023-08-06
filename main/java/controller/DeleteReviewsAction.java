package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AlertVO;
import model.ReviewDAO;
import model.ReviewVO;

public class DeleteReviewsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		
		HttpSession session = request.getSession();
		
		rVO.setMemberId((String)session.getAttribute("ssMemberId"));
		rVO.setReviewNum(Integer.parseInt(request.getParameter("reviewNum")));
		
		
		if(rDAO.delete(rVO)) {
			AlertVO saVO = new AlertVO("후기삭제", "후기 삭제 성공!", null, "success", "myReviewsListPage.do?searchName=MEMBER");
			request.setAttribute("sa", saVO);
			forward = new ActionForward();
			forward.setPath("alertTrue.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}
	
}
