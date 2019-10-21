<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />
<script type="text/javascript">
//회원가입 공란 체크
	function checkValue() {
		inputForm = eval("document.joinInfo");
		var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디가 적합한지 검사할 정규식
		var re2 = /^[a-zA-Z0-9]{8,12}$/; // 패스워드가 적합한지 검사할 정규식
		var re4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//email이 적합한지 검사할 정규식
		
		if (!inputForm.user_id.value) {
			alert("아이디를 입력하세요");
			inputForm.user_id.focus();
			return false;
		}
		if(re.test(inputForm.user_id.value)==false){
			alert("아이디는 4~12자로 영어 소문자, 대문자 숫자만 가능합니다");
			inputForm.user_id.focus();
			return false;
		}
		if (!inputForm.user_pwd.value) {
			alert("비밀번호를 입력하세요");
			inputForm.user_pwd.focus();	
			return false;
		}
		if(re2.test(inputForm.user_pwd.value)==false){
			alert("비밀번호는 8~12자로 영어 소문자, 대문자 숫자만 가능합니다");
			inputForm.user_pwd.focus();
			return false;
		}
		if (!inputForm.user_pwd_check.value || inputForm.user_pwd_check.value!=inputForm.user_pwd.value) {
			alert("비밀번호가 일치하지 않습니다");
			inputForm.user_pwd_check.focus();
			return false;
		}
		if (!inputForm.user_name.value) {
			alert("이름을 입력하세요");
			inputForm.user_name.focus();
			return false;
		}
		if (!inputForm.user_birth.value || inputForm.user_birth.value > 29999999 || inputForm.user_birth.value < 19000001 ) {
			alert("생년월일을 확인하세요");
			inputForm.user_birth.focus();
			return false;
		}
		if (!inputForm.user_phone.value) {
			alert("핸드폰 번호를 입력하세요");
			inputForm.user_phone.focus();
			return false;
		}
		if(re4.test(inputForm.user_email.value)==false){
			alert("잘못된 이메일 형식입니다")
			inputForm.user_email.focus();
			return false;
		}
		else{
			alert("가입완료");
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
					$('#checkMessage').html('사용할 수 있는 아이디 입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디 입니다.');
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
					<h1 class="page-header">회원가입</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel panel-default">
						<div class="panel-heading">회원가입 페이지</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-10 col-md-offset-1">
									<form role="form" method="post" action="/common/login/add.jsp"
										name="joinInfo" onsubmit="return checkValue();">
										<div class="form-group">
											<span class="pull-right" style="color: red"><label>필수입력(*)</label></span>
											<label>아이디(*)</label> <input class="form-control" type="text" id="userID" name="user_id" placeholder="아이디를 입력하세요.">
										</div>
										<div class="form-group">
											<button type="button" class="btn btn-default" onclick="registCheckFunction();">아이디 중복확인</button>
										</div>
										<div class="form-group">
											<label>비밀번호(*)</label> <input class="form-control" id="userPWD" name="user_pwd" type="password" placeholder="비밀번호를 입력하세요.">
										</div>
										<div class="form-group">
											<label>비밀번호 확인(*)</label> <input class="form-control" id="userPWDcheck" name="user_pwd_check" type="password" placeholder="비밀번호를 한 번 더 입력하세요.">
										</div>
										<div class="form-group">
											<label>이름(*)</label> <input class="form-control" type="text" name="user_name" placeholder="이름을 입력하세요.">
										</div>

										<div class="form-group">
											<label>관리자명</label> 
												<select class="form-control" name="position" >
													<option value="시스템관리자">시스템 관리자</option>
													<option value="장비관리자">장비 관리자</option>
													<option value="창고관리자">창고 관리자</option>
												</select>
										</div>
										<div class="form-group">
											<label>부서명</label> 
												<select class="form-control" name="department" >
													<option value="기계부">기계부</option>
													<option value="IT부">IT부</option>
													<option value="마케팅부">마케팅부</option>
												</select>
										</div>

										<div class="form-group">
											<label>생년월일(*)</label> 
											<input class="form-control" name="user_birth" type="number" placeholder="생년월일을 입력하세요" maxlength="8">
											<p>생년월일8자리 ex) 19900204</p>
										</div>
										<div class="form-group">
											<label>성별</label> 
												<select class="form-control" name="gender" >
													<option value="1">남</option>
													<option value="2">여</option>
												</select>
										</div>


										<div class="form-group">
											<label>휴대폰번호</label> 
											<input class="form-control" type="number" name="user_phone" maxlength="12" placeholder="휴대폰번호를 입력하세요.">
											<p>-을 제외한 나머지 번호를 입력해 주세요 ex) 01012345678</p>
										</div>
										<div class="form-group">
											<label>이메일(*)</label> 
											<input class="form-control" type="text" id="userEMAIL" name="user_email" placeholder="이메일을 입력하세요.">
											<p>ex) smartfactory@naver.com</p>
										</div>
										<span class="pull-right">
											<input type="submit" class="btn btn-default" value="가입">
											<button type="reset" class="btn btn-default" onclick="goBack()">취소</button>
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
					<h4 class="modal-title">확인메세지</h4>
				</div>
				<div class="modal-body" id="checkMessage"></div>
					<div class="modal-footer" id="checkMessage">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
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