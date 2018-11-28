<%@page import="kh.c.five.model.ReviewParam"%>
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

<!-- SEARCH -->
<style>
   
    .in-line{
      width:900px;	
      height:42px; 
    }
   
    input[type="text"]{
      width:70%;
      height:100%;
      border:none;
      font-size:1.213rem;
      padding-left: 20px;
      font-style: inherit;
      display:inline;
      outline:none;
      box-sizing: border-box;
      color:black;

    }
    input[type=button]{
      width: 30%;
      height:100%;
      background-color: lightgray;
      border:none;
      background-color: white;
      font-size:1.313rem;
      color:#042AaC;
      outline:none;
      display:inline;
      margin-left: -25px;
      box-sizing: border-box;
    }
 
  </style>


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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b79e9996c3bab29b8e5285b04135813&libraries=services"></script>

</head>

<body>

<%!
public String dot3(String msg){
	String s = "";
	if(msg.length() >= 3){
		s = msg.substring(0, 3);
		s += "...";
	}else{
		s = msg.trim();
	}
	return s;
}


public String ss(String msg){
	
	String s[] = msg.split(" ");
	String re = s[0] + " " + s[1];

	return re;
}

%>

<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";

System.out.println("category = "+category);

String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";

System.out.println("keyword = "+keyword);
%>
<script>
var str = '<%=category%>';
var kstr = '<%=keyword%>';
$(document).ready(function () {
	
	$("#_s_category").val(str);
	$("#main-keyword").val(kstr);
})
</script>



	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #c53211; padding-bottom: 10px">
		<div class="container" style="float: left; width: 20%">
			<a class="navbar-brand" href="home.do">EAT PLACE</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		
		<div style="float: left; width: 60%">
		<form action="" id="main-search" name="main-search" method="get"> 
 			 <div class="in-line">
		      <strong><input type="text" onkeypress="if(event.keyCode==13) {search();}"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" style="color: #575756; border-bottom-left-radius: 20px; border-top-left-radius: 20px"></strong>
		      <strong><input type="button" onclick="search()"  value="검색" style="border-bottom-right-radius: 20px; border-top-right-radius: 20px; border-bottom-left-radius: 20px; border-top-left-radius: 20px; background-color: darkorange; color: white;"></strong>
		     </div>
		</form>
		</div>
		
		<div class="container" style="float: left; width: 20%">
			<div class="collapse navbar-collapse" id="navbarResponsive">				
				<ul class="navbar-nav ml-auto">
					
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
				List<RegiDto> list = (List<RegiDto>) request.getAttribute("searchlist");
				if(list.size()==0 || list ==null){
				String s_keyword = (String)request.getAttribute("s_keyword");
				%>
				
				<p style="font-size: 25px;line-height: 25px;margin-bottom: 65px;">
		          '<span ><%=s_keyword %></span>'에 대한 검색 결과가 없습니다.
	         	 </p>
				
				<%
				}
				else{
				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="col-lg-4 col-sm-6 portfolio-item"
				style="height: 350px; width: 430px;">

				<div class="card h-100">
					<a href="rsdetail.do?seq=<%=list.get(i).getSeq()%>"><img
						class="card-img-top" src="<%=list.get(i).getRs_picture()%>"
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
				}}
			%>

		</div>


				<!-- 페이징 처리 -->
<div id="paging_wrap">	
	<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
		<jsp:param value="${pageNumber }" name="pageNumber"/>		
		<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
		<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
		<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>	
	</jsp:include>	
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

<%
List<ReviewParam> rplist = (List<ReviewParam>)request.getAttribute("rplist");
%>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new daum.maps.LatLng(37.56899, 126.97247), // 지도의 중심좌표
	level : 5
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new Array();
<%
for(int j=0;j<list.size();j++){
%> 
geocoder[<%=j %>] = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder[<%=j %>].addressSearch('<%=list.get(j).getRs_address1() %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        
   		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		daum.maps.event.addListener(marker, 'click', function() {
		    //alert('마커를 클릭했습니다!');
		  
		    // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			<%-- var iwContent = "<div style='padding:5px;'><img s src='/image/<%=list.get(j).getRs_picture() %>'></div>" --%>
			<%-- var iwContent ='<div style="width: 200px; height: 100px;" class="card h-100"><a href="rsdetail.do?seq=<%=list.get(j).getSeq() %>"><img class="card-img-top" src="/image/<%=list.get(j).getRs_picture() %>" alt=""></a><div class="card-body"><h4 class="card-title"><a href="rsdetail.do?seq=<%=list.get(j).getSeq() %>"><%=list.get(j).getRs_name() %>&nbsp;&nbsp;<strong><span style="color:#ff792a; font-size: 1.37rem;"><%=list.get(j).getRs_rating() %></span></strong></a></h4><p class="card-text"><%=list.get(j).getRs_address1() %> - <%=list.get(j).getRs_category() %></p></div></div>', --%> 
			<%-- var iwContent ='<div style="width: 200px; height: 100px;" class="card h-100"><a href="rsdetail.do?seq=<%=list.get(j).getSeq() %>"><img class="card-img-top" src="/image/<%=list.get(j).getRs_picture() %>" alt=""></a></div><div class="card-body"><h4 class="card-title"><a href="rsdetail.do?seq=<%=list.get(j).getSeq() %>"><%=list.get(j).getRs_name() %>&nbsp;&nbsp;<strong><span style="color:#ff792a; font-size: 1.37rem;"><%=list.get(j).getRs_rating() %></span></strong></a></h4><p class="card-text"><%=list.get(j).getRs_address1() %> - <%=list.get(j).getRs_category() %></p></div>', --%>
			
			var iwContent = '<figure style="margin-left: 10px; margin-right: 10px;"><div style="float: left;"><a href="rsdetail.do?seq=<%=list.get(j).getSeq() %>"><img style="width: 110px; height: 125px; padding-bottom:15px;" src="<%=list.get(j).getRs_picture() %>" alt=""></a></div> <figcaption><div style="margin-left: 120px; width: 140px;"><h4><a href="rsdetail.do?seq=<%=list.get(j).getSeq() %>"><strong><%=dot3(list.get(j).getRs_name()) %><strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="color:#ff792a; font-size: 1.37rem;"><%=list.get(j).getRs_rating() %></span></strong></a></h4><p style="width: 130px;"><%=ss(list.get(j).getRs_address1()) %> - <%=list.get(j).getRs_category() %></p><p style="color: gray;"><img src="img/map/pen.png">&nbsp;<%=rplist.get(j).getReviewCount() %>&nbsp;&nbsp;<img src="img/map/star.png">&nbsp;<%=rplist.get(j).getLike() %></p></div></figcaption></figure>',
			iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
			    
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			
			daum.maps.event.addListener(map, 'click', function() {			
				infowindow.close();
			});
			
			
			
		});
   		
		
   		
        
     	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
     	
     	
     	
    } 
}); 
<%}%>

/* 페이지번호를 클릭했을때 */
function goPage(pageNumber) {
	$("#_pageNumber").val(pageNumber);
	alert(pageNumber);
	
	var str = '<%=category%>';
	var kstr = '<%=keyword%>';
	
	if (str == "") {
		alert("카테고리 없");
		$("#main-search").attr({"target":"_self", "action":"search.do"}).submit();
	}
	else if (kstr == ""){
		alert("검색어 없");
		$("#main-search").attr({"target":"_self", "action":"category.do"}).submit();
	}else {
		alert("?????");
	}
	
	
}


</script>






</html>
