package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyDetailDAO;
import model.BuyDetailVO;
import model.ReviewDAO;
import model.ReviewVO;
import model.TeaDAO;
import model.TeaVO;

public class InsertReviewsPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		ReviewVO rVO = new ReviewVO();
		
		BuyDetailDAO bdDAO = new BuyDetailDAO();
		BuyDetailVO bdVO = new BuyDetailVO();
		
		TeaVO tVO = new TeaVO();
		TeaDAO tDAO = new TeaDAO();
		
		HttpSession session = request.getSession();
		
		rVO.setMemberId((String)session.getAttribute("ssMemberId"));
		rVO.setBuySerial(Integer.parseInt(request.getParameter("buySerial")));
		
		bdVO.setBuySerial(Integer.parseInt(request.getParameter("buySerial")));
		bdVO.setBuySearch("주문상세");
		bdVO = bdDAO.selectOne(bdVO);
		tVO.setTeaNum(bdVO.getTeaNum());
		
		tVO = tDAO.selectOne(tVO);
		request.setAttribute("rdata", rVO);
		request.setAttribute("tdatas", tVO);
		request.setAttribute("bddatas", bdVO);
		
		System.out.println("InsertReviewsPageAction buySerial 로그: " + bdVO);
		System.out.println("InsertReviewsPageAction buySerial 로그: " + tVO);
		System.out.println("InsertReviewsPageAction buySerial 로그: "+request.getParameter("buySerial"));
		System.out.println("InsertReviewsPageAction buySerial 로그: "+rVO);
		
		forward.setRedirect(false);
		forward.setPath("insertReviewsPage.jsp");
		
		return forward;
	}
	
}
