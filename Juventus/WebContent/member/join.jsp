<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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

<script>
function winopen() {
	// id란이 공백이면 '아이디 입력하세요' 포커스깜박
	if (document.frm.id.value.length == 0) {
		alert('아이디 입력하세요');
		document.frm.id.focus();
		return;
	}
	// 창열기 join_IDCheck.jsp width=400,height=200
	var userid = document.frm.id.value;
	window.open('join_IDCheck.jsp?userid=' + userid, '', 'width=400,height=200');
}
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">회원가입</a></li>
<li><a href="#">개인정보</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원가입</h1>
<form action="joinPro.jsp" method="post" id="join" name="frm">
<fieldset>
<legend>기본 정보</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="중복 확인" class="dup" onclick="winopen()"><br>
<label>비밀번호</label>
<input type="password" name="passwd"><br>
<label>비밀번호 다시쓰기</label>
<input type="password" name="passwd2"><br>
<label>이름</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>E-Mail 다시쓰기</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>
<legend>선택사항</legend>
<label>나이</label>
<input type="text" name="age"><br>
<label>성별</label>
<select name="gender">
<option value = "1">남자</option>
<option value = "2">여자</option>
</select><br>
<br>
<label>주소</label>
<input type="text" name="address"><br>
<label>전화번호</label>
<input type="text" name="tel"><br>
<label>휴대폰 번호</label>
<input type="text" name="mtel"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="취소" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>