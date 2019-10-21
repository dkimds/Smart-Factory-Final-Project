<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />
</head>
<body>
<%
request.setCharacterEncoding("EUC-KR");
String pwd = (String)session.getAttribute("userPWD");
%>
<script>alert("����� ��й�ȣ�� <%=pwd%> �Դϴ�");</script>
	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<!-- start of .wrapper -->
	<div id="wrapper">
		<!-- side menu -->
		<div id="container">

			<div class="row">
				<div class="col-md-5 col-md-offset-5" stlye="text-align: center">
					<h1 class="page-header">��й�ȣ ã��</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-default">
						<div class="panel-heading">��й�ȣ ã��</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-10 col-md-offset-1">
									<form role="form" method="post" action="/common/login/pwdFindPro.jsp">

										<div class="form-group">
											<label>�̸�</label> <input class="form-control" type="text" name="user_name" placeholder="�̸� �Է��ϼ���.">
										</div>
										<div class="form-group">
											<label>�������</label> <input class="form-control" type="text" name="user_birth" placeholder="��������� �Է��ϼ���">
											<p>�������8�ڸ� ex) 19900204</p>
										</div>
										<div class="form-group">
											<label>���̵�</label> <input class="form-control" type="text" name="user_id" placeholder="���̵� �Է��ϼ���.">
										</div>
										<div class="form-group">
											<label>�̸���</label> <input class="form-control" type="text" name="user_email" placeholder="�̸����� �Է��ϼ���.">
											<p>ex) smartfactory@naver.com</p>
										</div>
										<span class="pull-right">
											<button type="submit" class="btn btn-default">ã��</button>
											<button type="reset" class="btn btn-default">���</button>
											<button type="button" class="btn btn-default" onclick="location.href='/common/login/login.jsp'">�α��� ȭ������ ����</button>
										</span>
									</form>
								</div>
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>