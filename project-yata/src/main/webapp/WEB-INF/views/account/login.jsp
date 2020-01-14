<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kr">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>야타(YaTa) 로그인</title>

  <!-- Custom fonts for this template-->
  <link href="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">YA TA!</h1>
                  </div>
                  <!-- 1.13 수정 시작 -->
                  <form class="user" action="/project-yata/account/login" method="post">
                    <div class="form-group">
                      <input type="email" name="user_email" class="form-control form-control-user" id="logEmail" aria-describedby="emailHelp" placeholder="가입된 이메일 입력">
                    </div>
                    <div class="form-group">
                      <input type="password" name="user_passwd" class="form-control form-control-user" id="logpPsswd" placeholder="비번입력">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">아이디 저장</label>
                      </div>
                    </div>
                    <input type="submit" value="로그인" class="btn btn-primary btn-user btn-block"/>
                    <!-- 1.13 수정  -->
                    <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> 구글로 로그인
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> 페북으로 로그인
                    </a>
                  </form>	
                  <hr>
                  <div class="text-center">
                    <a class="small" href="/project-yata/account/forgot-password">비번 까먹음?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="/project-yata/account/regAccpt">회원가입할래?</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
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

</body>

</html>
