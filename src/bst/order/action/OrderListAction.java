package bst.order.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bst.order.db.YZOrderDAO;

public class OrderListAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response){
		ActionForward forward=new ActionForward();
		
		try{
			
			HttpSession session = request.getSession();
			String id =(String)session.getAttribute("user_id");
			System.out.println("액션실행");
			/*if(id==null){			
				forward.setRedirect(true);
				forward.setPath("./로그인페이지연결액션");
				return forward;
			}*/
			
			
/*			String user_id = "";
			int user_grade = -1;

			try{
				user_id = (String)session.getAttribute("user_id");
				user_grade = (int)session.getAttribute("user_grade");
			}catch(NullPointerException e){
				System.out.println("비로그인 유저의 접속입니다.");
				response.sendRedirect("/kanye/member/login.jsp");
			}*/
			
			
			
			
			
			
			YZOrderDAO order=new YZOrderDAO();
			List goods_order_list=new ArrayList();
		
			System.out.println("아이디는");
			System.out.println(id);
		
			goods_order_list = order.getOrderList(id);
			request.setAttribute("goods_order_list", goods_order_list);
			forward.setRedirect(false);
			forward.setPath("./myPage/mypage_order_history.jsp");
			return forward;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	 } 
}