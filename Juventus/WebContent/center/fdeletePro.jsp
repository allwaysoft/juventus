<%@page import="java.io.File"%>
<%@page import="domain.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// int num  String pageNum  String passwd 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd  = request.getParameter("passwd");
	
	// DB객체생성 boarddao
	BoardDao dao = new BoardDao();
	// int check = 메소드호출  deleteBoard(num, passwd)
	Board board = dao.getBoard(num);
	int check = dao.deleteBoard(num, passwd);
	
	// check == 1이면 실제파일을 삭제
	if (check == 1) {  // 테이블 레코드 삭제 성공하면
		String realPath = application.getRealPath("/upload");
		System.out.println("realPath: " + realPath);
		
		File file = new File(realPath, board.getFilename());
		if (file.exists()) {
			file.delete(); // 파일삭제 수행
		}
	}
	
	// check == 1  이동 list.jsp?pageNum=
	// check == 0 "패스워드틀림"  뒤로이동
	if (check == 1) {
		// response.sendRedirect("notice.jsp?pageNum=" + pageNum);
		%>
		<script>
			alert('글삭제 성공');
			location.href = 'fnotice.jsp?pageNum=<%=pageNum%>';
		</script>
		<%
	} else {
		%>
		<script>
			alert('패스워드틀림');
			history.back();
		</script>
		<%
	}
%>

