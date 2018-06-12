<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<div id="login">
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 있으면  ..님 logout
	// 세션값 없으면 login
	if (id != null) {
		%>
		<%=id %>님 
		<a href="../member/logout.jsp">logout</a>
		<%
	} else {
		%><a href="../member/login.jsp">login</a><%
	}
%>
	 | <a href="../member/join.jsp">join</a>
</div>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/juvlogo.jpg" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/adminmain.jsp">HOME</a></li>
	<li><a href="../center/juventus.jsp">구단 소개</a></li>
	<li><a href="../center/manager.jsp">감독 소개</a></li>
	<li><a href="../center/players.jsp">선수단 소개</a></li>
	<li><a href="../center/fnotice.jsp">자유게시판</a></li>
	<li><a href="../admin/admin.jsp">회원관리</a></li>
</ul>
</nav>
</header>