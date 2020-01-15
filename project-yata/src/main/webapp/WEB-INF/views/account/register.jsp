<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>야타(YaTa) 회원가입</title>

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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {

		$('#register-form').on('submit', function () {

			var getMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		    var getpwCheck = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
		    var getName= RegExp(/^[가-힣]+$/);
			var getPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			var getBirth = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var getCar = /^[0-9]{2}[-~.[:space:]][0-9]{6}[-~.[:space:]][0-9]{2}$/;
			
			//이메일 공백 확인
		    if($("#email").val() == ""){
		    	alert("이메일을 입력해주세요");
		        $("#email").focus();
		        return false;
		   	}
		           
		    //이메일 유효성 검사
		    if(!getMail.test($("#email").val())){
		        alert("이메일형식에 맞게 입력해주세요")
		        $("#email").val("");
		        $("#email").focus();
		        return false;
		    }

		    //이름 공백 확인
		    if($("#name").val() == ""){
		    	alert("이름을 입력해주세요");
		        $("#name").focus();
		        return false;
		    }
				 
		    //이름 유효성
		    if (!getName.test($("#name").val())) {
		        alert("이름은 한글만 입력해주세요");
		        $("#name").val("");
		        $("#name").focus();
		        return false;
		    }

		    //비밀번호 공백 확인
			if($("#passwd").val() == ""){
				alert("비밀번호 확인란을 입력해주세요");
			    $("#passwd").focus();
			    return false;
			        
			}
				
		    //비밀번호 유효성
		    if(!getpwCheck.test($("#passwd").val())) {
				alert("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호를 사용하셔야 합니다.");
			    $("#passwd").val("");
			    $("#passwd").focus();
		   		return false;
		    }
		 
		    //아이디랑 비밀번호랑 같은지
	        if ($("#email").val()==($("#passwd").val())) {
				alert("비밀번호가 ID가 일치 합니다.");
			    $("#passwd").val("");
			    $("#passwd").focus();
		    }

		    //비밀번호 확인 공백 확인
		    if($("#passwdChk").val() == ""){
		    	alert("비밀번호 확인란을 입력해주세요");
		        $("#passwdChk").focus();
		        return false;
		        
		    }
				 
		    //비밀번호 똑같은지
		    if($("#passwd").val() != ($("#passwdChk").val())){ 
			    alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
			    $("#passwd").val("");
			    $("#passwdChk").val("");
			    $("#passwd").focus();
			    return false;
		    }

		    //전화번호 공백 확인
		    if($("#phone").val() == "") {
		   		alert("휴대폰 번호를 입력해주세요");
		        $("#phone").focus();
		        return false;     
		    }

		    //전화번호 유효성
		    if(!getPhone.test($("#phone").val())) {
				alert("휴대폰 번호 양식에 맞게 입력해주세요 ex) 010-0000-0000");
			    $("#phone").val("");
			    $("#phone").focus();
		   		return false;
		    }
		    
		    //생년월일 공백 확인
		    if($("#birth").val() == ""){
		   		alert("생년월일을 입력해주세요");
			    $("#birth").focus();
			    return false;
		    }

		    //전화번호 유효성
		    if(!getBirth.test($("#birth").val())) {
				alert("생년월일 양식에 맞게 입력해주세요 ex) 1900-00-00");
			    $("#birth").val("");
			    $("#birth").focus();
		   		return false;
		    }
		      
		    //우편번호 공백 확인
		    if($("#postcode").val() == ""){
		        alert("우편번호를 입력해주세요");
		        $("#postcode").focus();
		        return false;
		    }
		      
		    //도로명주소 공백 확인
		    if($("#addr").val() == ""){
		        alert("도로명주소를 입력해주세요");
		        $("#addr").focus();
		        return false;
		    }
		      
		    //참고주소 공백 확인
		    if($("#refaddr").val() == ""){
		        alert("참고주소를 입력해주세요");
		        $("#refaddr").focus();
		        return false;
		    }
		      
		    //상세주소 공백 확인
		    if($("#detailAddr").val() == ""){
		        alert("상세주소를 입력해주세요");
		        $("#detailAddr").focus();
		        return false;
		    }
		      
		    /* //면허번호 공백 확인
		    if($("#driveNum").val() == ""){
		        alert("면허번호를 입력해주세요");
		        $("#driveNum").focus();
		        return false;
		    }

		    //면허번호 유효성
		    if(!getCar.test($("#driveNum").val())) {
				alert("운전면허 번호 양식에 맞게 입력해주세요 ex) 00-00-000000-00");
			    $("#driveNum").val("");
			    $("#driveNum").focus();
		   		return false;
		    } */
		    
		    return true;
		});
	});
	</script>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원가입</h1>
							</div>
							<form id="register-form" action="/project-yata/account/register" method="post" class="user">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<img id="myfile1"
											style="width: 150px; height: 150px; margin: 0 auto">
									</div>
									<div class="col-sm-6">
										<input type="file" name="user_photo" id="photo">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" name="user_email"
											class="form-control form-control-user" id="email"
											placeholder="형식 : aaa@aaa.co.kr">
									</div>
									<div class="col-sm-6">
										<input type="text" name="user_Name"
											class="form-control form-control-user" id="name"
											placeholder="이름 : 한글만 가능">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" name="user_passwd"
											class="form-control form-control-user" id="passwd"
											placeholder="특수문자 / 문자 / 숫자 포함 8~15자리">
									</div>
									<div class="col-sm-6">
										<input type="password" name="user_passwd_check"
											class="form-control form-control-user" id="passwdChk"
											placeholder="비밀번호 확인">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" name="user_phone"
											class="form-control form-control-user" id="phone"
											placeholder="전화번호  ex) 010-0000-0000">
									</div>
									<div class="col-sm-6">
										<input type="text" name="user_birth"
											class="form-control form-control-user" id="birth"
											placeholder="생일  ex) 1910-00-00">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" id="sample3_postcode" name="user_postcode"
											class="form-control form-control-user" id="postcode"
											placeholder="우편번호">
									</div>
									<div class="col-sm-6">
										<input id="mapopen" type="button"
											onclick="sample5_execDaumPostcode()" value="우편번호 찾기"
											class="btn btn-primary btn-user btn-block">
									</div>
								</div>
								<div class="form-group">
									<input type="text" id="sample3_address" name="user_addr"
										class="form-control form-control-user" id="addr"
										placeholder="주소">
								</div>
								<div id="mapdiv" class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" id="sample3_extraAddress"
											name="user_detailAddr" class="form-control form-control-user"
											id="refaddr" placeholder="참고주소">
									</div>
									<div class="col-sm-6">
										<input type="text" id="sample3_detailAddress"
											name="user_refAddr" class="form-control form-control-user"
											id="detailAddr" placeholder="상세주소">
									</div>
								</div>
								<!-- Map Start -->
								<div id="map"
									style="width: 100%; height: 300px; margin-top: 10px; display: none"></div>
								<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
								<script
									src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c08b927e742e2037a1df667cf78a3cf8&libraries=services"></script>
								<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					    mapOption = {
					    	    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					            level: 5 // 지도의 확대 레벨
					    };
					
					    //지도를 미리 생성
					    var map = new daum.maps.Map(mapContainer, mapOption);
					    //주소-좌표 변환 객체를 생성
					    var geocoder = new daum.maps.services.Geocoder();
					    //마커를 미리 생성
					    var marker = new daum.maps.Marker({
					        position: new daum.maps.LatLng(37.537187, 127.005476),
					        map: map
					    });
					
					
					    function sample5_execDaumPostcode() {
					        new daum.Postcode({
					            oncomplete: function(data) {
					                var addr = data.address; // 최종 주소 변수
					                var extraAddr = ''; // 참고항목 변수

					                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					                    addr = data.roadAddress;
					                } else { // 사용자가 지번 주소를 선택했을 경우(J)
					                    addr = data.jibunAddress;
					                }

					                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					                if(data.userSelectedType === 'R'){
					                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
					                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있고, 공동주택일 경우 추가한다.
					                    if(data.buildingName !== '' && data.apartment === 'Y'){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					                    if(extraAddr !== ''){
					                        extraAddr = '(' + extraAddr + ')';
					                    }
					                    // 조합된 참고항목을 해당 필드에 넣는다.
					                    document.getElementById("sample3_extraAddress").value = extraAddr;
					                
					                } else {
					                    document.getElementById("sample3_extraAddress").value = '';
					                }
					                
					             	// 우편번호를 해당 필드에 넣는다.
					                document.getElementById('sample3_postcode').value = data.zonecode;
					                // 주소 정보를 해당 필드에 넣는다.
					                document.getElementById("sample3_address").value = addr;
					             	// 커서를 상세주소 필드로 이동한다.
					                document.getElementById("sample3_detailAddress").focus();
					                // 주소로 상세 정보를 검색
					                geocoder.addressSearch(data.address, function(results, status) {
					                    // 정상적으로 검색이 완료됐으면
					                    if (status === daum.maps.services.Status.OK) {
					
					                        var result = results[0]; //첫번째 결과의 값을 활용
					
					                        // 해당 주소에 대한 좌표를 받아서
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        // 지도를 보여준다.
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        // 지도 중심을 변경한다.
					                        map.setCenter(coords);
					                        // 마커를 결과값으로 받은 위치로 옮긴다.
					                        marker.setPosition(coords)
					                    }
					                });
					            }
					        }).open();
					    } 
					</script>
								<div class="form-group">
									<input type="text" name="user_driveNum"
										class="form-control form-control-user" id="driveNum"
										placeholder="면허번호  ex)00-00-000000-00">
								</div>
								<div class="form-group">
									<input type="submit" value="회원가입"
										class="btn btn-primary btn-user btn-block" />
								</div>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="/project-yata/account/forgot-password">비밀번호를
									잊으셨나요?</a>
							</div>
							<div class="text-center">
								<a class="small" href="/project-yata/account/login">계정이
									있으신가요? 로그인 하세요!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

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
