package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyDAO;
import model.BuyDetailDAO;
import model.BuyDetailVO;
import model.BuyVO;
import model.PaymentDAO;
import model.PaymentVO;
import model.TeaDAO;
import model.TeaVO;

public class paySuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		BuyVO bVO = new BuyVO();
		BuyDAO bDAO = new BuyDAO();
		BuyDetailVO bdVO = new BuyDetailVO();
		BuyDetailDAO bdDAO = new BuyDetailDAO();
		TeaVO tVO = new TeaVO();
		TeaDAO tDAO = new TeaDAO();
		PaymentVO pVO = new PaymentVO();
		PaymentDAO pDAO = new PaymentDAO();
		
		
		ArrayList<TeaVO> buyList = (ArrayList<TeaVO>) session.getAttribute("buyList");
		
		String memberId = (String)session.getAttribute("ssMemberId");
		bVO.setMemberId(memberId);
		
		if(bDAO.insert(bVO)) {
			bdVO.setMemberId(memberId);
			bdVO.setBuySearch("주문번호");
			bdVO = bdDAO.selectOne(bdVO); // 방금 주문한 번호 (buy_num) 저장
			
			
			for (int i = 0; i<buyList.size(); i++) { // 상품 종류만큼 반복
//				tVO.setTeaNum(buyList.get(i).getTeaNum());
//				
//				tDAO.selectOne(tVO); // 으
				bdVO.setTeaNum(buyList.get(i).getTeaNum()); // 구매한 상품 번호 set
				bdVO.setBuyCnt(buyList.get(i).getTeaCnt()); // 구매한 상품 갯수 set
				
				tVO.setTeaNum(buyList.get(i).getTeaNum());
				tVO.setTeaCnt(buyList.get(i).getTeaCnt());
	
				bdDAO.insert(bdVO); // 상세 주문 추가
				tDAO.update(tVO);	// 상품 재고 변경
			}
			pVO.setPaymentName(memberId);
			pVO.setPaymentCustomer(memberId);
			pDAO.insert(pVO);
			session.removeAttribute("buyList");	
			session.removeAttribute("cart");	
		}

		
		forward.setRedirect(false);
		forward.setPath("main.jsp");
		
		return forward;
	}

}
