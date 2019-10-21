<%@page import="yjmp.project.temp.TempBasicDAO"%>
<%@page import="yjmp.project.temp.TempDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yjmp.project.DB.DBConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- DB���� ������ ��ȸ�Ͽ� request.set �ϴ� �κ� -->
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<TempBasicDAO> tempList = new ArrayList<TempBasicDAO>();
	
	try {
		conn = DBConnection.getCon();
		// DB INSERT Query
		String sql = "SELECT * FROM TH_BASIC_TB";
	
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while (rs.next()) {
			//��¥ ��ȯ
			Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("TH_MEASURE_DATE"));
			String dateStr = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(date);
			
			//�µ� ����
			String tempState = rs.getString("TH_TEMPERATURE_STATE");
			if(tempState.equals("0")){
				tempState = "����";
			}else if(tempState.equals("1")){
				tempState = "���";
			}else if(tempState.equals("2")){
				tempState = "����";
			}
			
			//���� ����
			String humdityState = rs.getString("TH_HUMIDITY_STATE");
			if(humdityState.equals("0")){
				humdityState = "����";
			}else if(humdityState.equals("1")){
				humdityState = "���";
			}else if(humdityState.equals("2")){
				humdityState = "����";
			}
			
			tempList.add(
					new TempBasicDAO(rs.getInt("TH_BASIC_SEQ"), 
							rs.getString("TH_TEMP"), 
							rs.getString("TH_HUMIDITY"),
							dateStr, 
							tempState,
							humdityState,
							rs.getString("EQUIP_BASIC_SEQ")));
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
	request.setAttribute("tempList", tempList);
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

<script>
</script>
	<!-- start of .wrapper -->
	<div id="wrapper">
		<!-- side menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">��/���� ��ȸ</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">��/���� �׷���</div>
						
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="srchWrap">
								<div class="termSelBox">
										<input id="startDate" type="text" placeholder="2018-11-15" class="datepicker-here selector" style="width: 34%; margin: 10px; height: 34px; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" /> 
											<span class="unit">~</span> 
										<input id="endDate" type="text" placeholder="2018-12-15" class="datepicker-here selector" style="width: 34%; margin: 20px; margin-right: 5%; height: 34px; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;" data-language="kr" />
									<button type="button" class="btn btn-info" style="width: 20%;">��ȸ</button>
								</div>
							</div>
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>��ȣ</th>
										<th>�µ�</th>
										<th>����</th>
										<th>������</th>
										<th>�µ�����</th>
										<th>��������</th>
									</tr>
								</thead>
								<tbody>
									<!-- ��� ����Ʈ -->
									<c:forEach items="${ tempList}" var="tempList">
										<tr>
											<td>${tempList.thBasicSeq }</td>
											<td>${tempList.thTemp }</td>
											<td>${tempList.thHumidity }</td>
											<td>${tempList.thMeasureDate }</td>
											<td>${tempList.thTemperatureState }</td>
											<td>${tempList.thHumidityState }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
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
</body>
</html>