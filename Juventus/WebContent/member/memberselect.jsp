<%@page import="java.util.List"%>
<%@page import="domain.MyMember"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
<style>
	table {border: 2px double pink; width:1000px}
	td,th{border:1px pink solid ; text-align: center; padding:5px}
</style>
<script>
	function idDelete(delID) {
		location.href="deletemember.jsp?id=" + delID;
	}
</script>
</head>
<body>
	
    <jsp:useBean id="dao" class="dao.MyMemberDao" />
	<%
		List<MyMember> list = dao.getMembers();
    %>
	
	<h2>Member Info</h2>
    <table>
        <tr bgcolor="pink">
        <th>아이디</th><th>이름</th><th>비밀번호</th><th>나이</th><th>성별</th>
        <th>이메일</th><th>주소</th><th>Mobile</th><th>ID삭제</th>
        </tr>
    <%
    for(MyMember vo : list){
    %> 
        <tr>
            <td><%=vo.getId() %></td>
            <td><%=vo.getName() %></td>
            <td><%=vo.getPasswd() %></td>
            <td><%=vo.getAge() %></td>
            <td><%=vo.getGender() %></td>
            <td><%=vo.getEmail() %></td>
            <td><%=vo.getAddress() %></td>
            <td><%=vo.getMtel()%></td>
            <td><input type="button" value="삭제" 
            onclick="idDelete('<%=vo.getId() %>');"></td>
		</tr>
	        
    <%
    }
    %>

    </table>
    
</body>
</html>





