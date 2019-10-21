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
					<h1 class="page-header">비밀번호 변경하기</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-default">
						<div class="panel-heading">비밀번호 변경하기</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-10 col-md-offset-1">
									<form role="form">

										<div class="form-group">
											<label>변경할 비밀번호를 입력해 주세요.</label><br> <label>새 비밀번호</label> 
											<input class="form-control" type="password" placeholder="새 비밀번호를 입력해주세요.">

										</div>

										<div class="form-group">
											<label>새 비밀번호 확인</label> 
											<input class="form-control" type="password" placeholder="확인할 새 비밀번호를 입력해주세요.">
										</div>
										<span class="pull-right">
											<button type="submit" class="btn btn-default">변경</button>
											<button type="reset" class="btn btn-default">취소</button>
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