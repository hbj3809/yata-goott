<%@ page pageEncoding="utf-8" 
		 contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' 
		  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>야타(YATA!) 게시판</title>
	
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

    <jsp:include page="/WEB-INF/views/board/modules/sidebar.jsp" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <jsp:include page="/WEB-INF/views/board/modules/topbar.jsp" />
        
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">후기 게시판</h1>
          <br>
          
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <span class="m-0 font-weight-bold text-primary">글 목록</span>

            </div>
            <div class="card-body">
              <div class="table-responsive-x">	
                
                                
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>글번호</th>
                      <th>차량제조사</th>
                      <th>차량이름</th>
                      <th>제목</th>
                      <th>평점</th>
                      <th>작성자</th>
                      <th>작성일자</th>
                     
                    </tr>
                  </thead>                  
                  <tbody>
                  	
                  	
                  	
                  	<c:forEach items="${ review }" var="review">
	                  <tr>
	                	<td>${ review.rev_num }</td>
	                    <td>${ review.car.carType.car_maker }</td>
	                    <td>${ review.car.carType.car_class }</td>
	                    <td>
	                      	<br>
	                      	<a href="/project-yata/board/review-detail?revNum=${ review.rev_num }" data-bno="${ review.rev_title }">
	                      		${ review.rev_title }
	                      	</a>
	                    </td>
	                    <td>${ review.rev_grade } / 5</td>
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
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

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

















