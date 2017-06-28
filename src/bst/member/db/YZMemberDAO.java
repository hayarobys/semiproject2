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

package bst.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import bst.ctmz.db.CtmzDTO;

public class YZMemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public YZMemberDAO() {
		try{
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	public boolean loginCheck(String user_id, String user_pw){
	// 새로운 세션에서 로그인 시도시 입력받은 아이디와 패스워드가 DB상에 존재하는지 비교후 boolean값 반환.
		String sql="SELECT * FROM YZMEMBER WHERE MEM_ID = ? and MEM_PASSWORD = ?";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);	// setString 호출시 자동으로 문자열 양옆에 작은따옴표가 붙는것에 유의.
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();	
			
			if(rs.next() == false){
				System.out.println(user_id + ", " + user_pw + "와 일치하는 결과가 없습니다.");
				return false;
			}else{
				System.out.println(user_id + ", " + user_pw + "는 로그인 유저입니다.");
				return true;
			}
		}catch (SQLException e) {
			System.out.println("YZMemberDAO에서 loginCheck() 작업중 에러 : " + e);
			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return false;
	}	// loginCheck();
	
	public int getGrade(String user_id){
	// 해당 아이디의 권한등급 반환
		String sql="SELECT MEM_GRADE FROM YZMEMBER WHERE MEM_ID = ?";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);	// setString 호출시 자동으로 문자열 양옆에 작은따옴표가 붙는것에 유의.
			rs = pstmt.executeQuery();	
			
			if(rs.next() == true){
				int user_grade = rs.getInt("MEM_GRADE");
				System.out.println(user_id + "님의 등급은 " + user_grade + " 입니다.");
				return user_grade;
			}else{
				System.out.println(user_id + "님의 등급이 검색되지 않았습니다.");
				return -1;
			}
		}catch (SQLException e) {
			System.out.println("YZMemberDAO에서 loginCheck() 작업중 에러 : " + e);
			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		
		return -1;
	}
	
public List memList(){//ctmz 페이지에 size, color, image 전송
		
		String list_sql = "SELECT * FROM YZMEMBER";
		
		List<YZMemberDTO> list = new ArrayList<YZMemberDTO>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(list_sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				YZMemberDTO memDTO = new YZMemberDTO();
				memDTO.setMEM_ID(rs.getString("MEM_ID"));
				memDTO.setMEM_NAME(rs.getString("MEM_NAME"));
				memDTO.setMEM_EMAIL(rs.getString("MEM_EMAIL"));
				memDTO.setMEM_HOME(rs.getString("MEM_HOME"));
				memDTO.setMEM_PHONE(rs.getString("MEM_PHONE"));
				memDTO.setMEM_GRADE(rs.getInt("MEM_GRADE"));
				memDTO.setDate(rs.getDate("MEM_DATE"));
				//size, color, image 만 db에서 받아와서 전송.
				list.add(memDTO);
			}
			
			return list;
		} catch (SQLException e) {
			System.out.println("YZMemberDAO에서 memList() 메소드 작업중 에러 : " + e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	public boolean insertMember(YZMemberDTO memberBean) throws SQLException {
		System.out.println("하이");
		YZMemberDTO mb = memberBean;
		String sql = "insert into yzmember values(?,?,?,?,?,?,?,?)";
		
		
		boolean result = false;
	
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMEM_ID());
			pstmt.setString(2, mb.getMEM_PASSWORD());
			pstmt.setString(3, mb.getMEM_NAME());
			pstmt.setString(4, mb.getMEM_EMAIL());
			pstmt.setString(5, mb.getMEM_HOME());
			pstmt.setString(6, mb.getMEM_PHONE());
			pstmt.setInt(7, mb.getMEM_GRADE());
			pstmt.setDate(8, mb.getDate());
			pstmt.executeUpdate();
	
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	
		return result;
	}
	
	public List getMyInfo(String id) throws SQLException {
		
		
		List my_info =new ArrayList();
		String sql = null;
		boolean result = false;
		
		sql="select * from YZMEMBER where MEM_ID=?";
		
		try{
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			System.out.println(id);
			System.out.println(sql);
			
			while(rs.next()){
				YZMemberDTO memDTO = new YZMemberDTO();
				memDTO.setMEM_ID(rs.getString("MEM_ID"));
				memDTO.setMEM_NAME(rs.getString("MEM_NAME"));
				memDTO.setMEM_EMAIL(rs.getString("MEM_EMAIL"));
				memDTO.setMEM_HOME(rs.getString("MEM_HOME"));
				memDTO.setMEM_PHONE(rs.getString("MEM_PHONE"));
				memDTO.setMEM_GRADE(rs.getInt("MEM_GRADE"));
				memDTO.setDate(rs.getDate("MEM_DATE"));
				my_info.add(memDTO);
			}
			
			return my_info;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
}
