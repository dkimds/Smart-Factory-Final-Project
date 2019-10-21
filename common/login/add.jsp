<%@page import="java.sql.DriverManager"%>
<%@page import="yjmp.project.DB.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	String name = request.getParameter("user_name");
	String position = request.getParameter("position");
	String department = request.getParameter("department");
	String birth = request.getParameter("user_birth");
	String phone = request.getParameter("user_phone");
	String email = request.getParameter("user_email");
	String gender = request.getParameter("gender");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int n =0;	
	try{
		conn = DBConnection.getCon();
		//회원가입 DB추가 (TEST 테이블. 추후에 실제 테이블로 바꿔야함)
		String sql = "insert into USER_INFO_TB(USER_SEQ,USER_ID, USER_PWD, USER_NAME, USER_POSITION, USER_DEPARTMENT,USER_BIRTH,USER_PHONE,USER_EMAIL,USER_GENDER)" + 
				"values(USER_SEQ.nextval, '"+id+"','"+pwd+"','"+name+"','"+position+"','"+department+"','"+birth+"','"+phone+"','"+email+"','"+gender+"')";
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