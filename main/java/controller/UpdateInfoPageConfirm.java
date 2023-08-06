package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlertVO;

public class UpdateInfoPageConfirm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		AlertVO saVO = new AlertVO("회원정보변경", "변경하시겠습니까?", "회원정보변경이 완료되었습니다!", "question", "updateInfo.do");
		
		return forward;
	}

}
