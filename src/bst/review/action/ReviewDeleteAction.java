package bst.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bst.review.db.YZReviewDAO;
import bst.review.db.YZReviewDTO;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// review.jsp 페이지에서 리뷰글의 삭제 버튼을 누를때 ajax로 호출되는 링크.
		
		System.out.println("\n------------\n");
		
		// 1. 먼저 클라이언트로부터 날아온 JSON포맷의 revNo를 읽어들인다.
		int reviewNo = Integer.parseInt(request.getParameter("revNo"));
		System.out.println("reviewNo: " + reviewNo);
		
		// 2. DB에 reviewNo를 전송하여 삭제를 명령한다.
		YZReviewDAO reviewDAO = new YZReviewDAO();
		boolean result = reviewDAO.deleteReview(reviewNo);
		
		// 3. JSON에 담아 웹페이지로 전송한다.
		JSONObject obj = new JSONObject();
		
		if(result == true){
			System.out.println("리뷰 삭제 성공, 웹페이지로 전송합니다.");
			obj.put("message", "success");
		}else{
			System.out.println("리뷰 삭제 실패, 웹페이지로 전송합니다.");
			obj.put("message", "error");
		}
		
		System.out.println(obj.toString());
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);

		return null;
	}
}
