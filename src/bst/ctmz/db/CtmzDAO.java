package bst.ctmz.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bst.member.db.YZOrderDTO;

public class CtmzDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public CtmzDAO(){
		
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("db연결 성공!");
		} catch (Exception e) {
			System.out.println("db연결 실패...:"+e);
			return;
		}
		
	}
	
	public boolean addCtmz(CtmzDTO ctmzDTO){
		//admin이 상품을 추가하는 메소드.
		System.out.println("addCtmz 메소드 진입");
		
		int num = 0;
		String sql="";
		int result = 0;
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT MAX(CTMZ_NO) FROM YZCUSTOMIZE");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1;
			} else {
				num = 1;
			} //새로 등록할 상품의 번호 num값에 담는다.
			
			sql = "INSERT INTO YZCUSTOMIZE(CTMZ_NO, CTMZ_MODEL, "
					+ "CTMZ_COLOR, "
					+ "CTMZ_PRICE, "
					+ "CTMZ_IMAGE1,CTMZ_IMAGE2"
					+	")VALUES(?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, ctmzDTO.getCTMZ_MODEL());
			pstmt.setString(3, ctmzDTO.getCTMZ_COLOR());
			pstmt.setInt(4, ctmzDTO.getCTMZ_PRICE());
			pstmt.setString(5, ctmzDTO.getCTMZ_IMAGE1());
			pstmt.setString(6, ctmzDTO.getCTMZ_IMAGE2());
			
			result = pstmt.executeUpdate();
			
			if(result ==0){
				System.out.println("DB(CTMZ_TABLE)에 상품등록 실패");
				return false;
			} else {
				System.out.println("DB(CTMZ_TABLE)에 상품등록 성공");
			}
			return true;
			
		} catch (SQLException e) {
			System.out.println("CtmzDAO - addCtmz 에러 : "+e);
		} finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	public List listCtmz(){//ctmz 페이지에 size, color, image 전송
		
		String list_sql = "SELECT * FROM YZCUSTOMIZE";
		
		List<CtmzDTO> list = new ArrayList<CtmzDTO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(list_sql);
			rs = pstmt.executeQuery();
			System.out.println("알파");
			while(rs.next()){
				
				CtmzDTO ctmzDTO = new CtmzDTO();
				ctmzDTO.setCTMZ_NO(rs.getInt("CTMZ_NO"));
				ctmzDTO.setCTMZ_MODEL(rs.getString("CTMZ_MODEL"));
				ctmzDTO.setCTMZ_PRICE(rs.getInt("CTMZ_PRICE"));
				ctmzDTO.setCTMZ_COLOR(rs.getString("CTMZ_COLOR"));
				ctmzDTO.setCTMZ_IMAGE1(rs.getString("CTMZ_IMAGE1"));
				ctmzDTO.setCTMZ_IMAGE2(rs.getString("CTMZ_IMAGE2"));
				//size, color, image 만 db에서 받아와서 전송.
				System.out.println(rs.getString("CTMZ_IMAGE2"));
				list.add(ctmzDTO);
			}
			
			return list;
		} catch (SQLException e) {
			System.out.println("CtmzDAO에서 ListCtmz() 메소드 작업중 에러 : " + e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	

	

	
	public boolean deleteCtmz(String color){ //관리자가 상품 지우기 (품절일 경우)
		
		String delete_sql="DELETE FROM YZCUSTOMIZE WHERE CTMZ_COLOR=?";
		int result=0;
		
		try{
			con = ds.getConnection();
			pstmt=con.prepareStatement(delete_sql);
			pstmt.setString(1, color);
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("deleteCTMZ 에러 : "+ex);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null) con.close();
			}catch(Exception ex){}
		}
		return false;
	}
	
	public boolean addOrder(YZOrderDTO yzorderDTO){ // 구매자가 하나 사면, ORDER TABLE에 데이터 추가
		
		System.out.println("addOrder 메소드 진입");
		
		int num = 0;
		String sql="";
		int result = 0;
		
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("SELECT MAX(ORDER_NO) FROM YZORDER");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1;
			} else {
				num = 1;
			} //새로 등록할 상품의 번호 num값에 담는다.
			
			sql = "INSERT INTO YZORDER(ORDER_NO, CTMZ_NO, MEM_ID, "
					+ "ORDER_STATUS, ORDER_PHONE, ORDER_ADDRESS, "
					+ "ORDER_NAME, ORDER_MESSAGE, ORDER_SIZE ,ORDER_DATE"
					+ ")VALUES(?,?,?,?,?,?,?,?,?,sysdate)";
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, yzorderDTO.getCTMZ_NO());
			System.out.println("2 "+yzorderDTO.getCTMZ_NO());
			
			pstmt.setString(3, yzorderDTO.getMEM_ID());
			System.out.println("3 "+yzorderDTO.getCTMZ_NO());
			
			pstmt.setInt(4, yzorderDTO.getORDER_STATUS());
			System.out.println("4 "+yzorderDTO.getORDER_STATUS());
			
			pstmt.setInt(5, yzorderDTO.getORDER_PHONE());
			System.out.println("5 "+yzorderDTO.getORDER_PHONE());
			
			pstmt.setString(6, yzorderDTO.getORDER_ADDRESS());
			System.out.println("6 "+yzorderDTO.getORDER_ADDRESS());
			
			pstmt.setString(7, yzorderDTO.getORDER_NAME());
			System.out.println("7 "+yzorderDTO.getORDER_NAME());
			
			pstmt.setString(8, yzorderDTO.getORDER_MESSAGE());
			System.out.println("8 "+yzorderDTO.getORDER_MESSAGE());
			System.out.println("9 "+yzorderDTO.getORDER_SIZE());
			pstmt.setInt(9, yzorderDTO.getORDER_SIZE());
			
			
			
			
			
			result = pstmt.executeUpdate();
			
			if(result ==0){
				System.out.println("DB(ORDER_TABLE)에 주문등록 실패");
				return false;
			} else {
				System.out.println("DB(ORDER_TABLE)에 주문등록 성공");
			}
			return true;
			
		} catch (SQLException e) {
			System.out.println("CtmzDAO - addOrder 에러 : "+e);
		} finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	
	}
	
	public int findCtmzNo(String color){
		
		System.out.println("findCtmzNo 메소드 진입");
		
		String sql="SELECT CTMZ_NO FROM YZCUSTOMIZE WHERE CTMZ_COLOR=?";
		int ctmzNo =0;
		
		try {
			con = ds.getConnection();

			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, color);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ctmzNo = rs.getInt("CTMZ_NO");
			}
			
		} catch (SQLException e) {
			System.out.println("CtmzDAO - findCtmzNo()메소드 에러 : "+e);
		} finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		
		return ctmzNo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}



















