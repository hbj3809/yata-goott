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

  <title>topbar</title>

  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet" type="text/css" />
  <script src="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/js/all.min.js"></script>
		
</head>

<body>
<nav class="navbar navbar-expand navbar-light bg-black topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            
		<a href="#" class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-trash"></i>
                    </span>
                    <span id="delete" class="text">탈퇴하기</span>
                  </a>
            <!-- Nav Item - Messages -->
            <li class="nav-item">
              <a class="nav-link" href="/project-yata" >
               홈페이지로 돌아가기
              </a>
              <!-- Dropdown - Messages -->
             
            </li>
            

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                
                
                
                
                					<c:choose>
	            				<c:when test="${ empty sessionScope.loginuser }">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small" onclick="/project-yata/account/login">로그인</span>	
					</c:when>
			            		<c:otherwise>
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginuser.user_Name}님</span>
				            	</c:otherwise>
		           		 	</c:choose>
                
                
                
                
                
                <img class="img-profile rounded-circle">
              </a>
              
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="/project-yata/mypage">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>내 정보 보기
                </a>
                <a class="dropdown-item" href="/project-yata/update">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>회원 정보 수정
                </a>
                <a class="dropdown-item" href="/project-yata/reservationlist">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>내 예약 리스트
                </a>
                <a class="dropdown-item" href="/project-yata/qna">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>1:1 상담
                </a>
                <a class="dropdown-item" href="/project-yata/reviewlist">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>후기 리스트
                </a>
                <a class="dropdown-item" href="/project-yata/point">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>내 포인트
                </a>
                <div class="dropdown-divider"></div>
                
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃
                </a>

                
                
               
                
              </div>
            </li> 
            
            
            
           
           

          </ul>

        </nav>
        
        

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
  <script src="/project-yata/resources/yata-member-admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/project-yata/resources/yata-member-admin/js/demo/chart-area-demo.js"></script>
  <script src="/project-yata/resources/yata-member-admin/js/demo/chart-pie-demo.js"></script>
  <script src="/project-yata/resources/yata-member-admin/js/demo/chart-bar-demo.js"></script>
  
  <script type="text/javascript">
	$(function() {
		

		$('#delete').on('click', function(event) {

			var yes = confirm("탈퇴할까요?");
			if (!yes) {
				return;
			}			
			var form =
				makeForm('delete.action');
			form.submit();
		});
		
		</script>
		
		
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		var profile = `/project-yata/resources/file/user-profile-photo/${ loginuser.user_photo }`;
		console.log(profile);
		$('.img-profile').attr('src', profile);
	});
</script>
</body>

</html>