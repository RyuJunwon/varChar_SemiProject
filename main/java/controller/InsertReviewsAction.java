package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AlertVO;
import model.BuyDetailDAO;
import model.BuyDetailVO;
import model.ReviewDAO;
import model.ReviewVO;
import model.TeaDAO;
import model.TeaVO;

public class InsertReviewsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		HttpSession session = request.getSession();
		
		rVO.setMemberId((String)session.getAttribute("ssMemberId"));
		rVO.setBuySerial(Integer.parseInt(request.getParameter("buySerial")));
		rVO.setReviewContent(request.getParameter("reviewContent"));
		
		
		if(rDAO.insert(rVO)) {
			forward = new ActionForward();
			AlertVO saVO = new AlertVO("후기작성", "후기작성완료!", null, "success", "reviewsListPage.do?searchName=ALL");
			request.setAttribute("sa", saVO);
			forward.setRedirect(false);
			forward.setPath("alertTrue.jsp"); 
		}
		
		return forward;
	}
	
}
