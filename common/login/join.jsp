<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />
<script type="text/javascript">
//ȸ������ ���� üũ
	function checkValue() {
		inputForm = eval("document.joinInfo");
		var re = /^[a-zA-Z0-9]{4,12}$/; // ���̵� �������� �˻��� ���Խ�
		var re2 = /^[a-zA-Z0-9]{8,12}$/; // �н����尡 �������� �˻��� ���Խ�
		var re4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//email�� �������� �˻��� ���Խ�
		
		if (!inputForm.user_id.value) {
			alert("���̵� �Է��ϼ���");
			inputForm.user_id.focus();
			return false;
		}
		if(re.test(inputForm.user_id.value)==false){
			alert("���̵�� 4~12�ڷ� ���� �ҹ���, �빮�� ���ڸ� �����մϴ�");
			inputForm.user_id.focus();
			return false;
		}
		if (!inputForm.user_pwd.value) {
			alert("��й�ȣ�� �Է��ϼ���");
			inputForm.user_pwd.focus();	
			return false;
		}
		if(re2.test(inputForm.user_pwd.value)==false){
			alert("��й�ȣ�� 8~12�ڷ� ���� �ҹ���, �빮�� ���ڸ� �����մϴ�");
			inputForm.user_pwd.focus();
			return false;
		}
		if (!inputForm.user_pwd_check.value || inputForm.user_pwd_check.value!=inputForm.user_pwd.value) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
			inputForm.user_pwd_check.focus();
			return false;
		}
		if (!inputForm.user_name.value) {
			alert("�̸��� �Է��ϼ���");
			inputForm.user_name.focus();
			return false;
		}
		if (!inputForm.user_birth.value || inputForm.user_birth.value > 29999999 || inputForm.user_birth.value < 19000001 ) {
			alert("��������� Ȯ���ϼ���");
			inputForm.user_birth.focus();
			return false;
		}
		if (!inputForm.user_phone.value) {
			alert("�ڵ��� ��ȣ�� �Է��ϼ���");
			inputForm.user_phone.focus();
			return false;
		}
		if(re4.test(inputForm.user_email.value)==false){
			alert("�߸��� �̸��� �����Դϴ�")
			inputForm.user_email.focus();
			return false;
		}
		else{
			alert("���ԿϷ�");
			return true;
		}
	}
	function registCheckFunction() {
		var userID = $('#userID').val();
		$.ajax({
			type : 'POST',
			url : '/UserRegisterCheckServlet',
			data : {
				userID : userID
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result) {
				console.log(result);
				if (result == 1) {
					$('#checkMessage').html('����� �� �ִ� ���̵� �Դϴ�.');
					$('#checkType').attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('����� �� ���� ���̵� �Դϴ�.');
					$('#checkType').attr('class','modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		});
	}
</script>
</head>
<body>
	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<!-- start of .wrapper -->
	<div id="wrapper">
		<!-- side menu -->
		<div id="container">
			<div class="row">
				<div class="col-md-5 col-md-offset-5" stlye="text-align: center">
					<h1 class="page-header">ȸ������</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-default">
						<div class="panel-heading">ȸ������ ������</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-10 col-md-offset-1">
									<form role="form" method="post" action="/common/login/add.jsp"
										name="joinInfo" onsubmit="return checkValue();">
										<div class="form-group">
											<span class="pull-right" style="color: red"><label>�ʼ��Է�(*)</label></span>
											<label>���̵�(*)</label> <input class="form-control" type="text" id="userID" name="user_id" placeholder="���̵� �Է��ϼ���.">
										</div>
										<div class="form-group">
											<button type="button" class="btn btn-default" onclick="registCheckFunction();">���̵� �ߺ�Ȯ��</button>
										</div>
										<div class="form-group">
											<label>��й�ȣ(*)</label> <input class="form-control" id="userPWD" name="user_pwd" type="password" placeholder="��й�ȣ�� �Է��ϼ���.">
										</div>
										<div class="form-group">
											<label>��й�ȣ Ȯ��(*)</label> <input class="form-control" id="userPWDcheck" name="user_pwd_check" type="password" placeholder="��й�ȣ�� �� �� �� �Է��ϼ���.">
										</div>
										<div class="form-group">
											<label>�̸�(*)</label> <input class="form-control" type="text" name="user_name" placeholder="�̸��� �Է��ϼ���.">
										</div>

										<div class="form-group">
											<label>�����ڸ�</label> 
												<select class="form-control" name="position" >
													<option value="�ý��۰�����">�ý��� ������</option>
													<option value="��������">��� ������</option>
													<option value="â�������">â�� ������</option>
												</select>
										</div>
										<div class="form-group">
											<label>�μ���</label> 
												<select class="form-control" name="department" >
													<option value="����">����</option>
													<option value="IT��">IT��</option>
													<option value="�����ú�">�����ú�</option>
												</select>
										</div>

										<div class="form-group">
											<label>�������(*)</label> 
											<input class="form-control" name="user_birth" type="number" placeholder="��������� �Է��ϼ���" maxlength="8">
											<p>�������8�ڸ� ex) 19900204</p>
										</div>
										<div class="form-group">
											<label>����</label> 
												<select class="form-control" name="gender" >
													<option value="1">��</option>
													<option value="2">��</option>
												</select>
										</div>


										<div class="form-group">
											<label>�޴�����ȣ</label> 
											<input class="form-control" type="number" name="user_phone" maxlength="12" placeholder="�޴�����ȣ�� �Է��ϼ���.">
											<p>-�� ������ ������ ��ȣ�� �Է��� �ּ��� ex) 01012345678</p>
										</div>
										<div class="form-group">
											<label>�̸���(*)</label> 
											<input class="form-control" type="text" id="userEMAIL" name="user_email" placeholder="�̸����� �Է��ϼ���.">
											<p>ex) smartfactory@naver.com</p>
										</div>
										<span class="pull-right">
											<input type="submit" class="btn btn-default" value="����">
											<button type="reset" class="btn btn-default" onclick="goBack()">���</button>
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
		<!-- /#wrapper -->
	</div>


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
						<button type="button" class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
function goBack() {
	location.href="/common/login/login.jsp";
}
</script>
</body>
</html>