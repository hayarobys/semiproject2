package bst.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bst.review.db.YZReviewDAO;
import bst.review.db.YZReviewDTO;

public class GetReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// review.jsp 페이지에서 리뷰글을 클릭할때 ajax에 의해 호출되는 링크.
		
		System.out.println("\n------------\n");
		
		// 1. 먼저 클라이언트에게 날아온 JSON으로부터  REVIEW_NO를 읽어온다.
		int reviewNo = Integer.parseInt(request.getParameter("revNo"));
		System.out.println("reviewNo: " + reviewNo);
		
		// 2. DB로부터 reviewNo의 글을 읽어온다.
		YZReviewDAO reviewDAO = new YZReviewDAO();
		YZReviewDTO review = reviewDAO.getReview(reviewNo);
		
		// 3. JSON에 담아 웹페이지로 전송한다.
		JSONObject obj = new JSONObject();
		
		if(review != null){
			System.out.println("리뷰 불러오기 성공, 웹페이지로 전송합니다.");
			obj.put("message", "success");
			
			obj.put("REVIEW_READCOUNT", review.getREVIEW_READCOUNT());
			obj.put("REVIEW_RATE", review.getREVIEW_RATE());
			obj.put("REVIEW_DATE", review.getREVIEW_DATE() + "");	// 얘를 문자열 처리하지 않을경우 JSON객체에 2009-09-10 식으로 담기게 되고 "알 수 없는 숫자" 라는 오류가 발생한다. 그러니 문자열로 감싸자.
			obj.put("REVIEW_MESSAGE", review.getREVIEW_MESSAGE());
			obj.put("REVIEW_IMAGE", review.getREVIEW_IMAGE());
			obj.put("MEM_ID", review.getMEM_ID());
			obj.put("REVIEW_NO", review.getREVIEW_NO());
			
		}else{
			System.out.println("리뷰 불러오기 실패, 웹페이지로 전송합니다.");
			obj.put("message", "error");
		}
		
		System.out.println(obj.toString());
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);

		return null;
	}	// execute()
}	// GetReviewAction{}
