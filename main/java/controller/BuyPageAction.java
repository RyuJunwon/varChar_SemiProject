package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;
import model.TeaVO;

public class BuyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		MemberVO mVO = new MemberVO();
		MemberDAO mDAO = new MemberDAO();

		//TeaVO tVO = new TeaVO();
		ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");

		int i = 0;
		int total = 0;
		for (TeaVO t : cart) {
			int teaTotal = t.getTeaCnt()*t.getTeaPrice();
			cart.get(i).setTeaTotal(teaTotal);
			total += teaTotal;
			i++;
		}
		
		session.setAttribute("buyList", cart);
		session.setAttribute("total", total);
		
		mVO.setMemberId((String)session.getAttribute("ssMemberId"));
		mVO.setMemberSearch("회원정보변경");
		mVO = mDAO.selectOne(mVO);
		
		System.out.println("BuyPageAction mVO log:" +mVO);
		request.setAttribute("mVO", mVO);
		
		System.out.println("BuyPageAction buyList log:" +cart);
		System.out.println("BuyPageAction total log:" +total);

		forward.setRedirect(false);
		forward.setPath("buy.jsp");

		return forward;
	}

}
