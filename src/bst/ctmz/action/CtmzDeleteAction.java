package bst.ctmz.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bst.ctmz.db.CtmzDAO;

public class CtmzDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		CtmzDAO ctmzDAO = new CtmzDAO();
		String color = request.getParameter("color");
		
		boolean result = false;
		
		result = ctmzDAO.deleteCtmz(color);
		if(result==false){
	   		System.out.println("상품 삭제 실패");
	   		return null;
	   	}
	   	
	   	System.out.println("상품 삭제 성공");
	   	forward.setRedirect(true);
   		forward.setPath("/myPage/mypage_admin_ctmzlist.jsp");
   		return forward;
	}
	
}
