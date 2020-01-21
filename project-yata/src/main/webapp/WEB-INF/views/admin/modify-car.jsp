<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>차량수정</title>

<!-- Custom fonts for this template-->
<link
	href="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top" class="bg-gradient-primary">

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


					<div class="container">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
									<div class="col-lg-7">
										<div class="p-5">
											<div class="text-center">
												<h1 class="h4 text-gray-900 mb-4">차량 수정</h1>
											</div>
											<form action="/project-yata/admin/modifyCar" method="post" enctype="multipart/form-data" id="modify-form">
											<input type="hidden" name="car_num" value="${car.car_num }">
											
											
												<div class="form-group">
													<select class="form-control form-control-user"
														name="car_maker" >
														<option>벤틀리</option>
														<option>페라리</option>
														<option>람보르기니</option>
														<option>롤스로이스</option>
														<option selected="selected">${ car.carType.car_maker }</option>
													</select>
												</div>

												<div class="form-group">
													<select class="form-control form-control-user" name="car_class" >
														<option>Bentayga</option>
														<option>Continental GT</option>
														<option>488 Spider</option>
														<option>Laferrari</option>
														<option>Aventador Roadster Svj</option>
														<option>Urus</option>	
														<option>Cullinan</option>
														<option>Ghost Black Badge</option>
														<option selected="selected">${ car.carType.car_class }</option>
													</select>
												</div>

												<div class="form-group">
													<textarea class="form-control form-control-user" name="car_content"
														id="car-content" rows="8" >${ car.car_content }</textarea>
												</div>
												<div class="form-group row">
													<div class="col-sm-6 mb-3 mb-sm-0">
														<input type="text" class="form-control form-control-user" name="car_fuel"
															id="car-fuel" value="${ car.car_fuel }">
													</div>
													<div class="col-sm-6 mb-3 mb-sm-0">
														<input type="text" class="form-control form-control-user" name="car_price"
															id="car-price" value="${ car.car_price }">
													</div>
												</div>
												<span>차량 사진</span>
												<br>
														
																																
												<div class="form-group row">
													<div class="col-sm-6 mb-3 mb-sm-0">
														<input id="photo1" type="file" name="car_picture" data-idx="1" class="form-control" >${car.carPhotos[0].car_picture}
													</div>
													<div class="col-sm-6 mb-3 mb-sm-0">
														<input id="photo2" type="file" name="car_picture" data-idx="2" class="form-control" >${car.carPhotos[1].car_picture}
													</div>
												</div>
												<div class="form-group row">
													<div class="col-sm-6 mb-3 mb-sm-0">
														<input id="photo3" type="file" name="car_picture" data-idx="3" class="form-control" >${car.carPhotos[2].car_picture}
													</div>
													<div class="col-sm-6 mb-3 mb-sm-0">
														<input id="photo4" type="file" name="car_picture" data-idx="4" class="form-control" >${car.carPhotos[3].car_picture}
													</div>
												</div>
												<span>차량 매뉴얼</span>
												<div class="form-group">
													<input id="manual" type="file" name="car_manualx" class="form-control" >
													<c:forEach var="file" items="${car.car_manual}">${car.car_manual }
													</c:forEach>
												</div>
												<hr>
												<input type="submit" value="수정" class="btn btn-primary btn-user btn-block">
												<input id="cancel" type="button" value="취소" class="btn btn-primary btn-user btn-block">
											</form>
											<hr>
										</div>
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
	<script type="text/javascript">
		$(function() {
			$('#cancel').on('click', function() {
				var choice = confirm("차량리스트로 되돌아 가시겠습니까?");
				if (!choice) {
					return;
				}
				location.href = "/project-yata/admin/car-list";
			});
		});

	
	    $('#modify-form').on('submit', function () {

	    	//사진 공백 확인
		    if($("#photo1").val() == ""){
		    	alert("사진을 첨부해해주세요");
		        $("#photo").focus();
		        return false;
		   	}
		   	
		    if($("#photo2").val() == ""){
		    	alert("사진을 첨부해해주세요");
		        $("#photo").focus();
		        return false;
		   	}
		   	
		    if($("#photo3").val() == ""){
		    	alert("사진을 첨부해해주세요");
		        $("#photo").focus();
		        return false;
		   	}
		   	
		    if($("#photo4").val() == ""){
		    	alert("사진을 첨부해해주세요");
		        $("#photo").focus();
		        return false;
		   	}
		   	
		  //메뉴얼 공백 확인
		    if($("#manual").val() == ""){
		    	alert("메뉴얼을 첨부해주세요");
		        $("#manual").focus();
		        return false;
		   	}
	    });
		
	</script>
	
	
	<!-- Bootstrap core JavaScript-->
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

</body>

</html>