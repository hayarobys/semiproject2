/*
 * dummy.html 의 ajax -> Reviewcontroller -> AddDummyAction 순으로 호출되는 클래스
 * 더미 리뷰글의 생성과 DB등록을 전담하며
 * dummy.html 페이지로 성공여부를 반환한다.
 * 
 */

package bst.review.action;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bst.review.db.YZReviewDAO;
import bst.review.db.YZReviewDTO;

/**
 * Servlet implementation class AddDummyAction
 */
public class AddDummyAction implements Action {
	private static final long serialVersionUID = 1L;
	private final int PINTEREST_WIDTH = 235;
	
	private static String[] strArr={
		"이 쇼핑몰 개똥이네요. 신발 완전 잘못샀어요.",
		"장사 이따구로 하지마세요. 환불요청합니다.",
		"이런걸 신발이라고 팔고있나요. 다신 안삽니다.",
		"이런 신발",
		"바닥 쿠션도 좋고 너무 편해요..와이프가 스코노 신발 100% 만족하고 있습니다...굽도 1.6cm 적당하니 좋구요 ~ 색상의 경우 사진과 동일하다고 보시면 됩니다.",
		"신발 상품평보고는 한치수 크게 주문했어야하는데 ..발볼이 넓어서 첨엔 걱정걱정했는데..가죽이 좋아서 그런지 신고 다니니 발에 맞게 늘어나더라구요..근데 저녁되면 발이 살짝 껴요..",
		"번창하세요",
		"여기 망했나요? 사진만 겁나게 많고 신발은 딱 하나 파네",
		"에휴 내 인생 ㅠㅠ",
		"생긴거 그대로 빨리오네요...",
		"전에 여기 신발을 너무 편하게 신어서 이미지가 좋았는데 이건 완전 안살이유가 없는 가격이네요. 역시 발 편하고 이뻐요. 무난하게 신기 좋습니다."
	};
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		YZReviewDAO reviewDAO = new YZReviewDAO();
		String imgName = "";
		String text = "";
		Date date = null;
		
		// 1. jsp 페이지로부터 몇 개 생성할지 입력값 받아옴.
		int genNum = Integer.parseInt( request.getParameter("genNum") );
		System.out.println(genNum + "개의 더미글 생성을 요청받음.");
		int resultCount = 0;
		
		
		for(int i = 0; i < genNum; i++){
			System.out.println("\n----------\n");
			
			// 2. 이미지를 입력받은 갯수만큼 생성하여 원하는 경로에 저장. 중복시엔 이름을 바꿔저장.
			ServletContext context = request.getServletContext();
			String realFolder = context.getRealPath("./reviewupload");
			
			// servers - 톰캣을 더블클릭하여 OVERVIEW 라는 설정창에 들어가서 Serve modules without publishing 을 체크하면 절대경로로 관리된다.
			//					C:\workspaces\jsp\kanye\WebContent\reviewupload
			//
			// 체크 해제할시 저장경로는:		C:\workspaces\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\kanye\reviewupload
			// 내가 저장하고싶은 경로는:		C:\workspaces\jsp\kanye\WebContent\reviewupload
			// 주의사항. 체크해제 할시 저 기~~~다란 경로는 이클립스가 자동으로 지워버린다. 혹시 지워지고 싶지 않는 데이터라면 반드시 백업후에 체크해제하자.
			
			// C:\workspaces\jsp\kanye\WebContent\reviewupload\dummy_img17.png
			String imgPath = generateImage(1, realFolder);
			
			// C:\workspaces\jsp\kanye\reviewupload\dummy_img17.png
			imgPath = imgPath.replace(File.separator + "WebContent", "");
			
			// \kanye\reviewupload\dummy_img17.png
			imgPath = imgPath.substring( imgPath.indexOf(File.separator + "kanye") );
			
			// \dummy_img17.png
			imgName = imgPath.substring(imgPath.lastIndexOf(File.separator));
			
			// 3. 무작위 200자 생성기
			text = generateString();
			
			// 4. 무작위 날짜 생성기(캘린더 -> 데이트 -> sql데이트)
			date = generateDate();
			
			YZReviewDTO reviewDTO = new YZReviewDTO();
			reviewDTO.setMEM_ID("scott");
			reviewDTO.setREVIEW_IMAGE(imgPath);
			reviewDTO.setREVIEW_MESSAGE(text);
			reviewDTO.setREVIEW_DATE(date);
			reviewDTO.setREVIEW_RATE((int)(Math.random() * 5) + 1 );
			reviewDTO.setREVIEW_READCOUNT(0);
			
			
			if(reviewDAO.addReview(reviewDTO) == true){
				System.out.println("resultCount 1 증가");
				resultCount++;
			}
		}	// for()
		
		//System.out.println("json 처리 단계");
		// JSON으로 반환. 라이브러리는 json-simple-1.1.1.jar 사용했음.		
		JSONObject obj = new JSONObject();
		
		if(resultCount == genNum){
			System.out.println("웹페이지로 success 반환");
			obj.put("result", "success. " + resultCount + "개의 리뷰가 DB에 올라갔습니다.");
		}else{
			System.out.println("웹페이지로 fail 반환");
			obj.put("result", "fail. " + resultCount + "개 생성했습니다.");
		}
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
		
		return null;
	}	// execute();
	
	private String generateImage(int genNum, String realPath){
	// 더미 이미지 + 썸네일을 생성하는 메서드
		int originLength = (int)new File(realPath).listFiles().length;
		System.out.println("원본이미지 저장 경로: " + realPath);
		System.out.println("저장 경로에 있는 기존 파일의 수 : " + originLength);
		
		String name="";	// 여기서 부여한 파일 이름 + 확장자
		String pathName="";	// 저장될 경로 + 여기서 부여한 파일 이름 + 확장자
		File fileName;	// pathName 대로 파일 객체를 만든것.
		
		for(int i = originLength; i < genNum + originLength; i++){ 
			int width = (int)(Math.random() * 4000) + 400;
			int height = (int)(Math.random() * 4000) + 600;
			
			BufferedImage buffer = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = buffer.createGraphics();
			graphic.setColor(new Color((int)(Math.random() * 250), (int)(Math.random() * 250), (int)(Math.random() * 250)));
			graphic.fillRect(0, 0, width, height);
			
			// \dummy_img102.png
			name = File.separator + "dummy_img" + i + ".png";
			
			pathName = realPath + name;	// "저장경로/이미지이름.확장자"
			fileName = new File(pathName);
			
			try {
				if(!checkSameFile(fileName, realPath)){ 
				// 이미지 저장에 성공했을 경우 썸네일 저장
					ImageIO.write(buffer, "png", fileName);
					
					// reviewupload 폴더에서 -> reviewthumbnailupload 폴더로 저장경로 변경
					String changePath = replaceLast(pathName, File.separator + "reviewupload", File.separator + "reviewthumbnailupload");
					
					// 썸네일의 가로크기 지정. 세로 크기는 비율에 맞춰 자동 변환됨.
					int thumbWidth = (width > PINTEREST_WIDTH) ? width : PINTEREST_WIDTH; 
					
					ThumbNail.createImage(
							pathName,
							replaceLast(changePath, ".", "_thumbnail."),	// 파일명또한 변경.
							(int)Math.round((double)width / PINTEREST_WIDTH)
					);	// 마지막 인자로 들어가는 숫자는 축소할 배율값임. 2가 들어가면 2배 줄인다는 의미.
					
					
					break;
				}else{
				// 이미지 저장에 실패했을 경우
					// 중복체크를 위해 처음으로 회귀
					pathName = replaceLast(pathName, i + "", (i + 1) + "");
					genNum++;
					continue;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} // for()
		
		System.out.println("원본 이미지 이름 + 확장자: " + name);
		
		return pathName;
	}

	boolean checkSameFile(File file, String path){
	// 파일 중복체크하는 메서드
		return file.isFile();
	}
	
	private String generateString(){
	// 이 클래스의 static 배열에 담긴 리뷰글 데이터에서 무작위 추출하여 반환
		int index = (int)(Math.random() * strArr.length);
		System.out.println("text: " + strArr[index]);
		
		return strArr[index];
	}
	
	private Date generateDate(){
	// 무작위 SQL날짜 데이터 반환(윤년처리x)
		int year = randBetween(2000, 2016);	// generate a year between 2000 and 2016;
		int dayOfYear = randBetween(1, 365);// generate a number between 1 and 365 (or 366 if you need to handle leap year);
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.DAY_OF_YEAR, dayOfYear);
		
		Date randomDate = new Date(calendar.getTime().getTime());
		System.out.println("date: " + randomDate);
		
		return randomDate;
	}
	
	public static int randBetween(int start, int end) {
		// start <= n < end 사이의 무작위 n값을 반환
		return start + (int)Math.round(Math.random() * (end - start));
	}
	
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
