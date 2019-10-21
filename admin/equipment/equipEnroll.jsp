<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
					<h1 class="page-header">��� �߰�</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="panel panel-default">
				<div class="panel-heading">��� �߰�</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="col-lg-10 col-md-offset-1">
						<form role="form" id="enrollEquipForm">
							<div class="form-group">
								<label>�з�</label> 
								<select class="form-control" name="equipCategory">
									<option>�µ���ġ</option>
									<option>������ġ</option>
									<option>������</option>
									<option>��</option>
								</select>
							</div>
							<div class="form-group">
								<label>����</label> <input class="form-control" type="text" name="equipName">
							</div>
							<div class="form-group">
								<label>����ڵ�</label> <input class="form-control" type="text" name="equipID">
							</div>
							<div class="form-group">
								<label>����</label> <input class="form-control" type="text" name="equipCount">
							</div>
							<label>�����</label>
							<div class="srchWrap">
								<div class="termSelBox">
									<i class="fa fa-calendar fa-fw"></i> 
									<input type="text" name="equipEnrollStartDate" placeholder="���� ��¥" class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> 
									<span class="unit">~</span> 
									<input type="text" name="equipEnrollEndDate" placeholder="���� ��¥" 	class="datepicker-here selector" style="width: 45%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
								</div>
							</div>
							<br>
							<div class="form-group">
								<label>������</label> <input class="form-control" type="text" name="equipCompany">
							</div>
							<div class="form-group">
								<label>IP</label> <input class="form-control" type="text" name="equipIP">
							</div>
							<span class="pull-right">
								<button type="button" class="btn btn-outline btn-success" id="enrollEquipBtn">�߰�</button>
								<button type="button" class="btn btn-outline btn-danger" onclick="javascript:history.back();">���</button>
							</span>
						</form>
					</div>

				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	<script>
	$(document).ready(function() {
		 $("#enrollEquipBtn").click(function() {
		  var formData = $("#enrollEquipForm").serialize();
		  $.ajax({
		   type : "POST",
		   url : "/enrollEquipController",
		   cache : false,
		   data : formData,
		   success : function test(data){
			   
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