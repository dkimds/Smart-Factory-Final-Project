<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*"%>
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
					<h1 class="page-header">장비사용현황</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">Pie Chart Example</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							 <div id="morrisDonut" ></div> 
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
				<div class="col-lg-6">
					<div class="table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>날짜</th>
									<th>시간</th>
									<th>온/습도</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>3326</td>
									<td>10/21/2013</td>
									<td>3:29 PM</td>
									<td>$321.33</td>
								</tr>
								<tr>
									<td>3325</td>
									<td>10/21/2013</td>
									<td>3:20 PM</td>
									<td>$234.34</td>
								</tr>
								<tr>
									<td>3324</td>
									<td>10/21/2013</td>
									<td>3:03 PM</td>
									<td>$724.17</td>
								</tr>
								<tr>
									<td>3323</td>
									<td>10/21/2013</td>
									<td>3:00 PM</td>
									<td>$23.71</td>
								</tr>
								<tr>
									<td>3322</td>
									<td>10/21/2013</td>
									<td>2:49 PM</td>
									<td>$8345.23</td>
								</tr>
								<tr>
									<td>3321</td>
									<td>10/21/2013</td>
									<td>2:23 PM</td>
									<td>$245.12</td>
								</tr>
								<tr>
									<td>3320</td>
									<td>10/21/2013</td>
									<td>2:15 PM</td>
									<td>$5663.54</td>
								</tr>
								<tr>
									<td>3319</td>
									<td>10/21/2013</td>
									<td>2:13 PM</td>
									<td>$943.45</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>




				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Flot Charts Usage</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<p>
								Flot is a pure JavaScript plotting library for jQuery, with a
								focus on simple usage, attractive looks, and interactive
								features. In SB Admin, we are using the most recent version of
								Flot along with a few plugins to enhance the user experience.
								The Flot plugins being used are the tooltip plugin for hoverable
								tooltips, and the resize plugin for fully responsive charts. The
								documentation for Flot Charts is available on their website, <a
									target="_blank" href="http://www.flotcharts.org/">http://www.flotcharts.org/</a>.
							</p>
							<a target="_blank" class="btn btn-default btn-lg btn-block"
								href="http://www.flotcharts.org/">View Flot Charts
								Documentation</a>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

<!-- Morris Donut Chart data -->
	<script>
		new Morris.Donut({
			element : 'morrisDonut',
			data : [ {
				label : "Download Sales",
				value : 12
			}, {
				label : "In-Store Sales",
				value : 30
			}, {
				label : "Mail-Order Sales",
				value : 20
			} ]
		});
	</script>
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