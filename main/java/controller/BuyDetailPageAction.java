package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyDetailDAO;
import model.BuyDetailVO;
import model.ReviewDAO;
import model.ReviewVO;

public class BuyDetailPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		BuyDetailDAO bdDAO = new BuyDetailDAO();
		BuyDetailVO bdVO = new BuyDetailVO();
		
		bdVO.setBuyNum(Integer.parseInt(request.getParameter("buyNum")));
		
		bdVO.setBuySearch("주문상세");
		ArrayList<BuyDetailVO> bddatas = bdDAO.selectAll(bdVO);
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		
		if (bddatas != null) {
			rVO.setReviewSearch("리뷰확인");
			for (BuyDetailVO bddata : bddatas) {
				bddata.setReviewDone(false);
				rVO.setBuySerial(bddata.getBuySerial());
				if (rDAO.selectOne(rVO) == null) {
					bddata.setReviewDone(true);
					System.out.println("BuyDetailPageAction rVO null 로그 : "+rDAO.selectOne(rVO));
				}
				else {
					System.out.println("BuyDetailPageAction rVO Not null  로그 : "+rDAO.selectOne(rVO));
					
				}
			}
			request.setAttribute("bddatas", bddatas);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("buyDetail.jsp");
		}
		
		return forward;
	}
	
}
