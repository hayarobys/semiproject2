/*
 * 썸네일 이미지 생성을 위해 DummyGenerator의 createImage()와 AddReviewAction의 execute() 에서 호출되는 클래스.
 * JAI 라이브러리를 사용한다.
 * 
 * - 등록법 -
 * 이클립스 기준 WebContent - WEB-INF - lib폴더에
 * jai_codec.jar / jai-core.jar
 * 2개의 파일을 넣고 프로젝트명 우클릭 - Build Path - Configure Build Path... 클릭
 * 바로 열리는 Libraries 탭에서 Add JARs... 클릭하여 방금 넣어준 2개의 파일을 일일이 선택 등록.
 * 
 * */

package bst.review.action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

public class ThumbNail {
	public ThumbNail(){}
	/*
		String originFile="";	// 원본 이미지 파일 경로(이름, 확장자 포함)
		String thumbFile="";	// 생성될 썸네일 이미지 파일 경로(이름, 확장자 포함)
		int zoom=1;		// 축소할 비율. 5를 쓰면 5배 줄이겠다는 의미.
	*/
	public static void createImage(String originFile, String saveFile, int zoom) throws IOException{
		RenderedOp render = JAI.create("fileload", originFile);	// 원본 이미지에 대한 RenderedOp 객체 생성
		BufferedImage bi = render.getAsBufferedImage();	// BufferedImage 객체를 얻어옴.
		
		if(zoom <= 0) zoom = 1;	// 축소비율은 0이 될 수 없다.
		int width = bi.getWidth() / zoom;
		int height = bi.getHeight() / zoom;
		
		BufferedImage bufferImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);	// 썸네일을 그려넣을 가상이미지 생성
		Graphics2D g2 = bufferImg.createGraphics();	// Graphics2D 객체 생성
		g2.drawImage(bi, 0, 0, width, height, null);	// 가상 썸네일에 원본을 축소한 그림을 그려넣음.
		
		File thum = new File(saveFile);	// 썸네일 이미지에 대한 파일 객체 생성
		ImageIO.write(bufferImg, "png", thum);	// 그려진 이미지를 파일로 채움.
		System.out.println("썸네일 저장경로: " + saveFile);
		
	}
}	// Thumbnail
