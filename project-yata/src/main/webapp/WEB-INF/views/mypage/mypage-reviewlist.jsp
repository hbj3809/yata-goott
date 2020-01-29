<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이 페이지</title>

  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <script src="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/js/all.min.js"></script>
		
</head>
<body id="page-top" cz-shortcut-listen="true">

  <!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
				<jsp:include page="/WEB-INF/views/admin/modules/topbar.jsp" />
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">후기 리스트</h1>
          <p class="mb-4">■ 회원이 등록한 후기를 확인하고 수정, 삭제 할 수 있다.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">현재 진행중인 후기 상황</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4"><div class="row"><div class="col-sm-12">
                <table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
					<input type="hidden" id="user_num" name="user_num" value="${ reserve.user_num }">
												<thead>
													<tr>
														<th>글번호</th>
														<th>차량제조사</th>
														<th>차량이름</th>
														<th>후기제목</th>
														<th>평점</th>
														<th>작성자</th>
														<th>작성일자</th>
													</tr>
												</thead>
												<tbody>	
												<c:forEach var="review" items="${ reviews }">
														<tr><td>${ review.rev_num }</td>
															<td>${ review.car.carType.car_maker }</td>
															<td>${ review.car.carType.car_class }</td>
															<td>
																<a href="/project-yata/board/review-detail?revNum=${ review.rev_num }">
																	${ review.rev_title }
																</a>
															</td>
															<td>${ review.rev_grade }</td>
															<td>${ review.rev_writer }</td>
															<td>${ review.rev_regDate }</td>
														</tr>
												</c:forEach>
												</tbody>
											</table>
                </div>
                </div>
                
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
            <span>Copyright © Your Website 2019</span>
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