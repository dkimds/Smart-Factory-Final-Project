<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
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
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">�ý��� ����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">�ý��� ����</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-lg-10 col-md-offset-1">
								<form role="form">
									<div class="form-group">
										<label>�з�</label> <select class="form-control">
											<option>������</option>
											<option>�˸�����</option>
											<option>��࿬��</option>
											<option>��Ÿ</option>
										</select>
									</div>
									<div class="form-group">
										<label>�����ڸ�</label> <input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>���̵�</label> <input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>����</label> <input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>����</label>
										<textarea class="form-control" rows="10"></textarea>
									</div>

									<span class="pull-right">
										<button type="button" class="btn btn-outline btn-success"
											style=>Ȯ��</button>
										<button type="button" class="btn btn-outline btn-danger">���</button>
									</span>




								</form>
							</div>

						</div>
						<!-- /.col-lg-12 -->
					</div>
				</div>
			</div>
			<!-- /#page-wrapper -->
		</div>
	</div>
	<!-- /#wrapper -->
</body>
</html>