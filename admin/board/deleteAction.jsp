<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
		String user_Id = null;
			if (session.getAttribute("user_Id") != null) {
				user_Id = (String) session.getAttribute("user_Id");
			}
			if (user_Id == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�α����� �ϼ���.')");
				script.println("location.href = '/common/login/login.jsp'");
				script.println("</script>");
			}
			int notice_Seq = 0;
			if (request.getParameter("notice_Seq") != null) {
				notice_Seq = Integer.parseInt(request.getParameter("notice_Seq"));
			}
			if (notice_Seq == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('��ȿ���� ���� ���Դϴ�.')");
				script.println("location.href = 'notification.jsp'");
				script.println("<script>");
			}
			NotificationVO notice = new NotificationDAO().getNotification(notice_Seq);
			if (!user_Id.equals(notice.getUser_Id())) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ �����ϴ�.')");
				script.println("location.href = 'notification.jsp'");
				script.println("<script>");
			}
			else{
			NotificationDAO noticeDAO = new NotificationDAO();
			int result = noticeDAO.delete(notice_Seq);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�� ������ �����߽��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'notification.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>