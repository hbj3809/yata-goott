<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

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
  
          <br>
          	
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <span class="m-0 font-weight-bold text-primary">후기 내용</span>
            </div>
            <div class="card-body">
              
		          
		          <div class="form-group">
		            <label>제목</label> 
		            <input class="form-control" id='rev_title' name='rev_title' value="${ review.rev_title }">
		          </div>	
		          	
		          <div class="form-group">
		            <label>내용</label>
		            <textarea class="form-control" rows="3" id='rev_content' name='rev_content'>${ review.rev_content }</textarea>
		          </div>	
		          	
		          	<div class="form-group">
		            <label>평점</label> 
		            <input class="form-control" id='rev_grade' name="rev_grade" value="${ review.rev_grade }">
		          </div>
		          		
		          <div class="form-group">
		            <label>작성일자</label> 
		            <input class="form-control" id='rev_regDate' name="rev_regDate" value="${ review.rev_regDate }">
		          </div>
		            
		          <div class="form-group">
		            <label>사진</label> 
		            <div style="width: 200px; height: 200px" class="form-control" id='rev_photo'>
		            	<img src="/project-yata/resources/file/review-photo/${ review.rev_photo }">
		            </div>
		          <br>
		          <button id="tolist-button" type="button" class="btn btn-success">목록</button>
		        
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

		$('input, textarea').attr({'readonly': 'readonly'})
		
		$('#tolist-button').on('click', function(event) {
			location.href = "review-list";
		});

		
	});
  </script>
  
</body>

</html>












