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
	//�̸�, ����, �̸��� �Ķ���� ���� �޴´�
	request.setCharacterEncoding("EUC-KR");
	String loginid = request.getParameter("user_id"); //�Է¹��� id
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
			//���̵�, �̸�, �̸��Ϸ� �˻��Ͽ� ��й�ȣ�� ���
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
		//ã�� ���̵� userPWD��� ��ü�� �ѱ�
	session.setAttribute("userPWD",pwd);
	response.sendRedirect("/common/login/findPassword.jsp");

%>
</body>
</html>