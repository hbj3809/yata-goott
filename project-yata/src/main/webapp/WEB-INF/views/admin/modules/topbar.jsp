<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>

<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-gradient-primary topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<!-- Nav Item - MainPage -->
		<li class="nav-item"><a class="nav-link text-white"
			href="/project-yata/" aria-expanded="false">메인페이지</a></li>

		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-white">${ sessionScope.loginuser.user_type }</span>
				<img class="img-profile rounded-circle" src="https://cdnweb01.wikitree.co.kr/webdata/editor/201906/18/img_20190618112945_4980eb90.jpg.webp">
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div></li>

	</ul>

</nav>



<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">Ã</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="/project-yata/account/logout">Logout</a>
			</div>
		</div>
	</div>
</div>


<script
	src="/project-yata/resources/yata-member-admin/vendor/jquery/jquery.min.js"></script>
<script
	src="/project-yata/resources/yata-member-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="/project-yata/resources/yata-member-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script
	src="/project-yata/resources/yata-member-admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script
	src="/project-yata/resources/yata-member-admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script
	src="/project-yata/resources/yata-member-admin/js/demo/chart-area-demo.js"></script>
<script
	src="/project-yata/resources/yata-member-admin/js/demo/chart-pie-demo.js"></script>
<script
	src="/project-yata/resources/yata-member-admin/js/demo/chart-bar-demo.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		var profile = `/project-yata/resources/file/user-profile-photo/${ loginuser.user_photo }`;
		if (${ loginuser } != null ) {
			$('.img-profile').attr('src', profile);
		}
	});
</script>

<!-- End of Topbar -->