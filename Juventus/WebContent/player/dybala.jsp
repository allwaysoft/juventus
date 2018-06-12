<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수단 소개</title>
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
<style type="text/css">
	p {
		text-align:center;
	}
</style> 
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
<li><a href="../index.jsp">HOME</a></li>
<li><a href="../center/juventus.jsp">구단 소개</a></li>
<li><a href="../center/manager.jsp">감독 소개</a></li>
<li><a href="../center/players.jsp">선수단 소개</a></li>
<li><a href="../center/fnotice.jsp">자유게시판</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h2>파울로 디발라</h2>
<p><img src="../images/dybala11.jpg" width="300" height="340"></p>
<table id="notice">
<tr>
	<th>이름</th>
	<th>Paulo Dybala</th>
</tr>
<tr>
	<th>출생지</th>
	<th>Argentina, 아르헨티나</th>
</tr>
<tr>
	<th>생년월일</th>
	<th>1993.11.15</th>
</tr>
<tr>
	<th>신장, 몸무게</th>
	<th>177cm / 75kg</th>
</tr>
<tr>
	<th></th>
	<th>2011.7~2012.7 인스티투토ACC(아르헨티나)</th>
</tr>
<tr>
	<th>커리어</th>
	<th>2012.7~2015.7 팔레르모(이탈리아)</th>
</tr>
<tr>
	<th></th>
	<th>2015.7~ 유벤투스(이탈리아)</th>
</tr>
</table>
<video src="" controls="controls" width="400" height="300"></video>

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