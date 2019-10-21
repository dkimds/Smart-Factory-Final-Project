<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="yjmp.project.notice.NotificationDAO"%>
<%@ page import="yjmp.project.notice.NotificationVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

//JQuery AJAX 통신으로 받은 data
		int noticeSeq = Integer.parseInt(request.getParameter("noticeSeq"));
		String mainSubject = request.getParameter("mainSubject");
		String noticeClass = request.getParameter("noticeClass");
		String content = request.getParameter("content");
		String userId = session.getAttribute("id").toString();
		
		//공지사항 DB INSERT
				NotificationDAO noticeDAO = new NotificationDAO();
				int result = noticeDAO.update(noticeSeq, mainSubject, content);
				request.setAttribute("result", result);
%>
</body>
</html>