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

		<!-- 상단 및 왼쪽 menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">장비 수리</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="panel-heading">장비 수리</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<form role="form" id="repairEquipForm">
							<div class="form-group">
								<label>장비명</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>장비코드</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>수량</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>제조사</label> <input class="form-control">
							</div>
							<label>등록일</label>
							<div class="srchWrap">
								<div class="termSelBox">
									<i class="fa fa-calendar fa-fw"></i> <input type="text" placeholder="시작 날짜" class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> 
									<span class="unit">~</span> 
									<input type="text" placeholder="종료 날짜" 	class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
								</div>
							</div>
							<label>장비 수리일</label>
							<div class="srchWrap">
								<div class="termSelBox">
									<i class="fa fa-calendar fa-fw"></i> <input type="text" placeholder="시작 날짜" class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> 
									<span class="unit">~</span> 
									<input type="text" placeholder="종료 날짜" 	class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
								</div>
							</div>
						</form>
					</div>
					<!-- /.col-lg-6 (nested) -->
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								<label>장비 위치</label> <input class="form-control">
							</div>
							<div class="form-group">
								<label>장비 상태</label> <input class="form-control">
							</div>
							<span class="pull-right">
								<button type="button" class="btn btn-outline btn-success" id="repairEquipBtn">추가</button>
								<button type="button" class="btn btn-outline btn-danger">취소</button>
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