<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>계산기</title>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet" type="text/css" />
  <script src="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/js/all.min.js"></script>
</head>

<body>

<div class="calculator" style="height: 310px;">
		<h2 class="nino-sectionHeading">
			<span class="text">금액 계산기</span>
		</h2>   
		
		<input id="km" type="text" class="form-control form-control-user"  placeholder="주행거리(km)" 
		style="width: 50%; padding: 10px; font-size: 15px; margin: 10px auto; text-align: center; line-height: 15px;"> </input>
		<input id="fuel" type="text" class="form-control form-control-user"  placeholder="${ car.car_fuel }" value="${ car.car_fuel }"
		style="width: 50%; padding: 10px; font-size: 15px; margin: 10px auto; text-align: center; line-height: 15px;" readonly="readonly" ></input>
		<input id="gasoline" type="text" class="form-control form-control-user"  placeholder="1750" value="1750"
		style="width: 50%; padding: 10px; font-size: 15px; margin: 10px auto; text-align: center; line-height: 15px;" readonly="readonly"></input>
		<a href="#" class="btn btn-success btn-icon-split"
		style="width: 50%; padding: 10px; font-size: 15px; margin: 10px auto; text-align: center; line-height: 15px; display: block;">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                    <span class="text" id="resultbtn">계산하기</span>                    
                  </a>
        <input id="result" type="text" class="form-control form-control-user"  placeholder="result"
		style="width: 50%; padding: 10px; font-size: 15px; margin: 20px auto; text-align: center; line-height: 15px;" readonly="readonly"></input>
	</div>
	<script type="text/javascript">
	// 계산하기 버튼 누르면 작동

    var resultbtn = document.querySelector("#resultbtn");
    resultbtn.addEventListener('click', function (event) {

        // 목표액 , 불입기간, 예상이율 인풋 태그 선언

        var km = document.querySelector("#km");
        var fuel = document.querySelector("#fuel");
        var gasoline = document.querySelector("#gasoline");
        var km = $('#km').val();
        var fuel = $('#fuel').val();
        var gasoline = $('#gasoline').val();

        // 숫자 소수점 버리기
        var result = Math.ceil((km * fuel) * gasoline);
        console.log(km);
        console.log(fuel);
        console.log(gasoline);
        // 콤마 만들기
        function comma(num) {
            var len, point, str;
            num = num + "";
            point = num.length % 3;
            len = num.length;

            str = num.substring(0, point);
            while (point < len) {
                if (str != "") str += ",";
                str += num.substring(point, point + 3);
                point += 3;
            }
            return str;
        }

        var result_comma = comma(result);

        $('#result').val(result_comma).text(`${result_comma}` + "원");
    });

	</script>

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
  
</body>
</html>