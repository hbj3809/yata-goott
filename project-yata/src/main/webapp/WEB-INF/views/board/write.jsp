<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>야타(YATA!) 게시판</title>

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
					<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
					<br>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<span class="m-0 font-weight-bold text-primary">글 쓰기</span>
						</div>
						<div class="card-body">
							<form id="write-form" role="form" action="write.action"
								method="post">


								<div class="form-group">
									<label>제목</label> <input class="form-control" id='brd_title'
										name='brd_title'>
								</div>

								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="3" id='brd_content'
										name='brd_content'></textarea>
								</div>

								<div class="form-group" >
									<label>작성자</label> 
									<input class="form-control" id='brd_writer' name='brd_writer' value="${ loginuser.user_email }">
									<input  name='user_num' type="hidden" value="${ loginuser.user_num }">
								</div>
								

								<button id="write-button" type="button" class="btn btn-success">등록</button>
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

	<%@include file="/WEB-INF/views/board/modules/common-js.jsp"%>

	<script type="text/javascript">
		$(function() {

			$('#brd_writer').attr({'readonly': 'readonly'})
			$('#tolist-button').on('click', function(event) {
				location.href = "free-list.action";
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
				$('#write-form').submit();
			});
		});
	</script>

</body>

</html>












