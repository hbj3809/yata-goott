<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>

<!-- Custom styles for this template-->
<link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/project-yata/board/review-list">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Ya Ta! 게시판</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Charts -->
	<li id="review-board" class="nav-item">
		<a class="nav-link" href="/project-yata/board/review-list"> 
			<i class="fas fa-fw fa-table"></i>
			<span class="text-white">후기 게시판</span>
		</a>
	</li>
	
	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	
	<!-- Nav Item - Charts -->
	<li id="free-board" class="nav-item">
		<a class="nav-link" href="/project-yata/board/free-list"> 
			<i class="fas fa-fw fa-table"></i> 
			<span class="text-white">공지사항</span>
		</a>
	</li>

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
		case "review-board":
			$('#review-board').addClass("active");
			break;
		case "free-board":
			$('#free-board').addClass("active");
			break;
		}
	})
</script>
