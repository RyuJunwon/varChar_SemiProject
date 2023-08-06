package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewDAO;
import model.ReviewVO;

public class UpdateReviewsPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		
		rVO.setReviewNum(Integer.parseInt(request.getParameter("reviewNum")));
		rVO = rDAO.selectOne(rVO);
		System.out.println("로그: UrpAction: " + rVO);
		
		if (rVO != null) {
			request.setAttribute("rdata", rVO);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("reviewUpdatePage.jsp");
		}
		System.out.println(rVO);
		return forward;
	}

}
