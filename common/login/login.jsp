<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />

<script type="text/javascript">
	function LoginCheckFunction() {
		var userID = $('#userID').val();
		var userPWD = $('#userPWD').val();
		var check = -1;
		$.ajax({
			type : 'POST',
			url : '/LoginCheckServlet',
			data : {
				userID : userID,
				userPWD : userPWD
			},
			success : function(result) {
				if (result == 1) {
					$('#checkMessage').html('�α����� �Ϸ�Ǿ����ϴ�.');
					$('#checkType').attr('class', 'modal-content panel-success');
					aa(1);
				} else {
					$('#checkMessage').html('���̵�, ��й�ȣ�� �ٽ� �Է��� �ּ���.');
					$('#checkType').attr('class', 'modal-content panel-warning');
					aa(0);
				}
				$('#checkModal').modal("show");
			}
		})
	}
	
	window.history.forward();
	function aa(num) {
		if (num == 1) {
			console.log(num);
			var userID = $('#userID').val();
			window.history.forward(); //�α��� �� Ȩȭ�鿡�� �ڷΰ��� ����
			location.href = "/common/home/home.jsp";
		}
	}
</script>
</head>
<body>
	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<!-- start of .wrapper -->
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="login-panel panel panel-default">
							<div class="panel-heading" style="text-align: center">
								<h3 class="panel-title">�α���</h3>
							</div>
							<div class="panel-body">
								<form role="form" method="post" action="/common/login/loginPro.jsp">
									<fieldset>
										<div class="form-group">
											<input class="form-control" placeholder="���̵�" name="user_id" type="text" id="userID" autofocus>
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="��й�ȣ" name="password" type="password" id="userPWD" name="user_pwd" value="">
										</div>
										<div class="checkbox">
											<label> <input name="remember" type="checkbox" value="Remember Me">���̵� ����
											</label>
										</div>
										<!-- Change this to a button or input when using this as a form -->
										<a class="btn btn-lg btn-success btn-block" onclick="LoginCheckFunction();">�α���</a>
										<table style="width: 105%; text-align: center">
											<tr>
												<td style="text-align: center"><a href="/common/login/join.jsp">ȸ������</a></td>
												<td style="text-align: center"><a href="/common/login/userFindId.jsp">���̵� ã��</a></td>
												<td style="text-align: center"><a href="/common/login/findPassword.jsp">��й�ȣ ã��</a></td>
											</tr>
										</table>
									</fieldset>
								</form>
							</div>
							<!-- end of panel-body -->
						</div>
						<!-- end of login-panel panel panel-default -->
					</div>
					<!-- end of col-md-4 col-md-offset-4 -->
				</div>
				<!-- end of row -->	
			</div>
			<!-- end of container -->	
		</div>
		<!-- end of .page-wrapper -->	
	</div>
	<!-- end of .wrapper -->	
	
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">Ȯ�θ޼���</h4>
					</div>
					<div class="modal-body" id="checkMessage"></div>
					<div class="modal-footer" id="checkMessage">
						<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="aa();">Ȯ��</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>