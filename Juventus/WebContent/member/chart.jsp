<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 차트</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage1.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../main/adminmain.jsp">HOME</a></li>
<li><a href="../member/memberselect.jsp">회원 관리</a></li>
<li><a href="../center/manager.jsp">데이터 차트</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>Manager mode</h1>

<table id="notice">
<tr>
	<th><a href="../admin/chart.jsp">회원 성별 차트</a></th>
	<th><a href="../admin/chart1.jsp">회원 연령대 차트</a></th>
	<th></th>a
</tr>
<tr>
	<td><img src="../images/donut.jpg" width="150" height="180"></td>
	<td><img src="../images/chart.jpg" width="150" height="180"></td>
</tr>
</table>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>
