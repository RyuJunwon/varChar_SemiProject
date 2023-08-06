package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewVO;

public class UpdateReviewsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		
		rVO.setReviewSearch((String)request.getParameter("reviewSearch"));
		rVO.setReviewNum(Integer.parseInt(request.getParameter("reviewNum")));
		rVO.setReviewContent(request.getParameter("reviewContent"));
		
		if (rDAO.update(rVO)) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("reviewsDetailPage.do?reviewNum=" + rVO.getReviewNum());
		}
		
		return forward;
	}
	
}
