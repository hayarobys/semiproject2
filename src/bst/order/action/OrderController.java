package bst.order.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bst.order.action.Action;
import bst.order.action.ActionForward;
/*import bst.review.action.Action;
import bst.review.action.ActionForward;*/
/**
 * Servlet implementation class OrderController
 */
@WebServlet("*.od")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI=request.getRequestURI();		// 포트번호 이후의 쿼리열 반환
		String contextPath=request.getContextPath();	// 프로젝트명 반환. 
		String command=RequestURI.substring(contextPath.length());
		
		System.out.println("\n------------\n");
		
		System.out.println("ip: " + request.getRemoteAddr());
		System.out.println("RequestURI: " + RequestURI);
		System.out.println("contextPath: " + contextPath);
		System.out.println("command: " + command);
		
		/*
		 * RequestURI: /Model2-Board/BoardWrite.bo
		 * contextPath: /Model2-Board
		 * command: /BoardWrite.bo
		 * */
		
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/GetOrderListAction.od")){
		// 리뷰 페이지로 이동.
			System.out.println("/mypage_order_history.html로부터 요청받음");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./mypage/mypage_order_history.html");
			
		}else if(command.equals("/OrderListAction.od")){
			System.out.println("/OrderListAction.od 요청받음");
			action = new OrderListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/OrderAdminList.od")){
			System.out.println("/OrderAdminList.od 요청받음");
			action = new OrderAdminList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		};		
			
		
		
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}else{
			return;
		}
	}
}

