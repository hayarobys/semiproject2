package bst.review.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bst.review.db.YZReviewDAO;
import bst.review.db.YZReviewDTO;

public class GetMyReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("\n------------\n");
		
		// 1. 먼저 누가 요청했는지 알아낸다.
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("user_id");
		System.out.println(name + "으로부터의 요청");
		
		// 2. DB에서 해당유저가 쓴 글 중 startId ~ howMany 만큼의 리뷰 데이터를 가져온다.
		int startId = Integer.parseInt(request.getParameter("startId"));
		int howMany = Integer.parseInt(request.getParameter("howMany"));
		System.out.println("startId: " + startId + ", howMany: " + howMany);
		
		YZReviewDAO reviewDAO = new YZReviewDAO();
		List<YZReviewDTO> reviewList = reviewDAO.getMyThumbnailReview(startId, howMany, name);
		
		// 2. JSON에 담아 웹페이지로 전송한다.
		
		JSONObject obj = new JSONObject();
		
		if(reviewList == null){
			System.out.println("리뷰 불러오기 실패, DB로부터 null값을 받았습니다.");
			obj.put("message", "error");
		}else{
			
			if(reviewList.size() != 0){
				System.out.println("리뷰 불러오기 성공, 웹페이지로 전송합니다.");
				obj.put("message", "success");
			}else{
				System.out.println("더이상 불러올 리뷰가 없습니다. 웹페이지로 전송합니다.");
				obj.put("message", "finishdata");
			}
			
			JSONObject jobj = null;
			YZReviewDTO review = null;
			JSONArray jsonArr = new JSONArray();
			
			for(int i = 0; i < reviewList.size(); i++){
				jobj = new JSONObject();
				review = reviewList.get(i);
				
				jobj.put("REVIEW_READCOUNT", review.getREVIEW_READCOUNT());
				jobj.put("REVIEW_RATE", review.getREVIEW_RATE());
				jobj.put("REVIEW_DATE", review.getREVIEW_DATE() + "");	// 얘를 문자열 처리하지 않을경우 JSON객체에 2009-09-10 식으로 담기게 되고 "알 수 없는 숫자" 라는 오류가 발생한다. 그러니 문자열로 감싸자.
				jobj.put("REVIEW_MESSAGE", review.getREVIEW_MESSAGE());
				jobj.put("REVIEW_IMAGE", review.getREVIEW_IMAGE());
				jobj.put("MEM_ID", review.getMEM_ID());
				jobj.put("REVIEW_NO", review.getREVIEW_NO());
				
				jsonArr.add(jobj);				
			}
			
			obj.put("jsonReviewList", jsonArr);
		}
		
		System.out.println(obj.toString());
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
		
		return null;
	}
}
