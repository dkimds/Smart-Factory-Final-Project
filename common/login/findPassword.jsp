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
<script>alert("당신의 비밀번호는 <%=pwd%> 입니다");</script>
	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<!-- start of .wrapper -->
	<div id="wrapper">
		<!-- side menu -->
		<div id="container">

			<div class="row">
				<div class="col-md-5 col-md-offset-5" stlye="text-align: center">
					<h1 class="page-header">비밀번호 찾기</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-default">
						<div class="panel-heading">비밀번호 찾기</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-10 col-md-offset-1">
									<form role="form" method="post" action="/common/login/pwdFindPro.jsp">

										<div class="form-group">
											<label>이름</label> <input class="form-control" type="text" name="user_name" placeholder="이름 입력하세요.">
										</div>
										<div class="form-group">
											<label>생년월일</label> <input class="form-control" type="text" name="user_birth" placeholder="생년월일을 입력하세요">
											<p>생년월일8자리 ex) 19900204</p>
										</div>
										<div class="form-group">
											<label>아이디</label> <input class="form-control" type="text" name="user_id" placeholder="아이디를 입력하세요.">
										</div>
										<div class="form-group">
											<label>이메일</label> <input class="form-control" type="text" name="user_email" placeholder="이메일을 입력하세요.">
											<p>ex) smartfactory@naver.com</p>
										</div>
										<span class="pull-right">
											<button type="submit" class="btn btn-default">찾기</button>
											<button type="reset" class="btn btn-default">취소</button>
											<button type="button" class="btn btn-default" onclick="location.href='/common/login/login.jsp'">로그인 화면으로 가기</button>
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