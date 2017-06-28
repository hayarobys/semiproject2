package bst.ctmz.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bst.ctmz.db.CtmzDAO;
import bst.member.db.YZOrderDTO;


public class OrderAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		CtmzDAO ctmzDAO=new CtmzDAO();
		
		//String sql_get_ctmz_no = "SELECT CTMZ_NO FROM YZCUSTOMIZE WHERE CTMZ_COLOR=?";
		
		
		
		
		YZOrderDTO orderDTO=new YZOrderDTO();
	   	ActionForward forward=new ActionForward();
	   	HttpSession session=request.getSession();
	   	boolean result=false;
		
	   	
	   	
	   	
	   	orderDTO.setORDER_NO(0);//이거는 순서대로 차곡차곡 넣는 거.
	   	orderDTO.setCTMZ_NO(ctmzDAO.findCtmzNo(request.getParameter("color")));
		orderDTO.setMEM_ID((String)session.getAttribute("user_id"));//id값은 아직...
	   	orderDTO.setORDER_STATUS(0);
	   	orderDTO.setORDER_PHONE(Integer.parseInt(request.getParameter("phone")));
	   	orderDTO.setORDER_ADDRESS(request.getParameter("address"));
	   	orderDTO.setORDER_NAME(request.getParameter("name"));
	   	orderDTO.setORDER_MESSAGE(request.getParameter("message"));
	   	orderDTO.setORDER_SIZE(Integer.parseInt(request.getParameter("size")));
		
	   	result = ctmzDAO.addOrder(orderDTO);
	   	
	   	if(result==false){
   			System.out.println("주문 등록 실패");
   			return null;
   		}
   		System.out.println("주문 등록 완료");
   		
   		forward.setRedirect(true);
   		forward.setPath("./customizing/ctmz3.jsp");
   		return forward;
	}


}
