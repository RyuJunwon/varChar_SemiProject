package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewVO;
import model.TeaDAO;
import model.TeaVO;

public class TeaListPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("\tLog: controller => TeaListPageAction [START]");
		
		ActionForward forward = new ActionForward();
		
		TeaDAO tDAO = new TeaDAO();
		TeaVO tVO = new TeaVO();
		
		int currentPage = 1;
		
		String currentPageStr = request.getParameter("page");
		
		try {
			if (currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);				
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} 
		
		final int pageSize = 6; // 한페이지에 보여줄 행
		final int pageBlock = 2; // 페이징에 나타날 페이지 수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 끝 페이지
		int startRnum = 0; // 시작 rnum
		int endRnum = 0; // 끝 rnum
		int totalCnt = 0; // 총 행 수
		
		
		String teaCategory = request.getParameter("teaCategory");
		tVO.setTeaCategory(teaCategory == null ? "" : teaCategory);
		System.out.println(teaCategory);
		String teaSearchWord = request.getParameter("teaSearchWord");
		tVO.setTeaSearchWord(teaSearchWord == null ? "" : teaSearchWord);
		System.out.println(teaSearchWord);
		
		ArrayList<TeaVO> rdatasTotal = tDAO.selectAll(tVO); // 총 상품 개수	
		totalCnt = rdatasTotal.size();
		
		int totalPageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("\tLog: controller => TeaListPageAction [page: startPage: " + startPage + ", endPage: " + endPage + "]");
		
//		startRnum = (currentPage - 1) * pageSize + 1;
//		endRnum = startRnum + pageSize - 1;
		startRnum = (currentPage - 1) * pageSize;
		endRnum = startRnum + pageSize;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		System.out.println("\tLog: controller => TeaListPageAction: [page: startRnum: " + startRnum + ", endRnum: " + endRnum + "]");
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPageCnt", totalPageCnt);
		request.setAttribute("teaSearchWord", teaSearchWord);
		request.setAttribute("teaCategory", teaCategory);
		
		tVO.setTeaCondition("페이징");
		tVO.setStartRnum(startRnum);
		ArrayList<TeaVO> tdatas = tDAO.selectAll(tVO);
		request.setAttribute("tdatas", tdatas);
		
		System.out.println(tdatas);
		
		forward.setRedirect(false);
		forward.setPath("teaList.jsp");
		
		System.out.println("\tLog: controller => TeaListPageAction [END]");
		return forward;
	}
	
}