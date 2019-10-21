<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />
<!-- css, js include -->
<jsp:include page="/WEB-INF/inc/common/header.jsp" />

<!-- Morris Chart -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<meta charset="UTF-8">
<title>LineChart</title>
</head>
<body>
<div id="Chart1"></div>
	<%
		String url = "jdbc:oracle:thin:@210.107.78.168:1521:orcl";
		String user = "yjmp2";
		String pass = "didwoansvk";
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();
		pstmt = conn.prepareStatement(
				"select * from (select * from TH_BASIC_TB ORDER BY TH_BASIC_SEQ) where rownum <=20");
		rs = pstmt.executeQuery();

		out.println("<script>");
		out.println("new Morris.Line({");
		out.println("element: 'Chart1',");
		out.println("data:[");
		while (rs.next()) {
			out.println("{time:" + rs.getInt("TH_BASIC_SEQ") + ",");
			out.println("temperature:" + rs.getInt("TH_TEMP") + ",");
			out.println("humidity:" + rs.getInt("TH_HUMIDITY") + "},");
		}
		out.println("], xkey:'time', ykeys:['temperature', 'humidity'],");
		out.println("labels:['temperature', 'humidity'], hideHover:'auto'");
		out.println("});</script>");
		conn.close();
	%>


</body>
</html>