<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

		<!-- 상단 및 왼쪽 menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />
		
		<!-- start of .page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">긴급 업무 안내</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<!-- start of #row -->
			<div class="row">
				<!-- start of #col-lg-12 -->
				<div class="col-lg-12">
					<!-- start of #panel panel-default -->
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-heading">긴급 업무 안내</div>
							<!-- /.panel-body -->
							<div class="panel-body">
								<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<thead>
										<tr>
											<th>
												<div class="checkbox">
													<label class="form-check-label"><input type="checkbox" class="form-check-input" checked>&nbsp;</label>
												</div>
											</th>
											<th>Rendering engine</th>
											<th>Browser</th>
											<th>Platform(s)</th>
											<th>Engine version</th>
											<th>CSS grade</th>
										</tr>
									</thead>

									<tbody>
										<tr class="odd gradeX">
											<td>
											<div class="checkbox">
												<label class="form-check-label"><input type="checkbox" class="form-check-input" checked>&nbsp;</label>
											</div>
											</td>
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
										</tr>

									</tbody>
								</table>
							</div>
								<span class="pull-right">
									<button type="button" class="btn btn-outline btn-default">글쓰기</button>
									<button type="button" class="btn btn-outline btn-success">수정</button>
									<button type="button" class="btn btn-outline btn-danger">삭제</button>
								</span>
						</div>
						<!-- end of #panel panel default -->
					</div>
					<!-- end of #col-lg-12 -->
				</div>
				<!-- end of #Row -->
			</div>
			<!-- end of #page-wrapper -->
		</div>
		<!-- end of #wrapper -->

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
			responsive : true
			});
		});
	</script>
</body>

</html>
