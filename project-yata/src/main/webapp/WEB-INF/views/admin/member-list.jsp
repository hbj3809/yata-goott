<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link href="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/project-yata/resources/yata-member-admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/admin/modules/sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="/WEB-INF/views/admin/modules/topbar.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">회원리스트</h1>
					<p class="mb-4">
						■	관리자는 전체 회원 리스트를 조회할 수 있다.
						■	회원 리스트는 회원 가입시 저장된 내용만을 가지고 있다.
						■	회원을 검색할 수 있다.
						</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">현재 진행중인 회원 상황</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>이메일</th>
											<th>이름</th>
											<th>전화번호</th>
											<th>생년월일</th>
											<th>우편번호</th>
											<th>도로명주소</th>											
											<th>상세주소</th>
											<th>참고주소</th>
											<th>가입일자</th>
											<th>유저타입</th>
											<th>누적포인트</th>
											<th>면허번호</th>
										</tr>
									</thead>
									
									<tbody>
									<c:forEach items="${ members }" var="member">
										<tr>
											<td>
											<a href="detail.action?bno=${ member.user_num }">
					                      		${ member.user_email }
					                      	</a>
											</td>
											<td>${ member.user_Name }</td>
											<td>${ member.user_phone }</td>
											<td>${ member.user_birth }</td>
											<td>${ member.user_postcode }</td>
											<td>${ member.user_addr }</td>
											<td>${ member.user_detailAddr }</td>
											<td>${ member.user_refAddr }</td>
											<td>${ member.user_regDate }</td>
											<td>${ member.user_type }</td>
											<td>${ member.user_totalPoint }</td>
											<td>${ member.user_driveNum }</td>
										</tr>
									</c:forEach>
									</tbody>
									
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

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
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/project-yata/resources/yata-member-admin/vendor/jquery/jquery.min.js"></script>
	<script src="/project-yata/resources/yata-member-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/project-yata/resources/yata-member-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/project-yata/resources/yata-member-admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/project-yata/resources/yata-member-admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/project-yata/resources/yata-member-admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/project-yata/resources/yata-member-admin/js/demo/datatables-demo.js"></script>

</body>

</html>
