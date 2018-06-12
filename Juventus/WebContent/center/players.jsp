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
<h1>Juventus Squad</h1>
<h2>Forward</h2>

<table id="notice">
<tr>
	<th>No.10 P.디발라<br>Paulo Dybala</th>
	<th>No.9 G.이과인<br>Gonzalo Higuain</th>
	<th>No.17 M.만주키치<br>Mario Mandzukic</th>
</tr>
<tr>
	<td><a href="../player/dybala.jsp"><img src="../images/players/dybala.jpg" width="150" height="180"></a></td>
	<td><img src="../images/players/Higuain.jpg" width="150" height="180"></td>
	<td><img src="../images/players/manzukic.jpg" width="150" height="180"></td>
</tr>
<tr>
	<th>No.11 D.코스타<br>Douglas Costa</th>
	<th>No.7 J.콰드라도<br>Juan Quadrado</th>
	<th>No.33 F.베르나르데스키<br>Federico Bernardeschi</th>
</tr>
<tr>
	<td><img src="../images/players/douglas.jpg" width="150" height="180"></td>
	<td><img src="../images/players/quadrado.jpg" width="150" height="180"></td>
	<td><img src="../images/players/pederico.jpg" width="150" height="180"></td>
</tr>
</table>

<h2>Midfielder</h2>

<table id="notice">
<tr>
	<th>No.5 M.피아니치<br>Miralem Pjanic</th>
	<th>No.6 S.케디라<br>Sami Khedira</th>
	<th>No.8 C.마르키시오<br>Claudio Marchisio</th>
</tr>
<tr>
	<td><img src="../images/players/pjanic.png" width="150" height="180"></td>
	<td><img src="../images/players/khedira.png" width="150" height="180"></td>
	<td><img src="../images/players/marchisio.jpg" width="150" height="180"></td>
</tr>
<tr>
	<th>No.14 B.마투아디<br>Blaise Matuidi</th>
	<th>No.27 S.스투라로<br>Stefano Sturaro</th>
	<th>No.30 R.벤탄쿠르<br>Rodrigo Bentancur</th>
</tr>
<tr>
	<td><img src="../images/players/matuadi.png" width="150" height="180"></td>
	<td><img src="../images/players/sturaro.png" width="150" height="180"></td>
	<td><img src="../images/players/bentancur.png" width="150" height="180"></td>
</tr>
</table>

<h2>Defender</h2>
<table id="notice">
<tr>
	<th>No.2 M.데 실리오<br>Mattia De Sciglio</th>
	<th>No.3 G.키엘리니<br>G.Chiellini</th>
	<th>No.4 M.베나티아<br>Medhi Benatia</th>
</tr>
<tr>
	<td><img src="../images/players/desilio.jpg" width="150" height="180"></td>
	<td><img src="../images/players/chiellini.png" width="150" height="180"></td>
	<td><img src="../images/players/benatia.png" width="150" height="180"></td>
</tr>
<tr>
	<th>No.12 A.산드루<br>Alex Sandro</th>
	<th>No.15 A.바르잘리<br>Andera Barzagli</th>
	<th>No.24 D.루가니<br>Daniele Rugani</th>
</tr>
<tr>
	<td><img src="../images/players/sandro.png" width="150" height="180"></td>
	<td><img src="../images/players/barzagli.png" width="150" height="180"></td>
	<td><img src="../images/players/rugani.png" width="150" height="180"></td>
</tr>
<tr>
	<th>No.21 B.회베데스<br>Benedikt Howedes</th>
	<th>No.26 S.리히슈타이너<br>Stephan Lichisteiner</th>
	<th>No.22 K.아사모아<br>Kwadwo Asamoah</th>
</tr>
<tr>
	<td><img src="../images/players/howedes.jpg" width="150" height="180"></td>
	<td><img src="../images/players/stephan.jpg" width="150" height="180"></td>
	<td><img src="../images/players/asamoah.jpg" width="150" height="180"></td>
</tr>
</table>

<h2>Goalkeeper</h2>
<table id="notice">
<tr>
	<th>No.1 G.부폰<br>Gianluigi Buffon</th>
	<th>No.23 W.슈제츠니<br>Wojciech Szczesny</th>
	<th>No.16 C.핀소글리오<br>Carlo Pinsoglio</th>
</tr>
<tr>
	<td><img src="../images/players/buffon.png" width="150" height="180"></td>
	<td><img src="../images/players/szce.jpg" width="150" height="180"></td>
	<td><img src="../images/players/pinsoglio.png" width="150" height="180"></td>
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