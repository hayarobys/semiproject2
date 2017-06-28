package bst.ctmz.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bst.ctmz.db.CtmzDAO;
import bst.ctmz.db.CtmzDTO;

public class CtmzUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		CtmzDAO ctmzDAO=new CtmzDAO();
	   	CtmzDTO ctmzDTO=new CtmzDTO();
	   	ActionForward forward=new ActionForward();
	   	boolean result = false;
		
	    String color =request.getParameter("CTMZ_COLOR");
	   	//주문한 상품의 CTMZ_NO 받아온다.
		
	   	
		
	    try{
	    	
			 /*result = ctmzDAO.updateCtmz(color);
			 if(result==false){
		   		System.out.println("게시판 수정 실패");
		   		return null;
		   	 }
		   	 System.out.println("게시판 수정 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath("/kanye/ctmz3.jsp");
		   	 return forward;*/
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	}
	
}
