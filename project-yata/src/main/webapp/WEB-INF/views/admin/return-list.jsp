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

<title>반납관리</title>

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
					<h1 class="h3 mb-2 text-gray-800">반납 리스트</h1>
					<p class="mb-4">
						회원이 반납처리한 반납내역을 확인할 수 있다.
					</p>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">반납 내역</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive" id="returnTable">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead>
										<tr>
											<th>예약번호</th>
											<th>실제반납시간</th>	
											<th>후기작성여부</th>
											<th>승인여부</th>
										</tr>
									</thead>
									<tbody>
										 <c:forEach items="${ returns }" var="returnx">
											<tr>
												<td>${ returnx.res_num }</td>
												<td>${ returnx.realtime}</td>
												<td>${ returnx.revaccept }</td>	
												<td>
													<c:choose>
														<c:when test="${ not returnx.accept }">
															<a class="dropdown-item" href="#" data-toggle="modal" data-target="#returnRes" data-res="${ returnx.res_num }">
											               		<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>${ returnx.res_num }번 반납승인
											               	</a>
														</c:when>
														<c:otherwise>
															[승인완료]
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
											<!-- first modal -->
											<div class="modal fade" id="returnRes" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 style="text-align: center;" class="modal-title" id="exampleModalLabel">
																예약번호 <span id="resNumber"></span>번의 반납을 승인하시겠습니까?
															</h5>
														</div>
														<div class="modal-footer">
															<button id="returnAccept" class="btn btn-primary">승인</button>
															<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
														</div>
													</div>
												</div>
											</div>
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
	
	<script type="text/javascript">
		$('#returnTable').on('click', '.dropdown-item', function() {
			var res_num = parseInt($(this).attr('data-res'));
			console.log(res_num);
			$('#resNumber').text(res_num);
			//$('#returnRes input[name=res_no]').val(res_num);

			$('#returnAccept').on('click', function() {
				location.href="/project-yata/admin/returnaccept?res_num=" + res_num;
				alert('반납승인이 완료되었습니다.');
			});
			
		});
	</script>

</body>

</html>
