<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("EUC-KR");
String userId = session.getAttribute("id").toString();
request.setAttribute("userId", userId);
%>
<script>
window.history.forward();
function noBack(){
	window.history.forward();
}
</script>

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/common/home/home.jsp">통합 온/습도 관리 시스템 - 관리자 페이지</a>
	</div>
	<!-- /.navbar-header -->
	
	<ul class="nav navbar-top-links navbar-right">
		<c:choose>
			<c:when test="${userId ne null }">
				<li>안녕하세요 <%=userId %>님</li>
			</c:when>
		</c:choose>
		
		<!-- /.dropdown -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-users fa-fw"></i> User Profile</a></li>
				<li><a href="#"><i class="fa fa-info fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a href="/common/login/logoutsession.jsp" onclick="noBack();"><i class="fa fa-user-secret fa-fw"></i> Logout</a></li>
			</ul> <!-- /.dropdown-user -->
		</li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>
				<li>
					<a href="/common/home/home.jsp">
						<i class="fa fa-home fa-fw"></i> 홈
					</a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-paragraph fa-fw"></i>온/습도 
						<i class="fa fa-caret-down pull-right"></i>
					</a>
					<ul class="nav nav-second-level">
						<li><a href="/common/temp/temperatureStatus.jsp">온/습도 현황</a></li>
						<li><a href=/common/temp/temperatureList.jsp>온/습도 조회</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-wrench fa-fw"></i> 장비관리
						<i class="fa fa-caret-down pull-right"></i>
					</a>
					<ul class="nav nav-second-level">
						<li><a href="/admin/equipment/equipUsage.jsp">장비사용현황</a></li>
						<li><a href="/admin/equipment/equipItems.jsp">장비보유현황</a></li>
						<li><a href="/admin/equipment/equipEnroll.jsp">장비추가</a></li>
						<li><a href="/admin/equipment/equipInstall.jsp">장비설치</a></li>
						<li><a href="/admin/equipment/equipReturn.jsp">장비회수</a></li>
						<li><a href="/admin/equipment/equipRepair.jsp">장비수리</a></li>
					</ul>
					<li>
						<a href="/user/qna/QnA.jsp">
							<i class="fa fa-question fa-fw"></i>시스템문의
						</a> <!-- /.nav-second-level -->
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="fa fa-magic fa-fw"></i> DB관리
							<i class="fa fa-caret-down pull-right"></i>
						</a>
						<ul class="nav nav-second-level">
							<li>
								<a href="/admin/DB/tempDBManage.jsp">온/습도 데이터 관리</a>
							</li>
							<li>
								<a href="/admin/DB/equipDBManage.jsp">장비 데이터 관리</a>
							</li>
						</ul> <!-- /.nav-second-level -->
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="fa fa-user fa-fw"></i> 회원관리
							<i class="fa fa-caret-down pull-right"></i>
						</a>
						<ul class="nav nav-second-level">
							<li><a href="/admin/memberManage/memberCheck.jsp">회원 조회</a></li>
							<li><a href="/admin/memberManage/memberLog.jsp">사용자 로그 확인</a></li>
						</ul> 
					<!-- /.nav-second-level -->
					</li>
				<li>
					<a href="/admin/board/notification.jsp"><i class="fa fa-bell fa-fw"></i>공지사항</a> 
				<!-- /.nav-second-level -->
				</li>
			</ul>
		</div>
	</div>
</nav>