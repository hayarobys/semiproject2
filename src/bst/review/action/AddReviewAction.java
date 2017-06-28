package bst.review.action;

import java.io.File;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bst.review.db.YZReviewDAO;
import bst.review.db.YZReviewDTO;

public class AddReviewAction implements Action {
	private final int PINTEREST_WIDTH = 235;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 1. 클라이언트로부터 입력데이터를 읽어들여 DTO에 저장.
		YZReviewDTO reviewDTO = new YZReviewDTO();
		HttpSession session = request.getSession();
		
		String realFolder="";	// 이미지를 저장할 절대경로
   		String saveFolder="/reviewupload";	// 이미지를 저장할 상대경로
   		boolean result = false;
   		int fileSize=10 * 1024 * 1024;	// 10mb까지 업로드 가능.
   		String imgName = null;
   		JSONObject obj = new JSONObject();;
   		
   		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
   		System.out.println("이미지 저장 경로: " + realFolder);
		
   		try{
	   		MultipartRequest multi = new MultipartRequest(
	   				request,	// 여기로부터 파일을 읽어들여
					realFolder,	// 여기에 저장할 것이며
					fileSize,	// 내가 허용할 최대 용량은 이렇다.
					"utf-8",	// 파일 포맷은 이렇게 읽어들일것이며
					new DefaultFileRenamePolicy()	// 저장경로에 중복이름이 있을경우 여기 정의된대로 이름변경을 하겠다.
			);
	   				
	   				
			
			System.out.println("리뷰레이트: " + multi.getParameter("ratetext2"));
			
			reviewDTO.setMEM_ID((String)session.getAttribute("user_id"));
			
			// \8217007636.jpg
			imgName = File.separator +
					multi.getFilesystemName(
							(String)multi.getFileNames().nextElement()
					);
			
			// \kanye\reviewupload\8217007636.jpg
			reviewDTO.setREVIEW_IMAGE(
					File.separator + "kanye" +
					File.separator + "reviewupload" + imgName
			);
			reviewDTO.setREVIEW_RATE(Integer.parseInt(multi.getParameter("ratetext2")));
			reviewDTO.setREVIEW_MESSAGE(multi.getParameter("message"));
			reviewDTO.setREVIEW_DATE(new java.sql.Date(new java.util.Date().getTime()));
			reviewDTO.setREVIEW_READCOUNT(0);
			
			System.out.println("reviewDTO: " + reviewDTO);
			
			// 2. DTO를 DAO에 전송하여 DB등록.
			YZReviewDAO reviewDAO = new YZReviewDAO();
			result = reviewDAO.addReview(reviewDTO);
			
			// 3. JSON으로 성공여부 반환. 라이브러리는 json-simple-1.1.1.jar 사용했음.	
			
   		}catch(NoSuchElementException e){
   			System.out.println("아무 입력값 없이 등록요청만 들어왔습니다. 팅겨내겠습니다.");
   		}
		if(result == true){
			// 4. 업로드에 성공했을시 썸네일 이미지 생성
			
			// C:\workspaces\jsp\kanye\WebContent\reviewupload\8217007636.jpg
			String fullPath = realFolder + imgName;
			
			// C:\workspaces\jsp\kanye\WebContent\reviewthumbnailupload\8217007636.jpg
			String changePath = replaceLast(fullPath, File.separator + "reviewupload", File.separator + "reviewthumbnailupload");
			
			int width = new ImageIcon(fullPath).getImage().getWidth(null);
			System.out.println("이미지 가로 길이: " + width);
			ThumbNail.createImage(
					fullPath,
					replaceLast(changePath, ".", "_thumbnail."),
					(int)Math.round((double)width / PINTEREST_WIDTH)
			);
			
			System.out.println("웹페이지로 success 반환");
			obj.put("result", "success. 한 개의 리뷰가 DB에 올라갔습니다.");
		}else{
			System.out.println("웹페이지로 fail 반환");
			obj.put("result", "fail. 리뷰 등록에 실패했습니다.");
		}
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
		
		return null;
	}	// execute()
	
	public static String replaceLast(String string, String toReplace, String replacement) {    
	// string 에서 마지막에 있는 toReplace를 replacement로 교체.
	// 사용예시:	String str = "안녕 사랑아, 나는 너를 사랑해.";
	//		replaceLast.(str, "사랑", "증오");
	//		System.out.println(str);	-> "안녕 사랑아, 나는 너를 증오해."
	
		   int pos = string.lastIndexOf(toReplace);
		   if (pos > -1) {
			   return string.substring(0, pos)+ replacement + string.substring(pos + toReplace.length(), string.length());
		   }else{ 
			   return string;
		   }
	}
}
