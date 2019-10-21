<%@page import="yjmp.project.DB.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="yjmp.project.temp.TempDataAccessObject"%>
<%@ page import="yjmp.project.notice.NotificationVO"%>
<%@ page import="yjmp.project.notice.NotificationDAO"%>
<%@ page import="yjmp.project.equip.EquipCount" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-ｅquiv="Content-Type" content="text/html; charset=EUC-KR">
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
				<div class="col-lg-12"></div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">HOME</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-bar-chart-o fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">26</div>
									<div>온/습도</div>
								</div>
							</div>
						</div>
						<a href="/common/temp/temperatureStatus.jsp">
							<div class="panel-footer">
								<span class="pull-left">온/습도 현황</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-wrench fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">12</div>
									<div>장비관리</div>
								</div>
							</div>
						</div>
						<a href="/admin/equipment/equipUsage.jsp">
							<div class="panel-footer">
								<span class="pull-left">장비사용현황</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-files-o fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">124</div>
									<div>시스템 문의</div>
								</div>
							</div>
						</div>
						<a href="QandA.html">
							<div class="panel-footer">
								<span class="pull-left">시스템 문의</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>

			</div>

			<!-- /.row -->
			<div class="row">
			<!-- Equip Chart -->
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">장비사용현황</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div id="morrisDonut"></div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
				
				<!-- Notification -->
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i> 공지사항
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped"
									id="dataTables-example">
									<thead>
										<tr>
											<th class="alignC">번호</th>
											<th class="alignC">제목</th>
											<th class="alignC">날짜</th>
											<th class="alignC">작성자</th>

										</tr>
									</thead>
									<tbody>
										<%
											NotificationDAO noticeDAO = new NotificationDAO();
											ArrayList<NotificationVO> noticeLS = noticeDAO.getList();
											for (int i = 0; i < noticeLS.size(); i++) {
										%>
										<tr>
											<td><%=noticeLS.get(i).getNotice_Seq()%></td>
											<td><a
												href="/admin/board/view.jsp?notice_Seq=<%=noticeLS.get(i).getNotice_Seq()%>"><%=noticeLS.get(i).getNotice_Subject()%></a></td>
											<td><%=noticeLS.get(i).getNotice_Date()%></td>
											<td><%=noticeLS.get(i).getUser_Id()%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>

						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->

					<!-- /.col-lg-4 -->
				</div>
				<!-- /.row -->
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	중요 장비 현황
                        </div>
                        <!-- .panel-heading -->
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Collapsible Group Item #1</a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Collapsible Group Item #2</a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Collapsible Group Item #3</a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                        <div class="col-xs-6">
				                            	온도 :
				                        	 </div>
				                        	 <div class="col-xs-6">
				                            	습도 :
				                        	 </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Collapsible Group Item #3</a>
                                        </h4>
                                    </div>
                                    <div id="collapseFour" class="panel-collapse collapse">
                                        <div class="panel-body">
	                                        <div class="col-xs-6">
				                            	온도 :
				                        	 </div>
				                        	 <div class="col-xs-6">
				                            	습도 :
				                        	 </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            <!-- /.row -->
			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
		
		<!-- EquipState DB Connect -->
		<%
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ArrayList<EquipCount> list = new ArrayList<EquipCount>();
		
		try{
		conn = DBConnection.getCon();
		
		String sql1 = "SELECT COUNT(*) FROM EQUIPMENT_BASIC_INFO_TB WHERE EQUIP_AVAIL = 1";
		String sql2 = "SELECT COUNT(*) FROM EQUIPMENT_BASIC_INFO_TB WHERE EQUIP_AVAIL = 0";
		
		pstmt1 = conn.prepareStatement(sql1);
		pstmt2 = conn.prepareStatement(sql2);
		rs1 = pstmt1.executeQuery();
		rs2 = pstmt2.executeQuery();
		
		while(rs1.next() && rs2.next()){
			EquipCount count = new EquipCount();
			count.setAvailableNumber(rs1.getInt(1));
			System.out.println(rs1.getInt(1));
			count.setUnavailableNumber(rs2.getInt(1));
			System.out.println(rs2.getInt(1));
			list.add(count);
		}
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		
		%>
		
		<!-- Morris Donut Chart data -->
		<script>
			new Morris.Donut({
				element : 'morrisDonut',
				data : [ {
					label : "Available Equip",
					value : <%=list.get(0).getAvailableNumber()%>
				}, {
					label : "Unavailable Eqip",
					value : <%=list.get(0).getUnavailableNumber()%>
				}]
			});
		</script>
		<script>
			$(document).ready(function() {
				$('#dataTables-example').DataTable({
					responsive : true
				});
			});
		</script>
</body>
</html>
