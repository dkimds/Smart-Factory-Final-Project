<%@page import="yjmp.project.memb.MembDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="yjmp.project.DB.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- DB���� ������ ��ȸ�Ͽ� request.set �ϴ� �κ� -->
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MembDAO> membList = new ArrayList<MembDAO>();
	
	try {
		conn = DBConnection.getCon();
		// DB INSERT Query
		String sql = "SELECT * FROM USER_INFO_TB ORDER BY USER_SEQ";
	
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while (rs.next()) {
			Date date = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("USER_REG_DATE"));
            String dateStr = new SimpleDateFormat("yyyy/mm/dd").format(date);
			
            Date date1 = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("USER_BIRTH"));
            String dateStr1 = new SimpleDateFormat("yyyy/mm/dd").format(date1);
            
            //����
			String gender = "";
			if(rs.getString("USER_GENDER").equals("1")){
				gender = "��";
			}else{
				gender = "��";
			}
            
            //����
			String auth = "";
			if(rs.getString("USER_AUTHOR").equals("1")){
				auth = "�����";
			}else{
				auth = "������";
			}
			
            //��뿩��
            String avail = "";
			if(rs.getString("USER_AVAIL").equals("1")){
				avail = "���";
			}else{
				avail = "�̻��";
			}
			
			membList.add(
					new MembDAO(rs.getString("USER_SEQ"), 
							rs.getString("USER_ID"), 
                            rs.getString("USER_PWD"),
                            rs.getString("USER_NAME"),
                            gender,
                            dateStr1,
                            rs.getString("USER_PHONE"),
                            rs.getString("USER_EMAIL"),
							rs.getString("USER_DEPARTMENT"),
                            rs.getString("USER_POSITION"),
                            dateStr,
                            auth,
							avail
							));
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	request.setAttribute("membList", membList);
%>

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
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">ȸ�� ��ȸ</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">ȸ�� ��ȸ</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form id = "">
							<table width="100%" 
								class="table table-striped table-bordered table-hover" 
								id="dataTables-example">
								<thead>
									<tr>
										<th>
											<div class="checkbox">
												<label class="form-check-label"><input
													type="checkbox" class="form-check-input" checked
													id="checkall">&nbsp;</label>
											</div>
										</th>
                                        <th>No</th>										
                                        <th>ID</th>
                                        <th>��й�ȣ</th>
										<th>�̸�</th>
										<th>����</th>
                                        <th>�������</th>
                                        <th>�ڵ���</th>
                                        <th>�̸���</th>
                                        <th>�μ���</th>
                                        <th>��å</th>
                                        <th>�����</th>
                                        <th>����</th>
                                        <th>��뿩��</th>
									</tr>
								</thead>

								<tbody>
									<!-- ȸ�� DB -->
									<c:forEach items="${ membList}" var="membList">
										<tr>
											<td>
												<div class="checkbox">
													<label class="form-check-label"><input
														type="checkbox" class="form-check-input" checked name="chk">&nbsp;</label>
												</div>
											</td>	
											<td>${membList.userSeq }</td>
											<td>${membList.userID }</td>
											<td>${membList.userPwd }</td>
											<td>${membList.userName }</td>
											<td>${membList.userGender }</td>
											<td>${membList.userBirth }</td>
                                            <td>${membList.userPhone }</td>
                                            <td>${membList.userEmail }</td>
											<td>${membList.userDepartment }</td>
											<td>${membList.userPosition }</td>
											<td>${membList.userRegDate }</td>
											<td>${membList.userAuthor }</td>
											<td>${membList.userAvail }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							</form>
						</div>
						<span class="pull-right">
							<button type="button" class="btn btn-outline btn-default">���Ѽ���</button>
							<button type="button" class="btn btn-outline btn-success">����</button>
							<button type="button" class="btn btn-outline btn-danger" id = "removeMembBtn">����</button>
						</span>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->

	<!-- /#wrapper -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

	<!-- checkbox function -->
	<script>
		$(document).ready(function() {
			//�ֻ�� üũ�ڽ� Ŭ��
			$("#checkall").click(function() {
				//Ŭ���Ǿ�����
				if ($("#checkall").prop("checked")) {
					//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
					$("input[name=chk]").prop("checked", true);
					//Ŭ���� �ȵ�������
				} else {
					//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
					$("input[name=chk]").prop("checked", false);
				}
			})
		})
		
	</script>
	<!-- db ���� �Լ� -->
	<script>
	$(document).ready(function() {
		 $("#removeMembBtn").click(function() {
		  var formData = $("#removeMembFrom").serialize();
		  $.ajax({
		   type : "POST",
		   url : "/removeMembController",
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