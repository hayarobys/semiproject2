package bst.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.me")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\ndoGet call");
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\ndoPost call");
		doProcess(request,response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String RequestURI=request.getRequestURI();	// 포트번호 이후의 쿼리열 반환
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
		
		if(command.equals("/loginCheck.me")){
		// 리뷰 페이지로 이동.
			System.out.println("/loginCheck.me 요청받음");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/loginCheck.jsp");
			
		}else if(command.equals("/logout.me")){
		// 로그아웃 버튼 클릭시 로그아웃 처리 페이지로 이동.
			System.out.println("/logout.me 요청받음");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/logout.jsp");
			
		}else if(command.equals("/MemAdminList.me")){
			// DB로부터 리뷰  List 읽어들여 전송
			System.out.println("/MemAdminList.me 요청받음");
			action = new MemListAction();//왜 에러가 나는 지 모르겠음...
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/login.me")){
		// 로그인 페이지로 이동.
			System.out.println("/login.me 요청받음");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login.jsp");
		}else if (command.equals("/MemberJoin.me")) {
			action = new MemberJoin();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MyInfoAction.me")){
	         //내정보 읽기
	         System.out.println("/MyInfoAction.me 요청받음");
	         action = new MyInfoAction();
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
