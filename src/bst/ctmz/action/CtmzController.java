package bst.ctmz.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bst.ctmz.action.Action;
import bst.ctmz.action.ActionForward;

@WebServlet("*.ct")
public class CtmzController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CtmzController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();		// 포트번호 이후의 쿼리열 반환
		String contextPath=request.getContextPath();	// 프로젝트명 반환. 
		String command=RequestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/CtmzListAction.ct")){
			// DAO의 listCtmz메소드로 리스트 받아오고나서 -> 주문 페이지로 이동.
				System.out.println("/CtmzListAction.ct 요청받음");
				action = new CtmzListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}else if(command.equals("/CtmzMyListAction.ct")){
			// DB로부터 리뷰  List 읽어들여 전송
				System.out.println("/CtmzMyListAction.ct 요청받음");
				action = new CtmzMyListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/CtmzAdminList.ct")){
			// DB로부터 리뷰  List 읽어들여 전송
				System.out.println("/CtmzAdminList.ct 요청받음");
				action = new CtmzAdminList();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/CtmzDeleteAction.ct")){
			// DB로부터 리뷰  List 읽어들여 전송
				System.out.println("/CtmzDeleteAction.ct 요청받음");
				action = new CtmzDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}else if(command.equals("/CtmzAddAction.ct")){
			// 더미리뷰 생성 페이지로 이동
				System.out.println("/CtmzAddAction.ct 요청받음");
				action = new CtmzAddAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}else if(command.equals("/CtmzUpdateAction.ct")){
			// 더미글 생성 및 DB등록
				System.out.println("/CtmzUpdateAction.ct 요청받음");
				action = new CtmzUpdateAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}else if(command.equals("/OrderAddAction.ct")){
				System.out.println("/OrderAddAction.ct 요청받음");
				action = new OrderAddAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
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
