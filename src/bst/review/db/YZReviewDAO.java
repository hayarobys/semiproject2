/*
 * 이클립스상에서 WebContent - META-INF에 context.xml을 반드시 넣을 것.
 * 내용은 아래와 같음.
 * 
	<Context> 
		<Resource
			name="jdbc/OracleDB" 
			auth="Container"
			type="javax.sql.DataSource" 
			username="scott" 
			password="tiger"
			driverClassName="oracle.jdbc.driver.OracleDriver"
			url="jdbc:oracle:thin:@localhost:1521:xe"
			maxActive="500" 
			maxIdle="100"
		/>
	 </Context>
 * 
 */

package bst.review.db;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bst.review.action.AddDummyAction;

public class YZReviewDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public YZReviewDAO() {
		try{
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean deleteReview(int reviewNo){
		String delete_sql="DELETE FROM YZREVIEW WHERE REVIEW_NO = ?";
		
		int result = 0;
		
		try{
			con = ds.getConnection();
			pstmt=con.prepareStatement(delete_sql);
			pstmt.setInt(1, reviewNo);
			result=pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			
			return true;
		}catch(SQLException e){
			System.out.println("deleteReview 에러: " + e);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null) con.close();
			}catch(SQLException e){}
		}
		
		return false;
	}
	
	public boolean addReview(YZReviewDTO reviewDTO){
	// DB에 리뷰글을 등록하는 메서드
		System.out.println("addReview 메서드 진입");
		
		int num = 0;
		String sql="";
		int result = 0;
		
		try {
			con = ds.getConnection();
			// DB에 저장된 리뷰등록번호 중 가장 큰 값을 가져옴.
			pstmt=con.prepareStatement("SELECT MAX(REVIEW_NO) FROM YZREVIEW");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;	// 새로 등록할 리뷰글의 번호
			}else{
				num = 1;
			}
			
			sql =		"INSERT INTO YZREVIEW(REVIEW_NO, REVIEW_IMAGE, REVIEW_MESSAGE"
				+	", REVIEW_DATE, REVIEW_RATE, REVIEW_READCOUNT, MEM_ID"
				+	")VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, reviewDTO.getREVIEW_IMAGE());
			pstmt.setString(3, reviewDTO.getREVIEW_MESSAGE());
			pstmt.setDate(4, reviewDTO.getREVIEW_DATE());
			pstmt.setInt(5, reviewDTO.getREVIEW_RATE());
			pstmt.setInt(6, reviewDTO.getREVIEW_READCOUNT());
			pstmt.setString(7, reviewDTO.getMEM_ID());
			
			result = pstmt.executeUpdate();
			if(result == 0){
				System.out.println("DB에 리뷰등록 실패");
				return false;
			}
			System.out.println("DB에 리뷰등록 성공");
			
			return true;
		} catch (SQLException e) {
			System.out.println("YZReviewDAO - addReview 에러 : "+e);
		} finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return false;
	}
	
	public YZReviewDTO getReview(int review_no){
		String sql = "SELECT * FROM YZREVIEW WHERE REVIEW_NO = ?";
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_no);
			rs = pstmt.executeQuery();
			
			rs.next();
			YZReviewDTO reviewDTO = new YZReviewDTO();
			reviewDTO.setREVIEW_NO(rs.getInt("REVIEW_NO"));
			reviewDTO.setMEM_ID(rs.getString("MEM_ID"));
			reviewDTO.setREVIEW_MESSAGE(rs.getString("REVIEW_MESSAGE"));
			reviewDTO.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			reviewDTO.setREVIEW_RATE(rs.getInt("REVIEW_RATE"));
			reviewDTO.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
			reviewDTO.setREVIEW_IMAGE(rs.getString("REVIEW_IMAGE"));
			
			return reviewDTO;
		}catch (SQLException e) {
			System.out.println("ReviewDAO에서 getThumbnailReview() 작업중 에러 : " + e);
			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return null;
	}
	
	public List getMyThumbnailReview(int startId, int howMany, String name){
	// DB로부터 name 유저의 이미지 + 리뷰글을  List 형태로 받아오는 메서드
		String yzreview_list_sql =
				"SELECT * FROM (SELECT ROWNUM RNUM, MEM_ID, "
			+	"REVIEW_NO, REVIEW_IMAGE, REVIEW_MESSAGE, REVIEW_DATE, REVIEW_RATE,"
			+	"REVIEW_READCOUNT FROM YZREVIEW ORDER BY REVIEW_NO DESC"
			+	") WHERE RNUM >= ? AND RNUM <= ? AND MEM_ID = ?";
	
		List list = new ArrayList();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(yzreview_list_sql);
			pstmt.setInt(1, startId);
			pstmt.setInt(2, startId + howMany);
			pstmt.setString(3, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				YZReviewDTO reviewDTO = new YZReviewDTO();
				reviewDTO.setREVIEW_NO(rs.getInt("REVIEW_NO"));
				reviewDTO.setMEM_ID(rs.getString("MEM_ID"));
				reviewDTO.setREVIEW_MESSAGE(rs.getString("REVIEW_MESSAGE"));
				reviewDTO.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				reviewDTO.setREVIEW_RATE(rs.getInt("REVIEW_RATE"));
				reviewDTO.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				
				
				String orgImg = rs.getString("REVIEW_IMAGE");
				String thumbnailImg = AddDummyAction.replaceLast(
						orgImg.replace(File.separator + "reviewupload", File.separator + "reviewthumbnailupload")
						, ".", "_thumbnail."
				);
				
				// \kanye\reviewupload\dummy_img94.png
				System.out.println("DB에서 가져온 image 주소: " + orgImg);
				
				// \kanye\reviewthumbnailupload\dummy_img94_thumbnail.png
				System.out.println("클라이언트에 전송할 image 주소: " + thumbnailImg);
				
				reviewDTO.setREVIEW_IMAGE(thumbnailImg);
				
				list.add(reviewDTO);
			}
			
			return list;
		} catch (SQLException e) {
			System.out.println("ReviewDAO에서 getMyThumbnailReview() 작업중 에러 : " + e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return null;	
		
	}
	
	public List getThumbnailReview(int startId, int howMany){
	// DB로부터 썸네일 이미지 + 리뷰글을 List 형태로 받아오는 메서드
		String yzreview_list_sql =
					"SELECT * FROM (SELECT ROWNUM RNUM, MEM_ID, "
				+	"REVIEW_NO, REVIEW_IMAGE, REVIEW_MESSAGE, REVIEW_DATE, REVIEW_RATE,"
				+	"REVIEW_READCOUNT FROM YZREVIEW ORDER BY REVIEW_NO DESC"
				+	") WHERE RNUM >= ? AND RNUM <= ?";
	/*
		SELECT * FROM (
			SELECT
				ROWNUM RNUM,
				MEM_ID,
				REVIEW_NO,
				REVIEW_IMAGE,
				REVIEW_MESSAGE,
				REVIEW_DATE,
				REVIEW_RATE,
				REVIEW_READCOUNT
			FROM YZREVIEW ORDER BY REVIEW_NO DESC
		)WHERE RNUM >= 470 AND RNUM <= 600;
	 
	 */

		List list = new ArrayList();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(yzreview_list_sql);
			pstmt.setInt(1, startId);
			pstmt.setInt(2, startId + howMany);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				YZReviewDTO reviewDTO = new YZReviewDTO();
				reviewDTO.setREVIEW_NO(rs.getInt("REVIEW_NO"));
				reviewDTO.setMEM_ID(rs.getString("MEM_ID"));
				reviewDTO.setREVIEW_MESSAGE(rs.getString("REVIEW_MESSAGE"));
				reviewDTO.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				reviewDTO.setREVIEW_RATE(rs.getInt("REVIEW_RATE"));
				reviewDTO.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				
				
				String orgImg = rs.getString("REVIEW_IMAGE");
				String thumbnailImg = AddDummyAction.replaceLast(
						orgImg.replace(File.separator + "reviewupload", File.separator + "reviewthumbnailupload")
						, ".", "_thumbnail."
				);
				
				// \kanye\reviewupload\dummy_img94.png
				System.out.println("DB에서 가져온 image 주소: " + orgImg);
				
				// \kanye\reviewthumbnailupload\dummy_img94_thumbnail.png
				System.out.println("클라이언트에 전송할 image 주소: " + thumbnailImg);
				
				reviewDTO.setREVIEW_IMAGE(thumbnailImg);
				
				list.add(reviewDTO);
			}
			
			return list;
		} catch (SQLException e) {
			System.out.println("ReviewDAO에서 getThumbnailReview() 작업중 에러 : " + e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return null;
	}
}














