<%@page import="java.util.Collections"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
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
      
      font-style: inherit;
      display:inline;
      outline:none;
      box-sizing: border-box;
      background-color: #c53211;
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
  <%


List<Cookie> recentCookie = new ArrayList(); 


Cookie[] cookies = request.getCookies();  // 요청정보로부터 쿠키를 가져온다



System.out.println("현재 설정된 쿠키의 개수 : " + cookies.length);    // 쿠키가 저장된 배열의 길이를 가져온다.



 for(int i = 0 ; i<cookies.length; i++){                            // 쿠키 배열을 반복문으로 돌린다.

/* URLDecoder.decode(cookies[i].getName(), "utf-8") */

String str = URLDecoder.decode(cookies[i].getName(), "utf-8");

if(str.contains("rc")){
	
	recentCookie.add(cookies[i]);
	
}


System.out.println(i + "번째 쿠키 이름 : " + URLDecoder.decode(cookies[i].getName(), "utf-8"));            // 쿠키의 이름을 가져온다.


System.out.println(i + "번째 쿠키에 설정된 값 : " + cookies[i].getValue());    // 쿠키의 값을 가져온다.


} 

 Collections.reverse(recentCookie);

%>
  
<!-- 검색창 스타일   -->
<style>


@media only screen and (min-width: 769px){
	.main-header {
	    padding-top: 150px;
	}
}

.main-header {
    overflow: hidden;
    position: relative;
    padding-top: 52px;
    text-align: center;
    background-position: center;
    background-size: cover;
}

@media only screen and (min-width: 769px){
.main-search {
   /*  margin: 45px auto 0 auto; */
    height: 50px;
    width: 738px;
    
}

}

.main-search {
    position: relative;
        margin-top: 0px;
}

.search-keywords-container .tab-keywords button {


    position: relative;
    font-size: 0.875rem;
    color: #7f7f7f;
    width: 32.5%;
    height: 50px;
    text-align: center;
    text-decoration: none;
    line-height: 1.2;
    vertical-align: bottom;
        cursor: pointer;
    border: 0px;
        border-radius: 0 0 3px 3px;
    background-color: transparent;
    outline: 0;
    }
    
    .search-keywords-container .tab-keywords button.selected {
    color: #ff7100;
}
.search-keywords-container .tab-keywords button.selected:before {
    content: '';
    display: block;
    position: absolute;
    bottom: 0;
    right: 0;
    left: 0;
    height: 3px;
    background-color: #ff7100;
}


.search-keywords-container .tab-keywords:before {
    content: '';
    display: block;
    position: absolute;
    bottom: 0;
    right: 0;
    left: 0;
    top: 50px;
    height: 1px;
    background-color: #dbdbdb;
}

#Vsearch{

   z-index: 1110;  
   display: none;
    position: absolute;
    width: 450px;
    height: 290px;
    border-radius: 0px 0px 3px 3px;
    background-color: rgb(255, 255, 255);
    margin-left: auto;
    margin-right: auto;
    top: 70px; 
    right: 390px;
    left: 0px;
    bottom: 0px;

}
.search-keywords-container .keywords .list-keywords-wrap .list-keywords>li {
    position: relative;
    border-bottom: 1px solid #dbdbdb;
    overflow: hidden;
}
.search-keywords-container .keywords .list-keywords-wrap .list-keywords>li a {
    display: block;
    padding: 0 45px 0 36px;
    font-size: 0.875rem;
    color: #7f7f7f;
    text-decoration: none;
    margin: 20px 0;
    line-height: 1.2rem;
}
.search-keywords-container .keywords .list-keywords-wrap .list-keywords>li a:before {
    content: '';
    display: block;
    position: absolute;
    top: 50%;
    left: 7px;
}
.search-keywords-container .keywords .list-keywords>li a:before {
    margin-top: -8.5px;
    background-image: url(https://mp-seoul-image-develop-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png?fit=around|*:*&crop=*:*;*,*&output-format=png&output-quality=80);
    background-position: -974px -752px;
    width: 17px;
    height: 17px;
}
@media only screen and (min-width: 769px){
#main-search .in-line>span {
    left: 27px;
    margin-top: -12.5px;
    background-image: url(https://mp-seoul-image-develop-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png?fit=around|*:*&crop=*:*;*,*&output-format=png&output-quality=80);
    
    background-position: -974px -159px;
    width: 24px;
    height: 25px;
}}
#main-search .in-line>span {
    display: block;
    position: absolute;
    top: 50%;
    left: 15px;
    text-indent: -9999px;
}

.search-keywords-container .keywords .list-keywords-wrap .list-keywords>li.clear_all {
    text-align: right;
    padding: 10px 5px 20px 0;
    border-bottom: 0;
    font-size: 0.875rem;
    color: #7f7f7f;
     height: 50px;
     text-decoration: none;
    line-height: 1.2;
    vertical-align: bottom;
        cursor: pointer;
   
}

.search-keywords-container {
    display: none;
    position: fixed;
    z-index: 901;
    background-color: #ffffff;
    overflow-y: auto;
}

#rc_clear {

border: 0px; 
border-radius: 0; 
background-color: transparent;
cursor: pointer;
outline: 0;
}
#no_recent {
    padding: 15px 0;
    text-align: center;
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

<!-- 블랙스크린 -->
<div id="black_screen" onclick="displayVsearch()" class="black_screen" style="
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
    background: rgba(0,0,0,0.8);
    display: none;">></div>

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
		<%-- <form action="" id="main-search" name="main-search" method="get"> 
 			 <div class="in-line">
		      <strong><input type="text" onkeypress="if(event.keyCode==13) {search();}"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" style="color: #575756; border-bottom-left-radius: 20px; border-top-left-radius: 20px"></strong>
		      <strong><input type="button" onclick="search()"  value="검색" style="border-bottom-right-radius: 20px; border-top-right-radius: 20px; border-bottom-left-radius: 20px; border-top-left-radius: 20px; background-color: darkorange; color: white;"></strong>
		     </div>
		</form>
		</div> --%>
				  <!-- 전체 검색 -->
  <fieldset id="search" class="main-search ng-scope" ng-controller="mp20_main_search_suggest_controller" style="z-index: 110;border: 0;">
      
		<form action="" id="main-search" name="main-search" method="get" > 
	 			 <div class="in-line" style="margin-left: auto; margin-right: auto; ">
	 			 <span>검색 :</span>
			      <strong><input type="text" class="seaechAll" onkeypress="if(event.keyCode==13) {search();}" onclick="displayVsearch()"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" autocomplete="off" style="color: #ffffff; margin-left: 40px;"></strong>
			      
			     </div>
				<!-- controller로 넘겨주기 위한 값 -->
				<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
					value="${(empty recordCountPerPage)?9:recordCountPerPage }">
							     
		</form> 
</fieldset>
		</div>
		
		<!-- 추천 검색어 / 최근검색어 -->
   <div>
   <aside id="Vsearch" class="search-keywords-container ng-scope main" ng-controller="mp20_search_list_controller" style="">
  <nav  class="tab-keywords">
 
    <!-- <button class="searching_tap_recommend searching_tap selected" onclick="select_tab_by_recommend()"> -->
     <button class="searching_tap_recommend searching_tap selected" value="re_btn1">
      추천 검색어
    </button>
    <!-- <button class="searching_tap_trending searching_tap" onclick="select_tab_by_popular()"> -->
     <button class="searching_tap_trending searching_tap" value="re_btn2" >
      인기 검색어
    </button>
   <!--  <button class="searching_tap_recent searching_tap" onclick="select_tab_by_lately()"> -->
     <button class="searching_tap_recent searching_tap" value="re_btn3">
      최근 검색어
    </button>
    
  </nav>
<%-- <%
String recomend = "추천검색어테스트";

%>
<c:set var="recomend" value="추천검색어1"></c:set> --%>
  <!--  검색 자동완성 -->
  <div class="keywords">
	  <div class="list-keywords-wrap">
	    <ol class="list-keywords" >
	      <li class="list-keyword" >
	        <a href="#" category="" onclick="search2(this)" class="ng-binding">존맛</a>
	        <div class="search_result_delete ng-hide" onclick="search2()">
          </div>
	      </li>
			<li class="list-keyword" >
	        <a href="#" category="" onclick="search2(this)" class="ng-binding">국물</a>
	        <div class="search_result_delete ng-hide" onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT_CANCEL')">
          </div>
	      </li>
	      <li class="list-keyword" >
	        <a href="#" category="" onclick="search2(this)" class="ng-binding">혼밥</a>
	        <div class="search_result_delete ng-hide" onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT_CANCEL')">
          </div>
	      </li>
	      <li class="list-keyword" >
	        <a href="#" category="" onclick="search2(this)" class="ng-binding">맛집</a>
	        <div class="search_result_delete ng-hide" onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT_CANCEL')">
          </div>
	      </li>
	      <li class="list-keyword" >
	        <a href="#" category="" onclick="search2(this)" class="ng-binding">신사동</a>
	        <div class="search_result_delete ng-hide" onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT_CANCEL')">
          </div>
	      </li>

	    </ol>
	  </div>
  </div>
</aside>
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

<script type="text/javascript">
function search() {
	
	  var keyword = $("#main-keyword").val();
	  if (keyword == "" || keyword == null) {
		alert("검색어를 입력해주세요")
		
	}else{
		alert("main-keyword = " + keyword);
		
		$("#main-search").attr({"target":"_self", "action":"search.do"}).submit();
	}
	
	  
	  
}
</script>

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
<script src="vendor/jquery/jquery.min.js"></script>

 <script type="text/javascript">
	      function displayVsearch() {
	    	
	    	  $("#Vsearch").toggle();
	    	  $("#black_screen").toggle();
	    	   
	    	    if($("#search").css("z-index")=='110'){
	    	    	$("#search").css("z-index","1100")
	    	    }else{
	    	    	
	    	    	$("#search").css("z-index","110")
	    	    } 
	    	  
	    	  
		}
	      </script>

<script type="text/javascript">
 $(document).ready(function(){
	var tab = $('.tab-keywords');
	tab.find('button').click(function(){ 
		
		 $("[class*=selected]").removeClass("selected"); 
		 $(this).addClass("selected");
		 var btn = $(this).val();
		 if (btn == "re_btn1") { // 추천검색어
			
			$(".list-keywords *").remove();
			 var re_str = ['존맛','국물','혼밥','맛집','신사동'];
			for (var i = 0; i < re_str.length; i++) {
				$(".list-keywords").append(
					    $('<li>').attr('class','list-keyword').append(
					            $('<a>').attr('href','#').attr('onclick','search2(this)').append(
					            		re_str[i]
					              )));  
			} 
			
		}else if (btn == "re_btn2"){ // 인기검색어
			
			$(".list-keywords *").remove();
			
			 var re_str = ['삼성동','데이트','삼겹살','모임','이태원','강남','카페'];
				for (var i = 0; i < re_str.length; i++) {
					$(".list-keywords").append(
						    $('<li>').attr('class','list-keyword').append(
						            $('<a>').attr('href','#').attr('onclick','search2(this)').append(
						            		re_str[i]
						              )));  
				}
			
		}else{ // 최근검색어
			
			$(".list-keywords *").remove();
			
			 var re_str = <%=recentCookie.size()%>
			 
			 if (re_str == 0) {
				 $(".list-keywords").append(
						    $('<li>').attr('class','list-keyword').append(
						            $('<p>').attr('id','no_recent').append(
						            		"최근 검색어가 없습니다."
						              ))); 
			
			}else{
				<%for(int i=0;i<recentCookie.size();i++){ %>
				$(".list-keywords").append(
					    $('<li>').attr('class','list-keyword').append(
					            $('<a>').attr('href','#').attr('onclick','search2(this)').append(
					            		"<%=URLDecoder.decode(recentCookie.get(i).getValue(), "utf-8") %>"
					              ))); 	 
					<%}%>
					$(".list-keywords").append(
							$('<li>').attr('class','clear_all').append(
								 $('<button>').attr('id','rc_clear').attr('onclick','rc_clear()').append(
										
										 "x clear all"
								 )));
				
			 
			 
			 
			 
			}
		}
		 

	 })

}) 


function search2(a) {
	
	$("#main-keyword").val(a.innerHTML);
	$("#main-search").attr({"target":"_self", "action":"search.do"}).submit();
	
}
 function rc_clear() {
	 alert("삭제");
	 location.href="rc_clear.do"; 
}
</script>


</html>