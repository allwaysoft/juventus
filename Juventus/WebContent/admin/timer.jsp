<%@page import="java.util.Date"%>
<%@page import="java.util.TimerTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
    TimerTask task1 = (TimerTask) application.getAttribute("task1");
    TimerTask task2 = (TimerTask) application.getAttribute("task2");
    
//     HttpSession ss = request.getSession();//세션
//     ServletContext sc = request.getServletContext();//애플리케이션
//     request.setAttribute("aaa", new Date());
//     request.getRequestDispatcher("a.jsp").forward(request, response);
    
%>
<body>
<h1>관리자 화면</h1>
<input type="button" value="접속 회원수 체크 시작" onclick="location.href='timerPro.jsp?job=aaa&status=on'"
<% if (task1 != null) { %>disabled<% } %>>
<input type="button" value="접속 시간 체크 시작" onclick="location.href='timerPro.jsp?job=bbb&status=on'"
<% if (task2 != null) { %>disabled<% } %>>
<input type="button" value="접속 회원수 체크 종료" onclick="location.href='timerPro.jsp?job=aaa&status=off'"
<% if (task1 == null) { %>disabled<% } %>>
<input type="button" value="접속 시간 체크 종료" onclick="location.href='timerPro.jsp?job=bbb&status=off'"
<% if (task2 == null) { %>disabled<% } %>>          
</body>
</html>