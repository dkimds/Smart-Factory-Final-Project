<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="yjmp.project.DB.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("user_id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int n =0;	
	try{
		conn = DBConnection.getCon();
		//System.out.println("들어왔냐!!!!!!!!!!!1");
		String sql = "select USER_ID from TEST where id like ?";
		pstmt = conn.prepareStatement(sql);
// 		pstmt.setString(1, id);
// 		pstmt.setString(2, name);
// 		pstmt.setString(3, status);
		n = pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
			if(pstmt!=null) try{ pstmt.close();} catch(SQLException sqle){}
			if(conn!=null) try{ conn.close();} catch(SQLException sqle){}
	}
	
	response.sendRedirect("/common/login/login.jsp");
%>
</body>
</html>