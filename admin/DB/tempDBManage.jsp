<%@page import="yjmp.project.temp.TempDAO"%>
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

<!-- DB에서 데이터 조회하여 request.set 하는 부분 -->
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<TempDAO> tempList = new ArrayList<TempDAO>();
	
	try {
		conn = DBConnection.getCon();
		// DB INSERT Query
		String sql = "select " 
				+	"td.TH_DETAIL_SEQ,"
				+	"td.TH_SET_TEMP,"
				+	"td.TH_SET_HUMIDITY,"
				+	"td.TH_AVAIL,"
				+	"td.TH_REG_DATE,"
				+	"ui.user_name,"
				+	"ebi.EQUIP_NAME "
				+	"from th_detail_tb td, equipment_basic_info_tb ebi, user_info_tb ui "
				+	"where td.equip_basic_seq = ebi.equip_basic_seq "
				+ 	"and td.th_person = ui.user_seq ORDER BY TH_DETAIL_SEQ";
	
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while (rs.next()) {
			Date date = new SimpleDateFormat("yyyy-mm-dd").parse(rs.getString("TH_REG_DATE"));
			String dateStr = new SimpleDateFormat("yyyy/mm/dd").format(date);
			//사용여부 확인
			String avail = "";
			if(rs.getString("TH_AVAIL").equals("1")){
				avail = "사용";
			}else{
				avail = "미사용";
			}
			tempList.add(
					new TempDAO(rs.getString("TH_DETAIL_SEQ"), 
							rs.getString("TH_SET_TEMP"), 
							rs.getString("TH_SET_HUMIDITY"),
							avail,
							dateStr, 
							rs.getString("user_name"),
							rs.getString("EQUIP_NAME")));
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

	<!--start of .Wrapper -->
	<div id="wrapper">

		<!-- 상단 및 왼쪽 menu -->
		<jsp:include page="/WEB-INF/inc/common/menu.jsp" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">온/습도 DB관리</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">온/습도 DB 관리</div>
						<!-- /.panel-heading -->
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
												<label class="form-check-label"><input
													type="checkbox" class="form-check-input" checked
													id="checkall">&nbsp;</label>
											</div>
										</th>
										<th>No</th>
										<th>장비명</th>
										<th>설정온도</th>
										<th>설정습도</th>
										<th>사용여부</th>
										<th>등록일</th>
										<th>설정자</th>
										
									</tr>
								</thead>
								<tbody>
									<!-- 온습도 DB -->
									<c:forEach items="${ tempList}" var="tempList">
										<tr>
											<td>
												<div class="checkbox">
													<label class="form-check-label"><input
														type="checkbox" class="form-check-input" checked name="chk">&nbsp;</label>
												</div>
											</td>	
											<td>${tempList.thDetailSeq }</td>
											<td>${tempList.eauipBasicSeq }</td>
											<td>${tempList.thSetTemp }</td>
											<td>${tempList.thSetHumidity }</td>
											<td>${tempList.thAvail }</td>
											<td>${tempList.thRegDate }</td>
											<td>${tempList.thPerson }</td>
											
										</tr>
									</c:forEach>		
								</tbody>
							</table>
						</div>
						<span class="pull-right">
							<button type="button" class="btn btn-outline btn-success">수정</button>
							<button type="button" class="btn btn-outline btn-danger">삭제</button>
						</span>
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
	
	<!-- checkbox function -->
	<script>
		$(document).ready(function() {
			//최상단 체크박스 클릭
			$("#checkall").click(function() {
				//클릭되었으면
				if ($("#checkall").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input[name=chk]").prop("checked", true);
					//클릭이 안되있으면
				} else {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input[name=chk]").prop("checked", false);
				}
			})
		})
	</script>
</body>
</html>