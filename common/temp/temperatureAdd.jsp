<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="yjmp.project.DB.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader" %>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL" %>
<%@page import="java.net.Proxy"%>
<%@page import="java.net.InetSocketAddress" %>
<%@page import="javax.net.ssl.HttpsURLConnection" %>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
response.setIntHeader("Refresh", 5);
Calendar calendar = new GregorianCalendar();
String am_pm;
int year = calendar.get(Calendar.YEAR);
int month = calendar.get(Calendar.MONTH);
int date = calendar.get(Calendar.DATE);
int hour = calendar.get(Calendar.HOUR);
int minute = calendar.get(Calendar.MINUTE);
int second = calendar.get(Calendar.SECOND);
if(calendar.get(Calendar.AM_PM) == 0)
   am_pm = "AM";
else
   am_pm = "PM";
String CurrentTime = year+":"+month+":"+date+":"+hour+":"+ minute +":"+ second +" "+ am_pm;
%>
<%=CurrentTime %>
<%
request.setCharacterEncoding("EUC-KR");
String temp= request.getParameter("Temperature");
String humi= request.getParameter("Humidity");
System.out.print("받아오는 temp 값 : ");
System.out.println(temp);

Connection conn = null;
PreparedStatement pstmt = null;
int n =0;	
try{
	conn = DBConnection.getCon();
	System.out.println(temp);
	String sql = "insert into TEST(TEM,HUM,TEM_DATE) values('"+temp+"','"+humi+"','"+CurrentTime+"')";
	pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, id);
//		pstmt.setString(2, name);
//		pstmt.setString(3, status);
	n = pstmt.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}finally{
		if(pstmt!=null) try{ pstmt.close();} catch(SQLException sqle){}
		if(conn!=null) try{ conn.close();} catch(SQLException sqle){}
}
%>
<%=temp %>

</body>
</html>