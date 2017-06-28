/*
	리뷰 관련 요청을 처리하기 위한 컨트롤러.
	일부 AJAX 통신은 이 컨트롤러를 거치지 않고 처리된다.
*/

package bst.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.rv")
public class ReviewController extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
									throws ServletException, IOException {
		System.out.println("\ndoGet call");
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
									throws ServletException, IOException {
		System.out.println("\ndoPost call");
		doProcess(request,response);
	}	
	 
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
									throws ServletException, IOException {
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
		
		if(command.equals("/review.rv")){
		// 리뷰 페이지로 이동.
			System.out.println("/review.rv 요청받음");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/review.jsp");
			
		}else if(command.equals("/GetReviewListAction.rv")){
		// DB로부터 리뷰  List 읽어들여 전송
			System.out.println("/GetReviewListAction.rv 요청받음");
			action = new GetReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/GetReviewAction.rv")){
		// DB로부터 하나의 리뷰글 읽어들여 전송
			System.out.println("/GetReviewAction.rv 요청받음");
			action = new GetReviewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ReviewDeleteAction.rv")){
			System.out.println("/ReviewDeleteAction.rv 요청받음");
			action = new ReviewDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/dummy.rv")){
		// 더미리뷰 생성 페이지로 이동
			System.out.println("/dummy.rv 요청받음");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/dummy.html");
			
		}else if(command.equals("/AddDummyAction.rv")){
		// 더미글 생성 및 DB등록
			System.out.println("/AddDummyAction.rv 요청받음");
			action = new AddDummyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/kanye/AddReviewAction.rv")){
		// 리뷰글 등록
			System.out.println("/AddReviewAction.rv 요청받음");
			action = new AddReviewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/GetMyReviewListAction.rv")){
			// DB로부터 한 명의 리뷰  List 읽어들여 전송
			System.out.println("/GetMyReviewListAction.rv 요청받음");
			action = new GetMyReviewListAction();
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