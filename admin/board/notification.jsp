<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="yjmp.project.notice.NotificationDAO"%>
<%@ page import="yjmp.project.notice.NotificationVO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />

</head>

<body>
	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<!--start of .Wrapper -->
	<div id="wrapper">

		<!-- ��� �� ���� menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<div id="page-wrapper">
			<!-- start of #row -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">��������</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- end of #row -->

			<!-- start of #row -->
			<div class="row">
				<!-- start of #col-lg-12 -->
				<div class="col-lg-12">
					<!-- start of #panel panel-default -->
					<div class="panel panel-default">
						<!-- start of #panel-heading -->
						<div class="panel-heading">��������</div>
						<!-- start of #panel-body -->
						<div class="panel-body">
							<!-- start of #panel panel-default -->
							<div class="panel panel-default">

								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>
												<div class="checkbox">
													<label class="form-check-label"><input
														type="checkbox" class="form-check-input" checked>&nbsp;</label>
												</div> ��ȣ
											</th>
											<th>����</th>
											<th>�ۼ���</th>
											<th>�ۼ���</th>
										</tr>
									</thead>
									<tbody>
										<%
											System.out.println("###���@@@");
											NotificationDAO notice = new NotificationDAO();
											ArrayList<NotificationVO> list = notice.getList();
											for (int i = 0; i < list.size(); i++) {
										%>
										<tr class="odd gradeX">
											<td>
												<div class="checkbox">
													<label class="form-check-label">
													<input type="checkbox" class="form-check-input" checked>&nbsp;</label>
												</div> 
												<%=list.get(i).getNotice_Seq()%>
											</td>
											<td><a href="view.jsp?notice_Seq=<%=list.get(i).getNotice_Seq()%>"><%=list.get(i).getNotice_Subject()%></a></td>
											<td><%=list.get(i).getUser_Id()%></td>
											<td><%=list.get(i).getNotice_Date()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<span class="pull-right"> <a href="write.jsp"
								class="btn btn-default pull-right">�۾���</a>
							</span>
						</div>
						<!-- end of .panel-body -->
					</div>
					<!-- end of .panel -->
				</div>
				<!-- end of col-lg-12 -->
			</div>
			<!-- end of #row -->
		</div>
		<!-- end of #page-wrapper -->
	</div>
	<!-- end of #wrapper -->

	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>

</html>
