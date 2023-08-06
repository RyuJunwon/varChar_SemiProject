package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FavorDAO;
import model.FavorVO;
import model.ReviewDAO;
import model.ReviewSet;
import model.ReviewSetDAO;
import model.ReviewVO;
import model.TeaDAO;
import model.TeaVO;

public class TeaDetailPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		TeaDAO tDAO = new TeaDAO();
		TeaVO tVO = new TeaVO();
		
		FavorDAO fDAO = new FavorDAO();
		FavorVO fVO = new FavorVO();
		
		ReviewSetDAO rsDAO = new ReviewSetDAO();
		ReviewSet rsVO = new ReviewSet();
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		
		int favor = 0;
		
		System.out.println(request.getParameter("teaNum"));
		
		tVO.setTeaNum(Integer.parseInt(request.getParameter("teaNum")));
		tVO = tDAO.selectOne(tVO);

		rVO.setSearchName("REVIEW");
		rVO.setReviewSearch(tVO.getTeaName());
		ArrayList<ReviewVO> rdatas = rDAO.selectAll(rVO);
		int reviewCnt = rdatas.size();
		
		HttpSession session = request.getSession();
		fVO.setMemberId((String)session.getAttribute("ssMemberId"));
		fVO.setTeaNum(Integer.parseInt(request.getParameter("teaNum")));
		
		if(fDAO.selectOne(fVO) != null) {
			favor = 1;
		}
		
		System.out.println("로그 selctOne 결과:" + tVO);
		System.out.println("로그 forward 결과:" + forward);
		
		ArrayList<ReviewSet> rsdatas = null;
		
		String count = request.getParameter("count");
		
		if (count == null || count.isEmpty() || count.isBlank() || count.equals("")) {
			count = "4";
		}
		int cnt = Integer.parseInt(count);
		
		tVO.setStartRnum(cnt);
		
		if (tVO != null) {
			// 리뷰 형태 결정 후
			// 해당 상품 리뷰도 같이 추출
			rsVO.setTea(tVO);
			rsdatas = rsDAO.selectAll(rsVO);
			request.setAttribute("tdata", tVO);
			request.setAttribute("rsdatas", rsdatas);
			request.setAttribute("favor", favor);
			request.setAttribute("count", cnt);
			request.setAttribute("reviewCnt", reviewCnt);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("teaDetail.jsp");
		}
		return forward;
	}
	
}