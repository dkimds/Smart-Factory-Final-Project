<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- meta data or title -->
<jsp:include page="/WEB-INF/inc/common/title.jsp" />

</head>
<body>
	<!-- Session 유지 -->
	<%
		String user_Id = null;
		if (session.getAttribute("id") != null) {
			user_Id = session.getAttribute("id").toString();
		}
	%>

	<!-- css, js include -->
	<jsp:include page="/WEB-INF/inc/common/header.jsp" />

	<div id="wrapper">
		<!-- 상단 및 왼쪽 menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<!-- Write Form -->
		<div id="page-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-12" style="text-align: center">
						<h1 class="page-header">공지사항</h1>
					</div>
				</div>
				<!-- /. row -->

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">공지사항</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<form role="form" id="writeForm">
											<div class="form-group">
												<label>글 제목</label> <input class="form-control" type="text" id="notice_subject" placeholder="제목을 입력해 주세요">
												<div class="form-group"></div>
												<div class="form-group">
													<label>말머리</label> 
													<select class="form-control" id="first_Step">
														<option value="공지사항" selected="selected">[공지사항]</option>
														<option value="긴급업무">[긴급업무]</option>
													</select>
												</div>
												<div class="form-group">
													<label>역할</label> 
													<select class="form-control" id="notice_Class">
														<option value="경영지원실" selected="selected">경영지원실</option>
														<option value="개발실">개발실</option>
														<option value="구매팀">구매팀</option>
														<option value="영업팀">영업팀</option>
														<option value="홍보팀">홍보팀</option>
													</select>
												</div>
												<div class="form-group">
													<label>글 내용</label>
													<textarea class="form-control" placeholder="글 내용" id="notice_Content" maxlength="500" style="height: 350px;"></textarea>
												</div>
											</div>
											<input type="button" id="writeBtn" class="btn btn-default pull-right" value="글쓰기">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$("#writeBtn").click(function() {
//		 		UserId 확인
				if('<%= user_Id%>'==null){
					console.log(<%= user_Id%>);
					alert('로그인을 하세요.');
					location.href = '/common/login/login.jsp';
				}else{
					var noticeClass = $("#notice_Class option:selected").val();
					var firstStep = $("#first_Step option:selected").val();
					var subject = $("#notice_subject").val();
					var content = $("#notice_Content").val();
					
					//제목과 내용 널값 확인
					if(subject.length == 0 && content.length == 0){
						alert('입력이 안된 사항이 있습니다.');
					}else{
						var mainSubject = firstStep + " " + subject;
						
						$.ajax({
							type : "POST",
							url : "/admin/board/writeAction.jsp",
							cache : false,
							data : {
								noticeClass: noticeClass,
								mainSubject : mainSubject,
								content : content
							},
							success : function test(result){
								console.log(result);
								chkedResult(result);
							},
							error : function error(){
								console.log('Fail');
							}
						});
					}
				}
			});
		});
		
// 		SQL INSERT 여부 확인
		function chkedResult(result){
			if(result == -1){
				alert('글쓰기에 실패했습니다.');
				history.back();				
			}else{
				location.href = '/admin/board/notification.jsp'; 
			}
		}
	</script>
</body>
</html>