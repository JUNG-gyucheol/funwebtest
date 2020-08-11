
//하이맨~~


package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Member_DAO {
		
	Connection conn = null;
	PreparedStatement pstmt = null ;
	ResultSet rs = null;
	
	public Connection getConnection() throws Exception{
	Context initctx = new InitialContext();
	Context envctx = (Context)initctx.lookup("java:comp/env");
	DataSource ds = (DataSource) envctx.lookup("jdbc/mysql");
		conn = ds.getConnection();
		return conn;
	}
	public void resourceClose() {
		try {
			if(pstmt != null)pstmt.close();
			if(rs != null)rs.close();
			if(conn != null)conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Member_Bean bean) throws Exception{
		
		getConnection();
		try {
			String sql = "INSERT INTO user_member2"
					+ " VALUES(?,?,?,now(),?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getAge());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getAddress());
			pstmt.setString(8, bean.getTel());
			pstmt.setString(9, bean.getMtel());
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
	
		return 0;
	}
	public int idCheck(String userid) {
		
		try {
			getConnection();
			String sql = "SELECT id from user_member2 where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			} else {
			return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			resourceClose();
		}
			return -1; 
	}
	
	
}
