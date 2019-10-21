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
					<h1 class="page-header">시스템 문의</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">시스템 문의</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-lg-10 col-md-offset-1">
								<form role="form">
									<div class="form-group">
										<label>분류</label> <select class="form-control">
											<option>장비고장</option>
											<option>알림고장</option>
											<option>계약연장</option>
											<option>기타</option>
										</select>
									</div>
									<div class="form-group">
										<label>문의자명</label> <input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>아이디</label> <input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>제목</label> <input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>내용</label>
										<textarea class="form-control" rows="10"></textarea>
									</div>

									<span class="pull-right">
										<button type="button" class="btn btn-outline btn-success"
											style=>확인</button>
										<button type="button" class="btn btn-outline btn-danger">취소</button>
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