<%@page import="dao.MyMemberDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%MyMemberDao dao = new MyMemberDao();%>
  <head> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var arr = <%=dao.getJSONGenderCount()%>;
    	  
        var dataTable = google.visualization.arrayToDataTable(arr);

        var options = {
          title: '회원 성비'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(dataTable, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>