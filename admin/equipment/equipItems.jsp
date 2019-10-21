<%@page import="yjmp.project.equip.EquipTempDAO"%>
<%@page import="yjmp.project.temp.TempDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yjmp.project.equip.EquipDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="yjmp.project.DB.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- DB���� ������ ��ȸ�Ͽ� request.set �ϴ� �κ� -->
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<EquipTempDAO> equipList = new ArrayList<EquipTempDAO>();
	try {
		conn = DBConnection.getCon();
		// DB INSERT Query
		String sql = 	"SELECT " 
						+ "td.TH_SET_TEMP, " 
						+ "td.TH_SET_HUMIDITY, " 
						+ "eb.EQUIP_BASIC_SEQ, " 
						+ "eb.EQUIP_NAME, " 
						+ "eb.EQUIP_ID, " 
						+ "eb.EQUIP_COUNT, " 
						+ "eb.EQUIP_FACTORY, " 
						+ "eb.EQUIP_DATE, " 
						+ "eb.EQUIP_AVAIL, " 
						+ "eb.EQUIP_IP " 
						+ "FROM EQUIPMENT_BASIC_INFO_TB eb, TH_DETAIL_TB td "
						+ "WHERE eb.EQUIP_BASIC_SEQ = td.EQUIP_BASIC_SEQ";
	
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while (rs.next()) {
			//��¥ ��ȯ
			Date date = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("EQUIP_DATE"));
			String dateStr = new SimpleDateFormat("yyyy/mm/dd").format(date);
			
			//��뿩�� Ȯ��
			String avail = "";
			if(rs.getString("EQUIP_AVAIL").equals("1")){
				avail = "���";
			}else{
				avail = "�̻��";
			}

			//equipList ������ ����	
			equipList.add(
				new EquipTempDAO(rs.getString("EQUIP_ID"), rs.getString("EQUIP_NAME"), rs.getString("EQUIP_COUNT"),
						avail, rs.getString("EQUIP_FACTORY"), dateStr,rs.getString("EQUIP_IP"), rs.getString("TH_SET_TEMP"), rs.getString("TH_SET_HUMIDITY")));
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
	request.setAttribute("equipList", equipList);
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

	<!--start of .Wrapper -->
	<div id="wrapper">

		<!-- ��� �� ���� menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">��� ���� ��Ȳ</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<!-- start of .col-lg-12 -->
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">��� ȭ��</div>
						<div class="panel-body">
						<c:forEach items="${ equipList}" var="equipList">
							<!-- /.col-lg-4 -->
			                <div class="col-lg-4">
			                    <div class="panel panel-primary">
			                        <div class="panel-heading">
			                            	����: ${equipList.equipName }
			                        </div>
			                        <div class="panel-body">
			                         <div class="col-xs-6">
			                            	�µ� : ${equipList.thTemp }
			                         </div>
			                         <div class="col-xs-6">
			                            	���� : ${equipList.thHumidity }
			                         </div>
			                        </div>
			                    </div>
			                </div>
			               </c:forEach>
						</div>
					</div>
					<!-- end of .panel panel-default -->
				</div>
				<!-- end of .col-lg-12 -->
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">��� ���� ��Ȳ</div>

						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>����</th>
										<th>����ڵ�</th>
										<th>����</th>
										<th>������</th>
										<th>�����</th>
										<th>����</th>
									</tr>
								</thead>
								<tbody>
									<!-- ��� ����Ʈ -->
									<c:forEach items="${ equipList}" var="equipList">
										<tr>
											<td>${equipList.equipName }</td>
											<td>${equipList.equipID }</td>
											<td>${equipList.equipCount }</td>
											<td>${equipList.equipFactory }</td>
											<td>${equipList.equipDate }</td>
											<td>${equipList.equipAvail }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<span class="pull-right">
							<button type="button" id="modifyBtn" class="btn btn-outline btn-success">����</button>
						</span>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
<!-- 	<script type="text/javascript"> -->
<!-- // 		$(document).ready(function(){ -->
<!-- // 			//��ü���� üũ�ڽ� Ŭ�� -->
<!-- // 			$("#allCheck").click(function(){ -->
<!-- // 				//��ü üũ�ڽ� ���� -->
<!-- // 				$('.form-check-input').prop("checked",this.checked); -->
<!-- // 			}); -->
<!-- // 		}); -->
<!-- 	</script> -->
</body>
</html>