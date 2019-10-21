<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="yjmp.project.notice.NotificationDAO"%>
<%@ page import="yjmp.project.notice.NotificationVO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">

<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />

<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<%
		String user_Id = null;
			if(session.getAttribute("id") != null){
		user_Id = (String) session.getAttribute("id");
			}
			int notice_Seq = 0;
			if(request.getParameter("notice_Seq") != null){
		notice_Seq = Integer.parseInt(request.getParameter("notice_Seq"));
			}
			if(notice_Seq == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'notification.jsp'");
		script.println("<script>");	
			}
			NotificationVO notice = new NotificationDAO().getNotification(notice_Seq);
	%>

	<div id="wrapper">

		<!-- 상단 및 왼쪽 menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<div id="page-wrapper">
			<!-- start of #row -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">공지사항</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- end of #row -->

			<!-- start of #row -->
			<div class="row">
				<!-- start of #col-lg-12 -->
				<div class="col-lg-12">
					<!-- start of #panel panel-default -->
					<div class="panel panel-default"></div>
					<!-- start of #panel-heading -->
					<div class="panel-heading">공지사항</div>
					<!-- start of #panel-body -->
					<div class="panel-body">
						<div class="row">
							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th colspan="3"
											style="background-color: #eeeeee; text-align: center;">게시판
											글 보기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="width: 20%">글 제목</td>
										<td colspan="2"><%= notice.getNotice_Subject() %></td>
									</tr>
									<tr>
										<td>작성자</td>
										<td colspan="2"><%= notice.getUser_Id().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
									</tr>
									<tr>
										<td>작성일자</td>
										<td colspan="2"><%= notice.getNotice_Date() %></td>
									</tr>
									<tr>
										<td>내용</td>
										<td colspan="2" style="min-height: 200px; text-align: left"><%=notice.getNotice_Content().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
									</tr>
								</tbody>
							</table>
							<a href="notification.jsp" class="btn btn-outline btn-primary">목록</a>
							<%
								if(user_Id != null && user_Id.equals(notice.getUser_Id())){
							%>
							<a href="update.jsp?notice_Seq=<%= notice_Seq %>" class="btn btn-outline btn-success">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?notice_Seq=<%= notice_Seq %>" class="btn btn-outline btn-danger">삭제</a>
							<%
								} 
							%>
							<input type="submit" class="btn btn-default pull-right" value="글쓰기">
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>