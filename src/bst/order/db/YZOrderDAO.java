package bst.order.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class YZOrderDAO {

	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public YZOrderDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			System.out.println("db연결 성공!");
		} catch (Exception e) {
			System.out.println("db연결 실패...:"+e);
			return;
		}
	}

	/*public int getOrderCount(String id) throws SQLException {
		String sql="select count(*) from yzorder where MEM_ID=?";
		
		*/
/*		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		MemberBean mb = memberBean;
		con = DriverManager.getConnection(url, userid, pw);

		String sql = null;
		boolean result = false;

		
		
		try{
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();			
			return rs.getInt(1);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return 0;
	}*/
	
	/*public int getOrderSumMoney(String id) throws SQLException{
		String sql="select sum(ORDER_SUM_MONEY) from goods_order "+
				   "where ORDER_MEMBER_ID=?";
		
		try{
			conn = ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			rs.next();
			
			return rs.getInt(1);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		return 0;
	}
	*/
	public List getOrderList(String id) throws SQLException {
		
		
		List goods_order_list=new ArrayList();
		String sql = null;
		boolean result = false;
		
		sql="select * from YZORDER where MEM_ID=? order by ORDER_DATE desc";
		
		try{
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			System.out.println(id);
			System.out.println(sql);
			
			while(rs.next()){
				YZOrderDTO order=new YZOrderDTO();
				order.setORDER_NO(
						rs.getInt("ORDER_NO"));
				System.out.println(rs.getInt("ORDER_NO"));
				order.setCTMZ_NO(
						rs.getInt("CTMZ_NO"));
				order.setMEM_ID(
						rs.getString("MEM_ID"));
				order.setORDER_STATUS(
						rs.getInt("ORDER_STATUS"));
				order.setORDER_PHONE(
						rs.getInt("ORDER_PHONE"));
				order.setORDER_ADDRESS(
						rs.getString("ORDER_ADDRESS"));
				order.setORDER_NAME(
						rs.getString("ORDER_NAME"));
				order.setORDER_MESSAGE(
						rs.getString("ORDER_MESSAGE"));
				order.setORDER_DATE(
						rs.getDate("ORDER_DATE"));
				order.setORDER_SIZE(
						rs.getInt("ORDER_SIZE"));
				
				goods_order_list.add(order);
			}
			
			return goods_order_list;
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
	
	public List listOrder(){
		
		List list=new ArrayList();
		String sql = null;
		boolean result = false;
		
		sql="select * from YZORDER";
		
		try{
			con = ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				YZOrderDTO order=new YZOrderDTO();
				order.setORDER_NO(
						rs.getInt("ORDER_NO"));
				System.out.println(rs.getInt("ORDER_NO"));
				order.setCTMZ_NO(
						rs.getInt("CTMZ_NO"));
				order.setMEM_ID(
						rs.getString("MEM_ID"));
				order.setORDER_STATUS(
						rs.getInt("ORDER_STATUS"));
				order.setORDER_PHONE(
						rs.getInt("ORDER_PHONE"));
				order.setORDER_ADDRESS(
						rs.getString("ORDER_ADDRESS"));
				order.setORDER_NAME(
						rs.getString("ORDER_NAME"));
				order.setORDER_MESSAGE(
						rs.getString("ORDER_MESSAGE"));
				order.setORDER_DATE(
						rs.getDate("ORDER_DATE"));
				order.setORDER_SIZE(
						rs.getInt("ORDER_SIZE"));
				
				list.add(order);
			}
			
			return list;
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















