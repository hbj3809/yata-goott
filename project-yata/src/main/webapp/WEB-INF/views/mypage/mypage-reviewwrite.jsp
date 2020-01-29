<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="/spring-board-b/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/spring-board-b/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="/WEB-INF/views/mypage/sidebar.jsp" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <jsp:include page="/WEB-INF/views/board/modules/topbar.jsp" />
        
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">후기작성하기</h1>
          <br>
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <span class="m-0 font-weight-bold text-primary">글 쓰기</span>
            </div>
            <div class="card-body">
               <form id="review-write-form" role="form" action="review-write" method="post" enctype="multipart/form-data">
		          <input type="hidden" id="user_num" name="user_num" value="${ user_num }">
		          <input type="hidden" id="car_num" name="car_num" value="${ car_num }">
		          <input type="hidden" id="res_num" name="res_num" value="${ res_num }">
		          <input type="hidden" id="rev_writer" name="rev_writer" value="${ loginuser.user_email }">
		          <div class="form-group">
		            <label>제목</label> 
		            <input class="form-control" id='rev_title' name='rev_title'>
		          </div>		
		          <div class="form-group">
		            <label>내용</label>
		            <textarea class="form-control" rows="3" id='rev_content' name='rev_content'></textarea>
		          </div>		
		          	<div class="form-group">
		            <label>평점</label> 
		            <input class="form-control" id='rev_grade' name="rev_grade">
		          </div>
		          <div class="form-group">
		            <label>사진</label> 
		            <input class="form-control" id='rev_photo' name='rev_photo2' type="file">
		          <button type="submit" type="button" class="btn btn-success">등록</button>
		          <button type="reset" class="btn btn-success">다시쓰기</button>
		          <button id="tolist-button" type="button" class="btn btn-success">목록</button>
		        </form>
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

  <%@include file="/WEB-INF/views/board/modules/common-js.jsp" %>
  
  <script type="text/javascript">
	$(function() {
		$('#tolist-button').on('click', function(event) {
			location.href = "review-list.action";
		});

		$('#write-button').on('click', function(event) {
			//1. 유효성 검사
			if ($('#title').val() == '') {
				alert('제목을 입력하세요');
				$('#title').focus();
				return;
			}
			if ($('#writer').val() == '') {
				alert('작성자를 입력하세요');
				$('#writer').focus();
				return;
			}

			//2. 오류가 없다면 서버로 전송
			$('#review-write-form').submit();
		});
	});
  </script>
  
</body>

</html>












