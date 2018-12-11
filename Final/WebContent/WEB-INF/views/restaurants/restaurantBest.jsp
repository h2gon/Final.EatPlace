<%@page import="kh.c.five.model.ReviewParam"%>
<%@page import="kh.c.five.model.ReviewDto"%>
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="UTF-8" />
      
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
 
p.test {
    width: 400px;   
    word-wrap: break-word;
}

</style>

<%
RegiDto best_category = (RegiDto)request.getAttribute("category");
RegiDto best_address = (RegiDto)request.getAttribute("address");
RegiDto best_keyword = (RegiDto)request.getAttribute("keyword");


String best_title =null;


if(best_category != null){
	best_title = best_category.getRs_category();
}
if(best_address != null){
	best_title = best_address.getRs_address1();
}
if(best_keyword != null){
	best_title = best_keyword.getRs_keyword();
}

%>   

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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EAT PLACE: Best Restaurants</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/creative.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- 지도API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b79e9996c3bab29b8e5285b04135813&libraries=services"></script>  

</head>

<body>


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

	<header>	          		         
         <div style="text-align: center; padding-top: 50px; background-color: white;">	           
            <h1 style="color: black;"><strong>EAT PLACE <%=best_title %> BEST 5</strong></h1>
            <h3 style="color: black;"><strong>"혼자 알기 아까운 곳!"</strong></h3>
            <br>   			   
        </div> 
	</header>
	
	<img alt="" src="img/button/hr.png" style="width: 100%">
	
	<br>
	<%
		List<RegiDto> bestlist = (List<RegiDto>)request.getAttribute("bestlist");
		List<ReviewDto> reviewlist = (List<ReviewDto>)request.getAttribute("reviewlist");
	%>
	<section style="padding-top: 15px; padding-bottom: 50px">
		<ul style="list-style: none;">
		<table>
		
		
			<%
			for(int i = 0; i<5; i++){
				if(bestlist.size() != 0){
			%>
			<tr>
			<td>
			<div>
			<li style="text-align: center; margin-left: 430px">
				<div>
					<figure style="float: left;">
						<a href="rsdetail.do?seq=<%=bestlist.get(i).getSeq()%>"> 
						 <img src="<%=bestlist.get(i).getRs_picture() %>" style="width: 238px; height: 238px;"> 
						</a>
					</figure>
					
					<figcation style="float:left; text-align: left;">
						<div style="padding-top: 13px">
						<a href="rsdetail.do?seq=<%=bestlist.get(i).getSeq()%>"><span style="font-size: 1.8rem;"><%=i+1 %>. <%=bestlist.get(i).getRs_name() %></span></a>&nbsp;&nbsp; <strong style="font-size: 1.8rem;"><%=bestlist.get(i).getRs_rating() %></strong>
							<p style="font-size: 1.063rem; color: gray;"><%=bestlist.get(i).getRs_address1() %></p>
						</div>
						
						<div>																							
							<p class="test"><%=reviewlist.get(i).getRs_content() %></p>							
						</div>						
					</figcation>										
				</div>
			</li>
			</div>
			 <img alt="" src="img/button/hr.png" style="width: 55%; margin-left: 460px">
			</td>
			</tr>			
			<%} 
			}
			%>
			<tr>
				<td>
					<!-- 지도 -->
					<div>
					 <p style="margin-left: 58px; font-size: 24px; color: #ff7100; padding-left: 400px"><strong>리스트 지도</strong></p>					 
						<div id="map" style="width: 700px; height: 425px; margin-left: 465px;"></div>
					</div>
				</td>
			</tr>				
			</table>							
		</ul>	
	
		<br>
	
	 <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
    
      <div style="text-align:left; color: white; font-size: 35px; padding-top: 20px;">
      	<p>EAT PLACE</p>
      <img alt="" src="img/button/hr.png" style="width: 5%; height: 1px"><br><br>
      <p style="color: gray; font-size: 13px">Eat, Share, Be Happy</p>
      </div>
      
      <br> 
      
      <div>
	     <span style="color: gray;">
	      	<img alt="" src="img/button/hr.png" style="width: 100%; height: 1px">
	      	 인기지역:<a style="text-decoration: none;" href="search.do?s_keyword=이태원">이태원</a>|<a style="text-decoration: none;" href="search.do?s_keyword=강남" >강남</a>|<a style="text-decoration: none;" href="search.do?s_keyword=홍대">홍대</a>|<a style="text-decoration: none;" href="search.do?s_keyword=가로수길">가로수길</a>|<a style="text-decoration: none;" href="search.do?s_keyword=건대">건대</a>|<a style="text-decoration: none;" href="search.do?s_keyword=대학로">대학로</a>|<a style="text-decoration: none;" href="search.do?s_keyword=신촌">신촌</a>|<a style="text-decoration: none;" href="search.do?s_keyword=혜화">혜화</a>|<a style="text-decoration: none;" href="search.do?s_keyword=잠실">잠실</a>|<a style="text-decoration: none;" href="search.do?s_keyword=왕십리">왕십리</a>|<a style="text-decoration: none;" href="search.do?s_keyword=압구정">압구정</a>|<a style="text-decoration: none;" href="search.do?s_keyword=사당">사당</a>|<a style="text-decoration: none;" href="search.do?s_keyword=명동">명동</a>|<a style="text-decoration: none;" href="search.do?s_keyword=혜화">혜화</a> 
	      	 <br><br>	       	 	
	      	<img alt="" src="img/button/hr.png" style="width: 100%; height: 1px">
	     </span>
      </div>
      
      <div>      
        <p style="color: gray;">㈜ 잇플레이스
        	<br>
			서울특별시 강남구 페이퍼컴퍼니
			<br>
			KH정보교육원			
			<br>			
			고객센터: 02-0112-0119
			<br><br>
			
			© 2018 Eat Place Co., Ltd. All rights reserved.
		</p>
	  </div>
      
      </div>
    </footer>


    
</body>

<%
List<ReviewParam> rplist = (List<ReviewParam>)request.getAttribute("rplist");
%>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new daum.maps.LatLng(37.56899, 126.97247), // 지도의 중심좌표
	level : 9
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new Array();
<%
for(int j=0;j<5;j++){
%> 
geocoder[<%=j %>] = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder[<%=j %>].addressSearch('<%=bestlist.get(j).getRs_address1() %>', function(result, status) {

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
			var iwContent = '<figure style="margin-left: 10px; margin-right: 10px;"><div style="float: left;"><a href="rsdetail.do?seq=<%=bestlist.get(j).getSeq() %>"><img style="width: 110px; height: 125px; padding-bottom:15px;" src="<%=bestlist.get(j).getRs_picture() %>" alt=""></a></div> <figcaption><div style="margin-left: 120px; width: 140px;"><h4><a href="rsdetail.do?seq=<%=bestlist.get(j).getSeq() %>"><strong><%=dot3(bestlist.get(j).getRs_name()) %><strong>&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="color:#ff792a; font-size: 1.37rem;"><%=bestlist.get(j).getRs_rating() %></span></strong></a></h4><p style="width: 130px;"><%=ss(bestlist.get(j).getRs_address1()) %> - <%=bestlist.get(j).getRs_category() %></p><br><p style="color: gray;"><img src="img/map/pen.png">&nbsp;<%=rplist.get(j).getReviewCount() %>&nbsp;&nbsp;<img src="img/map/star.png">&nbsp;<%=rplist.get(j).getLike() %></p></div></figcaption></figure>',
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
<%-- <%}%> --%>


</script>



</html>