package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlertVO;

public class DeleteReviewsPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		
		AlertVO saVO = new AlertVO("후기삭제", "후기를 삭제하시겠습니까?", null, "question", "deleteReviews.do?reviewNum="+reviewNum);
		
		request.setAttribute("sa", saVO);
		forward.setPath("alertChoose.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
