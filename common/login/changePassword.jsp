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

	<!-- start of .wrapper -->
	<div id="wrapper">
		<!-- side menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />
		<div id="container">

			<div class="row">
				<div class="col-md-5 col-md-offset-5" stlye="text-align: center">
					<h1 class="page-header">��й�ȣ �����ϱ�</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-default">
						<div class="panel-heading">��й�ȣ �����ϱ�</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-10 col-md-offset-1">
									<form role="form">

										<div class="form-group">
											<label>������ ��й�ȣ�� �Է��� �ּ���.</label><br> <label>�� ��й�ȣ</label> 
											<input class="form-control" type="password" placeholder="�� ��й�ȣ�� �Է����ּ���.">

										</div>

										<div class="form-group">
											<label>�� ��й�ȣ Ȯ��</label> 
											<input class="form-control" type="password" placeholder="Ȯ���� �� ��й�ȣ�� �Է����ּ���.">
										</div>
										<span class="pull-right">
											<button type="submit" class="btn btn-default">����</button>
											<button type="reset" class="btn btn-default">���</button>
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