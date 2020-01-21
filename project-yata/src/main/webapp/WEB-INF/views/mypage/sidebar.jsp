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

  <title>navbar</title>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="/project-yata/resources/yata-member-admin/css/sb-admin-2.min.css" rel="stylesheet" type="text/css" />
  <script src="/project-yata/resources/yata-member-admin/vendor/fontawesome-free/js/all.min.js"></script>
</head>


<body>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/project-yata/mypage/mypage-main">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">마이페이지</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active" active-tab="tab1">
      <a class="nav-link" href="/project-yata/mypage/mypage-main">
        <i class="fas fa-fw fa-tachometer-alt"></i>
        <span>마이페이지</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      Interface
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link" href="/project-yata/mypage/update">
        <i class="fas fa-fw fa-table"></i>
        <span>회원 정보 수정</span></a>
    </li>

<li class="nav-item">
      <a class="nav-link" href="/project-yata/mypage/reservationlist?user_num=${loginuser.user_num}">
        <i class="fas fa-fw fa-table"></i>
        <span>내 예약 리스트</span></a>

    </li><li class="nav-item">
      <a class="nav-link" href="/project-yata/mypage/qna">
        <i class="fas fa-fw fa-table"></i>
        <span>1:1 상담</span></a>
    </li>
<li class="nav-item">
      <a class="nav-link" href="/project-yata/mypage/reviewlist">
        <i class="fas fa-fw fa-table"></i>
        <span>후기 리스트</span></a>
    </li>
<li class="nav-item">
      <a class="nav-link" href="/project-yata/mypage/point">
        <i class="fas fa-fw fa-chart-area"></i>
        <span>내 포인트</span></a>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    

    <!-- Divider -->
    

    <!-- Heading -->
    

    <!-- Nav Item - Pages Collapse Menu -->
    

    <!-- Nav Item - Charts -->
    

    <!-- Nav Item - Tables -->
    <li class="nav-item">
      
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

  </ul>
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