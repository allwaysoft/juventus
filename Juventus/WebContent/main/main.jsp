<%@page import="java.text.SimpleDateFormat"%>
<%@page import="domain.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Juventus FC</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]--> 


</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/juventus.png"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>구단 소개</h3>
<p>유벤투스 구단 연혁</p>
</div>
<div id="security">
<h3>감독 및 선수단</h3>
<p>감독 및 선수단 프로필</p>
</div>
<div id="payment">
<h3>자유게시판</h3>
<p>각종 영상 및 자료 공유<br>자유글 게시</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">최근 경기 결과</span></h3>
<dl>
<dd>
<a href="http://sports.news.naver.com/sports/new/live/index.nhn?category=worldfootball&gameId=2018041663512090196" target="_blank">
180415 vs Sampdoria (3:0 win) Serie A</a><br>
<br>
<a href="http://sports.news.naver.com/sports/new/live/index.nhn?category=worldfootball&gameId=2018041250014088661" target="_blank">
180412 vs  Real Madrid (1:3 win) Champions League</a><br>
<br>
<a href="http://sports.news.naver.com/sports/new/live/index.nhn?category=worldfootball&gameId=2018040763512090160" target="_blank">
180407 vs Benevento (4:2 win) Serie A</a><br>
<br>
<a href="http://sports.news.naver.com/sports/new/live/index.nhn?category=worldfootball&gameId=2018040450014088659" target="_blank">
180404 vs Real Madrid (0:3 lose) Champions League</a><br>
<br>
<a href="http://sports.news.naver.com/sports/new/live/index.nhn?category=worldfootball&gameId=2018040163512090104" target="_blank">
180401 vs AC Milan (3:1 win) Serie A</a><br>
</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">최근 게시물</h3>
<table>
<%
// DB객체생성
BoardDao dao = new BoardDao();
// 전체글개수 가져오는 메소드 호출
int count = dao.getBoardCount();
// count 0보다 크면
//   List = getBoards(시작행번호, 종료행번호) 호출
//   for문 출력
// count 0이면 "게시글 없음"
if (count > 0) {
	List<Board> list = dao.getBoards(1, 5);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	for (Board board : list) {
		%>
		<tr>
			<td class="contxt">
				<%
					if (board.getRe_lev() > 0) {
						int wid = board.getRe_lev() * 10;
						%>
						<img src="../images/center/level.gif" width="<%=wid %>" height="8">						
						<img src="../images/center/re.gif">
						<%
					}
				%>
				<a href="../center/fcontent.jsp?num=<%=board.getNum()%>&pageNum=1">
					<%=board.getSubject() %>
				</a>
			</td>
    		<td><%=sdf.format(board.getReg_date()) %></td>
    	</tr>
		<%
	}
} else {
	%>
	<tr>
		<td colspan="2" class="contxt">-</td>
    </tr>
	<%
	
}
%>

</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>