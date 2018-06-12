package module;

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

import org.json.simple.JSONArray;

import com.sun.glass.ui.GestureSupport;

import domain.MyMember;

public class adminCheck {
	private Connection getConnection() throws Exception {
		Connection con = null;
		
		// DB 연결에 필요한 정보
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:testDB";
		String user = "scott";
		String password = "1234";
		// 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 연결
		con = DriverManager.getConnection(url, user, password);
		
		
//		Context initContext = new InitialContext();
//		DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/oracle");
//		con = ds.getConnection();
		return con;
	}
	public Integer adminCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Integer check = 1;
		// 관리자 아님 : else
		// 관리자 : 1
		
		sql = "select admin from mymember where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				check=rs.getInt("admin");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {}
			}
		}
		return check;
	}
}
