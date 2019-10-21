<%@page import="yjmp.project.notice.NotificationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="yjmp.project.notice.NotificationDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		//JQuery AJAX 통신으로 받은 data
		String mainSubject = request.getParameter("mainSubject");
		String noticeClass = request.getParameter("noticeClass");
		String content = request.getParameter("content");
		String userId = session.getAttribute("id").toString();

		//공지사항 DB INSERT
		NotificationDAO noticeDAO = new NotificationDAO();
		int result = noticeDAO.write(mainSubject, content, noticeClass, userId);
		request.setAttribute("result", result);
	%>
</body>
</html>