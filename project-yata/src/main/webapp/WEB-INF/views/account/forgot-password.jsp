<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"  %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>야타(YaTa) 비밀번호 찾기</title>

  <!-- Custom fonts for this template-->
  <link href="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                    <p class="mb-4" id="email-input-message">가입시 등록한 이메일을 입력하세요!</p>
                    <p class="mb-4" id="phone-input-message">가입시 등록한 전화번호를 입력하세요!</p>
                  </div>
                  <form id="change-password-form" class="user" method="post">
                    <div class="form-group">
                      <input id="user_email" type="email" name="user_email" class="form-control form-control-user" aria-describedby="emailHelp" placeholder="가입된 이메일 입력">
                      <input id="user_phone" type="text" name="user_phone" class="form-control form-control-user" placeholder="가입된 전화번호 입력">
                      <input id="user_passwd" type="password" name="user_passwd"class="form-control form-control-user" placeholder="특수문자 / 문자 / 숫자 포함 8~15자리">
                      <input id="user_passwd_check" type="password" name="user_passwd_check" class="form-control form-control-user" placeholder="비밀번호 확인">
                      </div>
					<button id="do-action" class="btn btn-primary btn-user btn-block"></button>
                  </form>
                  <hr>                 
                  <div class="text-center">
                    <a class="small" href="/project-yata/account/regAccpt">회원가입하러가기!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="/project-yata/account/login">계정이 있으면 로그인해라!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(function() {
	
	//$("#email-input-message").show();
	$("#phone-input-message").hide();
	$("#user_phone").hide();
	$("#user_passwd").hide();
	$("#user_passwd_check").hide();
	$('#do-action').text("이메일확인");	

	$('#do-action').on('click', function (event) {

		event.preventDefault();
		
		var txt = $(this).text();
		if (txt == "이메일확인") {
			var email = $('#user_email').val();
			if (email.length == 0) {
				alert('이메일을 입력하세요');
				return;
			}
			$.ajax({
				"url": "/project-yata/account/email-confirm",
				"method" : "post",
				"data": { "user_email": email },
				"success": function(result, status, xhr) {
					if (result == 'available') {
						$("#email-input-message").hide();
						$("#phone-input-message").show();
						$("#user_email").hide();
						$("#user_phone").show();
						$('#do-action').text("전화번호확인");
						alert('이메일이 확인되었습니다.');	
					} else {
						alert('유효한 이메일이 아닙니다.');
					}
				},
				"error": function(xhr, status, data) {
					alert('오류가 발생했습니다.');
				} 
			});
		} else if (txt == "전화번호확인") {
			var phone = $('#user_phone').val();
			if (phone.length == 0) {
				alert('전화번호를 입력하세요');
				return;
			}
			$.ajax({
				"url": "/project-yata/account/phone-confirm",
				"method" : "post",
				"data": { "user_phone": phone },
				"success": function(result, status, xhr) {
					if (result == 'available') {
						$("#phone-input-message").hide();						
						$("#user_phone").hide();
						$("#user_passwd").show();
						$("#user_passwd_check").show();
						$('#do-action').text("비밀번호변경");
						alert('전화번호가 확인되었습니다.');	
					} else {
						alert('유효한 전화번호가 아닙니다.');
					}
				},
				"error": function(xhr, status, data) {
					alert('오류가 발생했습니다.');
				} 
			});
		} else { // 비밀번호 변경

			var passwd = $("#user_passwd").val();
			var passwd_check = $("#user_passwd_check").val();
			if (passwd == passwd_check) {
				var form_data = $('#change-password-form').serialize();
				$.ajax({
					"url": "/project-yata/account/change-passwd",
					"method" : "post",
					"data": form_data,
					"success": function(result, status, xhr) {
						if (result == 'success') {
							alert('패스워드를 변경했습니다.');
							location.href = 'login';
						} else {
							alert('패스워드 변경 실패');
						}
					},
					"error": function(xhr, status, data) {
						alert('오류가 발생했습니다.');
					}
				});
				
			} else {
				alert('비밀번호가 일치하지 않습니다.')
				return;
			}
		}
	});
});	   
</script>
  <script src="/project-yata/resources/yata-member-admin/vendor/jquery/jquery.min.js"></script>
  <script src="/project-yata/resources/yata-member-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/project-yata/resources/yata-member-admin/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="/project-yata/resources/yata-member-admin/js/sb-admin-2.min.js"></script>
</body>

</html>
