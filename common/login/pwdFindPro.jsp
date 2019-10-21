<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="yjmp.project.DB.DBConnection" %>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	//이름, 생일, 이메일 파라미터 값을 받는다
	request.setCharacterEncoding("EUC-KR");
	String loginid = request.getParameter("user_id"); //입력받은 id
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
			//아이디, 이름, 이메일로 검색하여 비밀번호를 출력
			String sql = "select USER_PWD from USER_INFO_TB where USER_ID = '"+loginid+"' AND USER_NAME = '"+loginname+"' AND USER_EMAIL = '"+loginemail+"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				pwd = rs.getString("USER_PWD");
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
		//찾은 아이디를 userPWD라는 객체로 넘김
	session.setAttribute("userPWD",pwd);
	response.sendRedirect("/common/login/findPassword.jsp");

%>
</body>
</html>