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
					<h1 class="page-header">장비 설치</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">장비 설치</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form role="form" id="installEquipForm">
								<div class="form-group">
									<label>기관명</label> 
									<input class="form-control" type="text" name="companyName">
								</div>
								<div class="form-group">
									<label>장비명</label> 
									<input class="form-control" type="text" name="equipName">
								</div>
								<div class="form-group">
									<label>요청사유</label> 
									<input class="form-control" type="text" name="requestReason">
								</div>
								<label>계약기간</label>
								<div class="srchWrap">
									<div class="termSelBox">
										<i class="fa fa-calendar fa-fw"></i> 
										<input type="text" name="startDate" placeholder="시작 날짜" class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> <span class="unit">~</span> 
										<input type="text" name="endDate" placeholder="종료 날짜" 	class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
									</div>
								</div>
							</form>
						</div>
						<!-- /.col-lg-6 (nested) -->
						<div class="col-lg-6">
							<form role="form">
								<div class="form-group">
									<label>창고명</label> <input class="form-control">
								</div>
								<div class="form-group">
									<label>요청자</label> <input class="form-control">
								</div>
								<div class="form-group">
									<label>작업내역</label> <input class="form-control">
								</div>
								<div class="form-group has-success">
									<label class="control-label" for="inputSuccess">Input
										with success</label> <input type="text" class="form-control"
										id="inputSuccess">
								</div>
								<div class="form-group has-warning">
									<label class="control-label" for="inputWarning">Input
										with warning</label> <input type="text" class="form-control"
										id="inputWarning">
								</div>
								<div class="form-group has-error">
									<label class="control-label" for="inputError">Input
										with error</label> <input type="text" class="form-control"
										id="inputError">
								</div>
								<span class="pull-right">
									<button type="button" name="enrollEquipBtn" class="btn btn-outline btn-success" style=>추가</button>
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
	<script>
	$(document).ready(function() {
		 $("#installEquipBtn").click(function() {
		  var formData = $("#installEquipForm").serialize();
		  $.ajax({
		   type : "POST",
		   url : "/installEquipController",
		   cache : false,
		   data : formData,
		   success : function test(){
			   console.log('Success.');
		   },
		   error : function error(){
			   console.log('Fail');
		   }
		  });
		 });
		});
	</script>
</body>
</html>