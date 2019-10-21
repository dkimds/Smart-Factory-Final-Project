<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="yjmp.project.equip.EquipDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="yjmp.project.DB.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- DB에서 데이터 조회하여 request.set 하는 부분 -->
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<EquipDAO> equipList = new ArrayList<EquipDAO>();
	
	try {
		conn = DBConnection.getCon();
		// DB INSERT Query
		String sql = "select "
				+    "ed.EQUIP_DETAIL_SEQ,"
				+    "eb.EQUIP_NAME,"
				+    "ed.EQUIP_LOCATION,"
				+    "ed.EQUIP_INSTALL_DATE,"
				+    "ed.EQUIP_REPAIR_DATE,"
				+    "ed.EQUIP_RETURN_DATE,"
				+    "ed.EQUIP_STATE,"
				+    "ed.EQUIP_NOTE "
				+    "from equipment_basic_info_tb eb, equipment_detail_info_tb ed "
				+	 "WHERE eb.EQUIP_BASIC_SEQ = ed.EQUIP_BASIC_SEQ ORDER BY EQUIP_DETAIL_SEQ";
	
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while (rs.next()) {
			Date installDate = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("EQUIP_INSTALL_DATE"));
			String installDateStr = new SimpleDateFormat("yyyy/mm/dd").format(installDate);
			
			Date repairDate = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("EQUIP_REPAIR_DATE"));
			String repairDateStr = new SimpleDateFormat("yyyy/mm/dd").format(repairDate);
			
			Date returnDate = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("EQUIP_RETURN_DATE"));
			String returnDateStr = new SimpleDateFormat("yyyy/mm/dd").format(returnDate);
			
			//사용여부 확인
			String avail = "";
			if(rs.getString("EQUIP_STATE").equals("1")){
				avail = "사용";
			}else{
				avail = "미사용";
			}
			
			//ArrayList 데이터 삽입	
			equipList.add(
				new EquipDAO(
						rs.getString("EQUIP_DETAIL_SEQ"), 
						rs.getString("EQUIP_NAME"), 
						rs.getString("EQUIP_LOCATION"),
						installDateStr, 
						repairDateStr, 
						returnDateStr,
						avail, 
						rs.getString("EQUIP_NOTE")));
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

	<!-- start of .wrapper -->
	<div id="wrapper">
		<!-- side menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />
		
		<!-- start of .page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">장비 데이터 관리</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		
			<!-- start of #row-->
			<div class="row">
				<!-- start of #col-lg-12-->
				<div class="col-lg-12">
					<!-- start of #panel panel-default-->
					<div class="panel panel-default">
						<!-- start of #panel-heading-->
						<div class="panel-heading">장비 데이터 관리</div>
						<!-- start of #panel-body-->
						<div class="panel-body">
							<div class="srchWrap">
								<div class="termSelBox">
									<input type="text" placeholder="2018-11-15"
										class="datepicker-here selector"
										style="width: 34%; margin: 10px; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;"
										data-language="kr" /> <span class="unit">~</span> <input
										type="text" placeholder="2018-12-15"
										class="datepicker-here selector"
										style="width: 34%; margin: 20px; margin-right: 5%; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;"
										data-language="kr" />
									<button type="button" class="btn btn-info" style="width: 20%;">조회</button>
								</div>
							</div>
							<table width="100%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>
											<div class="checkbox">
												<label class="form-check-label"><input type="checkbox" class="form-check-input" checked
													id="allCheck">&nbsp;</label>
											</div>
										</th>
										<th>No</th>
										<th>장비명</th>
										<th>위치</th>
										<th>설치일</th>
										<th>수리일</th>
										<th>회수일</th>
										<th>상태</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<!-- 장비 DB -->
									<c:forEach items="${ equipList}" var="equipList">
										<tr>
											<td>
												<div class="checkbox">
													<label class="form-check-label"><input
														type="checkbox" class="form-check-input" checked name="chk">&nbsp;</label>
												</div>
											</td>	
											<td>${equipList.equipDetailSeq }</td>
											<td>${equipList.equipBasicSeq }</td>
											<td>${equipList.equipLocation }</td>
											<td>${equipList.equipInstallDate }</td>
											<td>${equipList.equipRepairDate }</td>
											<td>${equipList.equipReturnDate }</td>
											<td>${equipList.equipState }</td>
											<td>${equipList.equipNote }</td>
										</tr>
									</c:forEach>				
								</tbody>
							</table>
						</div>
						<span class="pull-right">
							<button type="button" class="btn btn-outline btn-success">수정</button>
							<button type="button" class="btn btn-outline btn-danger">삭제</button>
						</span>
						<!-- end of #panel-body -->
					</div>
					<!-- end of #panel -->
				</div>
				<!-- end of #col-lg-12 -->
			</div>
			<!-- end of #row-->
		</div>
		<!-- end of .page-wrapper -->
	</div>
	<!-- end of .wrapper -->


	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

	<!-- checkbox function -->
	<script type="text/javascript">
		$(document).ready(function(){
		//전체선택 체크박스 클릭
		$("#allCheck").click(function(){
				//전체 체크박스 선택
			$('.form-check-input').prop("checked",this.checked);
		});
		});
	</script>
</body>
</html>