<%@page import="module.MySessionBindingListener"%>
<%@page import="dao.MyMemberDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 id passwd 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String keepLogin = request.getParameter("keepLogin");
	System.out.println("keepLogin: " + keepLogin);
	
	// DB객체 생성
	MyMemberDao dao = new MyMemberDao();
	Integer admincheck = dao.adminCheck(id);
	
	// check == 1 로그인인증  adminmain.jsp이동
	// else 아이디없음  뒤로이동
	if (admincheck == 1) {
		session.setAttribute("id", id);
		session.setAttribute("bindListener", new MySessionBindingListener());
		response.sendRedirect("../main/adminmain.jsp?id=" + id + "&keepLogin=" + keepLogin);
	} 
	 else {
		%>
		<script>
			alert('관리자 아님');
			//location.href = 'loginForm.jsp';
			history.back(); // 브라우저 뒤로가기버튼
		</script>
		<%
	}
%>











