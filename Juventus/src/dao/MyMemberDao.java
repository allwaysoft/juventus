package dao;

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


public class MyMemberDao {
	// DB연결 메소드
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
	} // getConnection() 끝
	
	public JSONArray getJSONGenderCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		JSONArray jsonArray = new JSONArray();
		JSONArray recordArray = new JSONArray();
		recordArray.add("Gender");
		recordArray.add("Number");
		jsonArray.add(recordArray);
		
		try {
			con = getConnection();
			sql = "select gender, count(*) cnt from mymember group by gender";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				recordArray = new JSONArray();
				recordArray.add(rs.getString("gender"));
				recordArray.add(rs.getInt("cnt"));
				jsonArray.add(recordArray);
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
		return jsonArray;
	}
	
	public JSONArray getJSONAgeCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray jsonArray = new JSONArray();
		JSONArray recordArray = new JSONArray();
		recordArray.add("Age");
		recordArray.add("Number");
		jsonArray.add(recordArray);
		
		try {
			con = getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("select '40대 이상' age, (select count(*) cnt from mymember where age >= 40) cnt from dual ");
			sb.append("union all ");
			sb.append("select '30대', (select count(*) cnt from mymember where age >= 30 and age < 40) cnt from dual ");
			sb.append("union all ");
			sb.append("select '20대', (select count(*) cnt from mymember where age >= 20 and age < 30) cnt from dual ");
			sb.append("union all ");
			sb.append("select '10대 이하', (select count(*) cnt from mymember where age < 20) cnt from dual ");
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				recordArray = new JSONArray();
				recordArray.add(rs.getString("age"));
				recordArray.add(rs.getInt("cnt"));
				jsonArray.add(recordArray);
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
		return jsonArray;
	}
	
	// 테스트용 메소드
	public void add(MyMember bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			// 드라이버 로딩. DB연결
			con = getConnection();
			sql = "INSERT INTO mymember (id,passwd,name) VALUES (?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	}
	
	public void addMembers(List<MyMember> list) {
		// insert 할 대량의 데이터를 매개변수 list로 전달받는다.
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			// 드라이버 로딩. DB연결
			con = getConnection();
			sql = "INSERT INTO mymember (id, passwd, name) VALUES (?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			final int BATCH_SIZE = 1000;
			int count = 0;
			
			for (MyMember member : list) {
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPasswd());
				pstmt.setString(3, member.getName());
				pstmt.addBatch();
				
				if (++count % BATCH_SIZE == 0) { // 배치사이즈로 설정한 1000건씩 insert 한다.
					pstmt.executeBatch();
				}
			}
			pstmt.executeBatch(); // 남은 레코드를 insert 한다.
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	}
	
	
	// MYMEMBER 테이블의 모든 레코드를 삭제
	public void deleteAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			// 드라이버 로딩. DB연결
			con = getConnection();
			sql = "DELETE FROM mymember";
			pstmt = con.prepareStatement(sql);
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	}
	// mymember 테이블의 전체 레코드갯수 가져오기
	public int getCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = getConnection();
			
			sql = "select count(*) from mymember";
			pstmt = con.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			// rs => 변수저장
			if (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
	
	public void insertMember(MyMember bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			// 드라이버 로딩. DB연결
			con = getConnection();
			sql = "INSERT INTO mymember (id,passwd,name,reg_date,email,address,tel,mtel) VALUES (?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			pstmt.setTimestamp(4, bean.getReg_date());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getAddress());
			pstmt.setString(7, bean.getTel());
			pstmt.setString(8, bean.getMtel());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	} // insertMember() 끝
	
	// 로그인 사용자 체크 메소드
	public int userCheck(String id, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = -1;
		// 아이디 불일치: -1
		// 아이디 일치, 패스워드 불일치: 0
		// 아이디 패스워드 모두 일치: 1
		
		sql = "select passwd from mymember where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 아이디 있음
				if (passwd.equals(rs.getString("passwd"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
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
	} // userCheck()의 끝
	
	// 관리자 사용자 체크 메소드
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
		} // adminCheck()의 끝
	
	public MyMember getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyMember bean = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select * from mymember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			// rs => 변수저장
			if (rs.next()) {
				bean = new MyMember();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setAge(rs.getInt("age"));
				bean.setGender(rs.getString("gender"));
				bean.setEmail(rs.getString("email"));
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
		return bean;
	} // getMember()의 끝
	
	public int updateMember(MyMember bean) {
		Connection con = null;
		PreparedStatement pstmt = null;  // select용
		PreparedStatement pstmt2 = null; // update용
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		
		try {
			con = getConnection();
			
			sql = "select passwd from mymember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			// 실행
			rs = pstmt.executeQuery();
			// rs 데이터 있으면 아이디 있음
			//              패스워드비교 맞으면 update  main.jsp이동
			//                        틀리면 "패스워드틀림" 뒤로이동
			if (rs.next()) {
				// 아이디 있음
				if (bean.getPasswd().equals(rs.getString("passwd"))) {
					// update   main.jsp이동
					sql = "update mymember set name=?, passwd=?, age=?, gender=?, email=?, address=?, tel=?, mtel=? where id=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bean.getName());
					pstmt2.setString(2, bean.getPasswd());
					pstmt2.setInt(3, bean.getAge());
					pstmt2.setString(4, bean.getGender());
					pstmt2.setString(5, bean.getEmail());
					pstmt2.setString(6, bean.getAddress());
					pstmt2.setString(7, bean.getTel());
					pstmt2.setString(8, bean.getMtel());
					pstmt2.setString(9, bean.getId());
					// 실행
					pstmt2.executeUpdate();
					
					check = 1; // 패스워드 일치해서 수정성공
				} else {
					check = 0; // 패스워드 불일치
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
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
	} // updateMember()의 끝
	
	public int deleteMember(String id, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;  // select용
		PreparedStatement pstmt2 = null; // delete용
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		
		try {
			con = this.getConnection();
			
			sql = "select passwd from mymember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			// rs 데이터 있으면 아이디 있음
			//              패스워드비교 맞으면 update  main.jsp이동
			//                        틀리면 "패스워드틀림" 뒤로이동
			if (rs.next()) {
				// 아이디 있음
				if (passwd.equals(rs.getString("passwd"))) {
					// delete
					sql = "delete from mymember where id=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, id);
					// 실행
					pstmt2.executeUpdate();
					
					check = 1; // 패스워드 일치. 삭제성공.
				} else {
					check = 0; // 패스워드 불일치
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
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
	} // deleteMember()의 끝
	
	
	public void deleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;  // select용
		String sql = "";
		
		try {
			con = this.getConnection();
			
			sql = "delete from mymember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	} // deleteMember()의 끝
	
	
	public void deleteMembers(String[] ids) {
		// 매개변수로 삭제할 id 배열을 전달받는다.
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "DELETE FROM mymember WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			final int BATCH_SIZE = 1000;
			int count = 0;
			
			for (String id : ids) {
				pstmt.setString(1, id);
				pstmt.addBatch();
				
				count++;
				if (count % BATCH_SIZE == 0) {
					// 배치사이즈로 설정한 1000건씩 delete 한다.
					pstmt.executeBatch();
				}
			}
			pstmt.executeBatch(); // 남은 레코드를 delete 한다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	}
	
	public List<MyMember> getMembers() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<MyMember> list = new ArrayList<>();
		
		try {
			con = getConnection();
			
			sql = "select * from mymember";
			pstmt = con.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MyMember bean = new MyMember();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setAge(rs.getInt("age"));
				bean.setGender(rs.getString("gender"));
				bean.setAddress(rs.getString("address"));
				bean.setEmail(rs.getString("email"));
				bean.setMtel(rs.getString("mtel"));
				bean.setTel(rs.getString("tel"));
				
				list.add(bean); // 리스트에 추가
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
		
		return list;
	} // getMembers()의 끝
	
	// 아이디 중복체크
	public int idCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int rowCount = 0;
		
		try {
			con = getConnection();
			// select id에 해당하는 데이커 가져오기
			sql = "select count(*) from mymember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowCount = rs.getInt(1);
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
		return rowCount;
	} // idCheck()의 끝
	
}









