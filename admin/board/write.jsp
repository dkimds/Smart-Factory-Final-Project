<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />

</head>
<body>
	<!-- Session ���� -->
	<%
		String user_Id = null;
		if (session.getAttribute("id") != null) {
			user_Id = session.getAttribute("id").toString();
		}
	%>

	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<div id="wrapper">
		<!-- ��� �� ���� menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<!-- Write Form -->
		<div id="page-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-12" style="text-align: center">
						<h1 class="page-header">��������</h1>
					</div>
				</div>
				<!-- /. row -->

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">��������</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form role="form" id="writeForm">
											<div class="form-group">
												<label>�� ����</label> <input class="form-control" type="text" id="notice_subject" placeholder="������ �Է��� �ּ���">
												<div class="form-group"></div>
												<div class="form-group">
													<label>���Ӹ�</label> 
													<select class="form-control" id="first_Step">
														<option value="��������" selected="selected">[��������]</option>
														<option value="��޾���">[��޾���]</option>
													</select>
												</div>
												<div class="form-group">
													<label>����</label> 
													<select class="form-control" id="notice_Class">
														<option value="�濵������" selected="selected">�濵������</option>
														<option value="���߽�">���߽�</option>
														<option value="������">������</option>
														<option value="������">������</option>
														<option value="ȫ����">ȫ����</option>
													</select>
												</div>
												<div class="form-group">
													<label>�� ����</label>
													<textarea class="form-control" placeholder="�� ����" id="notice_Content" maxlength="500" style="height: 350px;"></textarea>
												</div>
											</div>
											<input type="button" id="writeBtn" class="btn btn-default pull-right" value="�۾���">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$("#writeBtn").click(function() {
//		 		UserId Ȯ��
				if('<%= user_Id%>'==null){
					console.log(<%= user_Id%>);
					alert('�α����� �ϼ���.');
					location.href = '/common/login/login.jsp';
				}else{
					var noticeClass = $("#notice_Class option:selected").val();
					var firstStep = $("#first_Step option:selected").val();
					var subject = $("#notice_subject").val();
					var content = $("#notice_Content").val();
					
					//����� ���� �ΰ� Ȯ��
					if(subject.length == 0 && content.length == 0){
						alert('�Է��� �ȵ� ������ �ֽ��ϴ�.');
					}else{
						var mainSubject = firstStep + " " + subject;
						
						$.ajax({
							type : "POST",
							url : "/admin/board/writeAction.jsp",
							cache : false,
							data : {
								noticeClass: noticeClass,
								mainSubject : mainSubject,
								content : content
							},
							success : function test(result){
								console.log(result);
								chkedResult(result);
							},
							error : function error(){
								console.log('Fail');
							}
						});
					}
				}
			});
		});
		
// 		SQL INSERT ���� Ȯ��
		function chkedResult(result){
			if(result == -1){
				alert('�۾��⿡ �����߽��ϴ�.');
				history.back();				
			}else{
				location.href = '/admin/board/notification.jsp'; 
			}
		}
	</script>
</body>
</html>