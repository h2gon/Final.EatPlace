
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="UTF-8" />

<!DOCTYPE html>
<html>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EAT PLACE: 나만의 맛집 검색</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/creative.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 지도API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b79e9996c3bab29b8e5285b04135813"></script>


</head>

<body>

	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #c53211; padding-bottom: 10px">
		<div class="container">
			<a class="navbar-brand" href="home.do">EAT PLACE</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<div class="container">
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html"><strong
							style="color: white; margin-left: 20px">About</strong></a></li>
					<li class="nav-item"><a class="nav-link"
						href="restaurntsList.do"><strong
							style="color: white; margin-left: 20px">맛집 리스트</strong></a></li>
					<li class="nav-item"><a class="nav-link"
						href="restaurantsInsert.do"><strong
							style="color: white; margin-left: 20px">맛집 추가</strong></a></li>
					<li class="nav-item" style="margin-left: 20px"><a
						class="nav-link openMask" href="#"> <img alt=""
							src="img/main/man-user.png">
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<br>

	
	<!-- Portfolio Section -->	
	<div style="float: left; width: 73%">
		<p style="margin-left: 58px; font-size: 24px; color: #ff7100">
			<strong>전체 맛집 리스트</strong>
		</p>
		<div class="row" style="margin-left: 65px; margin-right: 65px">
			<%
				List<RegiDto> list = (List<RegiDto>) request.getAttribute("rslist");

				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="col-lg-4 col-sm-6 portfolio-item"
				style="height: 350px; width: 430px;">

				<div class="card h-100">
					<a href="rsdetail.do?seq=<%=list.get(i).getSeq()%>"><img
						class="card-img-top" src="\image\<%=list.get(i).getRs_picture()%>"
						alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="rsdetail.do?seq=<%=list.get(i).getSeq()%>"><%=list.get(i).getRs_name()%>&nbsp;&nbsp;<strong><span
									style="color: #ff792a; font-size: 1.37rem;"><%=list.get(i).getRs_rating()%></span></strong></a>
						</h4>
						<p class="card-text"><%=list.get(i).getRs_address1()%>
							-
							<%=list.get(i).getRs_category()%></p>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
	</div>
	
		<!-- 지도 -->
	<div style="float: left; width: 27%">
	<div id="map" style="width: 400px; height: 500px;"></div>
	</div>

		<br>

		 <!-- Footer -->
		<!-- <footer class="py-5 bg-dark">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2018</p>
			</div>
			
		</footer> -->  

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
</body> 

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.56899, 126.97247), // 지도의 중심좌표
		level : 8, // 지도의 확대 레벨
		mapTypeId : daum.maps.MapTypeId.ROADMAP
	// 지도종류
	};

	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new daum.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	// 지도에 마커를 생성하고 표시한다
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.56899, 126.97247), // 마커의 좌표
		map : map
	// 마커를 표시할 지도 객체
	});

	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	daum.maps.event.addListener(marker, 'click', function() {
		alert('마커를 클릭했습니다!');
	});
</script>





</html>
