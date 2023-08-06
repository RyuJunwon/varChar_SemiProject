package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyDAO;
import model.BuyVO;

public class BuyListPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		BuyDAO bDAO = new BuyDAO();
		BuyVO bVO = new BuyVO();
		
		HttpSession session = request.getSession();
		
		bVO.setMemberId((String)session.getAttribute("ssMemberId"));
		
		ArrayList<BuyVO> bdatas = bDAO.selectAll(bVO);
		
		request.setAttribute("bdatas", bdatas);
		System.out.println(" log: BuyListPageAction: bdatas: " + bdatas);
		
		forward.setRedirect(false);
		forward.setPath("buyList.jsp");
		
		return forward;
	}
	
}
