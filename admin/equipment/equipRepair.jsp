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
					<h1 class="page-header">��� ����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="panel-heading">��� ����</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form role="form" id="repairEquipForm">
							<div class="form-group">
								<label>����</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>����ڵ�</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>����</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>������</label> <input class="form-control">
							</div>
							<label>�����</label>
							<div class="srchWrap">
								<div class="termSelBox">
									<i class="fa fa-calendar fa-fw"></i> <input type="text" placeholder="���� ��¥" class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> 
									<span class="unit">~</span> 
									<input type="text" placeholder="���� ��¥" 	class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
								</div>
							</div>
							<label>��� ������</label>
							<div class="srchWrap">
								<div class="termSelBox">
									<i class="fa fa-calendar fa-fw"></i> <input type="text" placeholder="���� ��¥" class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> 
									<span class="unit">~</span> 
									<input type="text" placeholder="���� ��¥" 	class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
								</div>
							</div>
						</form>
					</div>
					<!-- /.col-lg-6 (nested) -->
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								<label>��� ��ġ</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>��� ����</label> <input class="form-control">
							</div>
							<span class="pull-right">
								<button type="button" class="btn btn-outline btn-success" id="repairEquipBtn">�߰�</button>
								<button type="button" class="btn btn-outline btn-danger">���</button>
							</span>
						</form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});

		$(document).ready(function() {
			$("#repairEquipBtn").click(function() {
				var formData = $("#repairEquipForm").serialize();
				$.ajax({
					type : "POST",
					url : "/RepairEquipController",
					cache : false,
					data : formData,
					success : function test() {
						console.log('Success.');
					},
					error : function error() {
						console.log('Fail');
					}
				});
			});
		});
	</script>

</body>
</html>