<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="yjmp.project.DB.DBConnection" %>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("EUC-KR");
	//String loginid = request.getParameter("user_id"); //입력받은 id
	//String loginpwd = request.getParameter("user_pwd"); //입력받은 pwd
	String loginname = request.getParameter("user_name");
	String loginbirth = request.getParameter("user_birth");
	String loginemail = request.getParameter("user_email");
	
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String id =""; //DB ID
		String pwd =""; //DB PWD
		try{
			conn = DBConnection.getCon();
			String sql = "select USER_ID, USER_PWD from USER_INFO_TB where USER_NAME = '"+loginname+"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				id = rs.getString("USER_ID");
				pwd = rs.getString("USER_PWD");
				System.out.print(id);
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
	request.setAttribute("userID",id);
	response.sendRedirect("/common/login/userFindId.jsp");
/* 	if(loginid.equals(id) && loginpwd.equals(pwd))
	{
		session.setAttribute("user_id",loginid);
		response.sendRedirect("/common/home/home.jsp");
		
	}else{
		response.sendRedirect("login.jsp");
		} */

%>
</body>
</html>