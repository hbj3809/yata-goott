<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>

<!-- Custom styles for this template-->
<link
	href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/project-yata/admin/dashboard">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Ya Ta! ADMIN</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link"
		href="/project-yata/admin/dashboard"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Nav Item - Charts -->
	<li id="regCar" class="nav-item"><a class="nav-link"
		href="/project-yata/admin/reg-car"> <i class="fas fa-fw fa-cog"></i>
			<span class="text-white">차량 등록</span></a></li>

	<!-- Nav Item - Charts -->
	<li id="returnList" class="nav-item"><a class="nav-link"
		href="/project-yata/admin/return-list"> <i
			class="fas fa-fw fa-wrench"></i> <span class="text-white">반납
				관리</span></a></li>

	<!-- Nav Item - Charts -->
	<li id="carList" class="nav-item"><a class="nav-link"
		href="/project-yata/admin/car-list"> <i
			class="fas fa-fw fa-chart-area"></i> <span class="text-white">차량
				리스트</span></a></li>

	<!-- Nav Item - Charts -->
	<li id="memberList" class="nav-item"><a class="nav-link"
		href="/project-yata/admin/member-list"> <i
			class="fas fa-fw fa-chart-area"></i> <span class="text-white">회원
				리스트</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="#"> <i
			class="fas fa-fw fa-table"></i> <span class="text-white">1:1
				문의</span></a></li>
				
	<!-- Nav Item - Charts -->
	<li id="reservationList" class="nav-item"><a class="nav-link"
		href="/project-yata/admin/reservationlist"> <i
			class="fas fa-fw fa-chart-area"></i> <span class="text-white">예약 리스트</span></a></li>
				
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->

<script
	src="/project-yata/resources/yata-member-admin/vendor/jquery/jquery.min.js"></script>
<script
	src="/project-yata/resources/yata-member-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	$(function() {
		var uri = window.location.pathname;
		var active = uri.substring(uri.lastIndexOf("/") + 1);
		switch (active) {
		case "reg-car":
			$('#regCar').addClass("active");
			break;
		case "return-list":
			$('#returnList').addClass("active");
			break;
		case "car-list":
			$('#carList').addClass("active");
			break;
		case "member-list":
			$('#memberList').addClass("active");
			break;
		}
	})
</script>
