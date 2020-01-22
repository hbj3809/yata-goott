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

  <!-- Custom fonts for this template-->
  <link href="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet">

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
          <h1 class="h3 mb-2 text-gray-800">자유 게시판</h1>
          <br>
          
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <span class="m-0 font-weight-bold text-primary">글 목록</span>
              <a href="write.action" 
              	 class="btn btn-success btn-sm" style="float:right"> 
              	<span class="text">글 쓰기</span>
              </a> 

            </div>
            <div class="card-body">
              <div class="table-responsive-x">
                
    
                
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>글번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일자</th>
                    </tr>
                  </thead>                  
                  <tbody>
                  	
                  	
                  	
                  	<c:forEach items="${ board }" var="board">
                  	<tr>
                      <td>${ board.brd_num }</td>
                      <td>
                      	<a href="detail?brd_num=${ board.brd_num }">
                      		${ board.brd_title }
                      	</a>	
                      	<br>
                      </td>
                      <td>${ board.brd_writer }</td>
                      <td>${ board.brd_regDate }</td>
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
  
  <!-- Board Write Message Modal-->
  <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalTitle">알림</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body"></div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
  
<%--   <form id="detail-form" action="detail.action" method="get">
  	<input type="hidden" id="bno" name="bno">
  	<input type="hidden" id="pageNo" name="pageNo" value="${ pager.pageNo }">
  	<input type="hidden" id="searchType" name="searchType" value="${ param.searchType }">
  	<input type="hidden" id="searchKey" name="searchKey" value="${ param.searchKey }">
  </form> --%>

  <%@include file="/WEB-INF/views/board/modules/common-js.jsp" %>
  
  <script type="text/javascript">
	$(function() {
		/* // var newBno = ${ param.newBno };		
		// alert(history.state);
		var newBno = '${ newBno }'; 
		if (newBno && !history.state) {
			$('#messageModal .modal-body').text(newBno + "번 글이 등록되었습니다.")
			$('#messageModal').modal('show');
		}
		history.replaceState({}, null, null);
		/////////////////////////////////////////////////
		$('.to-detail').on('click', function(event) {
			//$(this) : 이벤트를 발생시킨 객체 (여기서는 a 태그 객체)
			var bno = $(this).attr('data-bno');
			//alert(bno);
			$('#detail-form #bno').val(bno);

			$('#detail-form').submit();
		}); */
	});
  </script>
</body>

</html>

















