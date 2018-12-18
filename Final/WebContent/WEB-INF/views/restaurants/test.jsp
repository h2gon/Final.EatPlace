<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kh.c.five.model.wannagoDto"%>
<%@page import="javax.jws.Oneway"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="kh.c.five.model.EatMemberDto"%>
<%@page import="kh.c.five.dao.impl.EatReviewDaoImpl"%>
<%@page import="kh.c.five.dao.EatReviewDao"%>
<%@page import="kh.c.five.model.fileDto"%>
<%@page import="kh.c.five.service.impl.EatReviewServiceImpl"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="kh.c.five.service.EatReviewService"%>
<%@page import="kh.c.five.model.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
 	//EatMemberDto user = (EatMemberDto)session.getAttribute("login");
/* boolean loginok = false;
	if(user != null){
		loginok = true;
	} */
 	//Cookie[] cookies = request.getCookies(); 
   // List<RegiDto> RankList = (List<RegiDto>)request.getAttribute("RankList");
    //List<wannagoDto> wannagolist = (List<wannagoDto>)request.getAttribute("wannagolist");
 %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- more -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<title>EAT PLACE</title>

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
 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="owlcarousel/owl.carousel.min.js"></script>

<!-- script for owl with modal -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.js"></script>

<!-- owl carousel css -->
<link rel="stylesheet" href="owlcarousel/owl.carousel.min.css">
<link rel="stylesheet" href="owlcarousel/owl.theme.default.min.css">

<!-- owl carousel with modal -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- 카카오 지도 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b79e9996c3bab29b8e5285b04135813&libraries=services"></script>

<!-- font -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>
<style type="text/css">
@charset "UTF-8";
/* CSS Document */

header {
	padding: 0.8em;
	color: #FFF;
	font-size: 150%;
	text-align: center;
	background: white;
}
header,
.back {
	/* margin-bottom: 6rem; */
}
#contents {
	max-width: 780px;
	margin: 0 auto;
	text-align: center;
	/* padding-bottom: 50px; */
}

.ad {
	text-align: center;
	border: 1px dotted #ccc;
	max-width: 780px;
	margin: 0 auto/*  6rem */;
}

a.btn {
	background: white;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 108%;
	padding: .6em 1em;
	transition: 800ms ease all;
	outline: none;
}
a.btn:hover {
	background: #fff;
	color: white;
}
a.btn:before, a.btn::after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: white;
	transition: 400ms ease all;
}
a.btn::after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}
a.btn:hover:before, a.btn:hover::after {
	width: 100%;
	transition: 800ms ease all;
}


.js-load {
	display: none;
}
.js-load.active {
	display: block;
}
.is_comp.js-load:after {
	display: none;
}
.btn-wrap, .lists, .main {
	display: block;
}
.main {
	max-width: 640px;
	margin: 0 auto;
}
.lists {
	margin-bottom: 4rem;
}
.lists__item {
	padding: 20px;
	background: white;
	font-style: "color : black";
}
.lists__item:nth-child(2n) {
	background: white;
	color: black;
	font-style: "color : black";
}
.btn-wrap {
	text-align: center;
}
.button {
	display: inline-block;
	width: 200px;
	height: 54px;
	text-align: center;
	text-decoration: none;
	line-height: 54px;
	outline: none;
	position: relative;
	z-index: 2;
	background-color: #c53211;
	border: 2px solid #c53211;
	color: #fff;
	line-height: 50px;
	margin-bottom: 4rem;
}
.button:hover {
	background-color: #fff;
	border-color: #c53211;
	color: #c53211;
}
.button::before,
.button::after {
	position: absolute;
	z-index: -1;
	display: block;
	content: '';top: 0;
	width: 50%;
	height: 100%;
	background-color: #c53211;
}
.button,
.button::before,
.button::after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.button::before {
	right: 0;
}
.button::after {
	left: 0;
}
.button:hover::before,
.button:hover::after {
	width: 0;
	background-color: #c53211;
}


footer {
	padding: 1rem;
	font-size: 83%;
	text-align: center;
}
footer a {
	color: #666;
	font-weight: bold;
}
footer a:hover {
	color: #c53211;
	text-decoration: underline;
}
</style>

<style type="text/css">

* { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; }
 .between {
        border: 1px #4f4f4f;
        margin-left:10px;
        margin-right:10px;
    }
.news-events-page--list-page {
  text-align: center;
}

@media (min-width: 768px) {
  .modal-dialog {
    width: 980px;
  }
}
.customNavigation a {
  position: absolute;
  top: 35;
  left: 0;
  right: auto;
  padding: 30px;
  float: left;
  font-size: 3em;
  cursor: pointer;
  z-index: 1;
}
.customNavigation a.next {
  left: auto;
  right: 0;
}
@media (min-width: 320px) {
  .customNavigation a {
    top: 20%;
  }
}
@media (min-width: 480px) {
  .customNavigation a {
    top: 25%;
  }
}
@media (min-width: 768px) {
  .customNavigation a {
    top: 30%;
  }
}
@media (min-width: 992px) {
  .customNavigation a {
    top: 35%;
  }
}

#sync1 .item {

  margin: 5px;
  color: #FFF;
  border-radius: 3px;
  text-align: center;
}

#sync2 .owl-item .item {
  background: #333;
  margin: 5px;
  color: #FFF;
  border-radius: 3px;
  text-align: center;
  cursor: pointer;
}
#sync2 .owl-item .item img {
  opacity: 0.5;
}
#sync2 .owl-item.synced .item img {
  opacity: 1;
}

.modal.in .modal-dialog {
  border-radius: 0px;
}
.modal.in .modal-dialog .modal-content {
  border-radius: 0px;
}
.modal.in .modal-dialog .modal-content .modal-header {
  border-radius: 0px;
  text-align: center;
}
.navbar.navbar-default {
    background-color: #99ccff;
    border: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
.navbar.navbar-default .navbar-collapse {
    border: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}



#col-md-4 {

	max-height: 20vw; 
 
    display: inline-block; 
}

/* 영훈 */
#mainImage {

	max-height: 400px; 
	width: auto;
 
    display: inline-block; 
}

<!-- 최근 & 가고싶다 모달 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/lib/w3.css">
	<style>
	.city {display:none}
	.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.w3-animate-zoom{
	position: relative;
	top: -45px;
	right: -600px;
	width: 380px;
	height: 500px;
}
 .w3-padding{
 position: absolute;
 top:500px;
 width: 380px;
 
 
 }
 <!--SEARCH-->
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
  EatMemberDto user = (EatMemberDto)session.getAttribute("login");
  
  boolean loginok = false;
	if(user != null){
		loginok = true;
	}
	
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
<!-- 검색창 스타일 -->
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





</style>
</head>
<body>

<!-- 가고싶어 제발 -->
<div class="w3-container ">
<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
 	<div>
  		<ul class="pagination w3-white w3-border-bottom" style="margin-top:0px; padding-top:0px; border-top:0px; height:60px; width:100%; position:relative; list-style:none;">
  		<li style="position:relative; height:100%; width:50%; float:left; text-align: center;"><a href="#" class="tablink" onclick="openCity(event, 'London')" style="width: 100%; height: 100%; padding-top:15px; color: black;">최근 본 맛집</a></li>
  		<li style="position:relative; height:100%; width:50%; float:left; text-align: center;"><a href="#" class="tablink" onclick="openCity(event, 'Paris')" style="width: 100%; height: 100%; padding-top:15px; color: black;">가고싶다</a></li>
  		</ul>
 	</div> 
	<!-- 최근 본 맛집 -->

  <div id="London" class="w3-container city" style="overflow-y: scroll; height: 440px;">
  <form action="" name="frmForm5" id="_frmForm5"  method="post">
  	 <div style="display:inline-block; position:absolute; top:4em; right: 10px;">
  		<a href="#" id="clear" style="text-align: right;"><font style="color: #BDBDBD">x clear all</font></a>
  	</div> 
 </form>
<%
 	
     List<RegiDto> RankList = (List<RegiDto>)request.getAttribute("RankList");
	System.out.println("testRankList = " + RankList);

%>
<%
for (int i=1;i<cookies.length;i++){ 
	if(cookies[i].getName().contains("rc")){
		
	}else{
		String cn = URLDecoder.decode(cookies[i].getName(), "utf-8");
		String cookieAdd = "";
		double cookieRating = 0;
		String cookiePic = "";
		int cookieLike = 0;
		String cookiename = "";
		for(int j =0; j < RankList.size(); j++){
	
			if( RankList.get(j).getSeq() == Integer.parseInt(cookies[i].getValue())){
				System.out.println(RankList.get(j).getRs_address1());
				cookieAdd = RankList.get(j).getRs_address1();
				cookieRating = RankList.get(j).getRs_rating();
				cookiePic = RankList.get(j).getRs_picture();
				cookieLike = RankList.get(j).getSeq();
				cookiename = RankList.get(j).getRs_name();
				break;
			}
	}

%>
 

<div style="width:350px; height:100px; background-color:; box-sizing: border-box; border: 1 solid;">
	
	<div>

		<!-- 사진 -->
		<div style="display:inline-block; position:relative; width: 80px; height: 90px; margin-top:3px; margin-left:10px;">
			<a><img alt="" src="<%=cookiePic%> " style="width: 80px; height: 90px;"></a>
		</div>
	
		<!-- 이름 -->
		<div style="display:inline-block; position:relative; width: 30%; height: 45%; top:-20px; left:20px;">
			<a href="rsdetail.do?seq=<%=cookies[i].getValue()%>" style="text-align: center; color: black;"><b><font style="font-size: medium;text-align:center;"><%=cn%></font></b></a>
		</div>
		<!-- 주소 -->
		<div style="display:inline-block; position:relative; width: 55%; height: 30%; top:-55px; left:120px;">
			<a><font style="font-size: x-small; color: black; text-decoration: none;"><%=cookieAdd %></font></a>
		</div>

		<!-- 평점 --> 
		<div style="display:inline-block;  position:relative; width: 10%; height: 20%; top:-88px; right:-20px;">
			<a><font style="color:#c53211 "><%=cookieRating %></font></a>
		</div>
		<!-- 즐찾 -->
		<div style="display:inline-block;  position:relative; width: 15%; height: 10%; top:-60px; right: -40px;">
			<a href="wannago.do?rs_seq=<%=cookieLike %>&rs_name=<%=cookiename%>"><img id="like_btn" src="img/button/likeIcon.png" style="width: 45px; height: 45px;" ></a>
		</div>

 	</div>
</div>
<%-- 
<table border="1" width="250">

<tr>

<!-- 표현식 : 변수의 값 출력, 메소드의 결과값 출력, 연산 -->

JSP주석 소스보기할때 보여지지 않음

<td><%=i%></td>
<td><a href="rsdetail.do?seq=<%=cookies[i].getValue()%>"><%=cn%></a></td>



</table> --%>
<%} %>
  <%} %>
  </div>
	<!-- 가고 싶다 -->
  <div id="Paris" class="w3-container city" style="overflow-y: scroll; height: 460px;">
   
		
<c:if test="${empty wannagolist }">
		가고싶은 가게를 추가해주세요~
</c:if>				
					
<%
List<wannagoDto> wannagolist = (List<wannagoDto>)request.getAttribute("wannagolist");
List<RegiDto> RankList2 = (List<RegiDto>)request.getAttribute("RankList");

if(wannagolist!=null){
for(int i=0; i<wannagolist.size(); i++){
	String wannaname = "";
	double wannaRating = 0;
	String wannaPic = "";
	String wannacategory = "";
	String wannaaddress = "";
	int wannalike = 0;
	
	for(int j=0; j<RankList2.size(); j++){
		if(RankList2.get(j).getSeq() == wannagolist.get(i).getRs_seq()){
			
			wannaname = RankList2.get(j).getRs_name();
			wannaRating = RankList2.get(j).getRs_rating();
			wannaPic = RankList2.get(j).getRs_picture();
			wannacategory = RankList2.get(j).getRs_category();
			wannaaddress = RankList2.get(j).getRs_address1();
			
			wannalike = RankList2.get(j).getSeq();
			
			break;
		}
		%>	
	<% }%>
	


<div style="width:350px; height:100px; background-color:; box-sizing: border-box; border: 1 solid; ">
	<div>
		<!-- 사진 -->
		<div style="display:inline-block; position:relative; width: 80px; height: 90px; margin-top:3px; margin-left:10px;">
			<a><img alt="" src="<%=wannaPic%> " style="width: 80px; height: 90px;"></a>
		</div>
	
		<!-- 이름 -->
		<div style="display:inline-block; position:relative; width: 30%; height: 45%; top:-20px; left:20px;">
			<a href="rsdetail.do?seq=<%=wannalike%>" style="text-align: center;"><b><font style="font-size: medium;text-align:center;"><%=wannaname%></font></b></a>
		</div>
		<!-- 주소 -->
		<div style="display:inline-block; position:relative; width: 55%; height: 30%; top:-55px; left:120px;">
			<a><font style="font-size: x-small;"><%=wannaaddress %></font></a>
		</div>


		<!-- 평점 --> 
		<div style="display:inline-block;  position:relative; width: 10%; height: 20%; top:-88px; right:-20px;">
			<a><font style="color:#c53211 "><%=wannaRating %></font></a>
		</div>
		<!-- 즐찾 -->
		<div style="display:inline-block;  position:relative; width: 15%; height: 10%; top:-60px; right: -40px;">
			<a href="wannago.do?rs_seq=<%=wannalike %>&rs_name=<%=wannaname%>"><img id="like_btn" src="img/button/likeIcon.png" style="width: 45px; height: 45px;" ></a>
		</div>

 	</div>
	
</div>

	        	
					<% }%>
						        	<% }%>
  </div>
  
  
  <div class="w3-container w3-light-grey w3-padding">
  <%if(user == null){%>
		<!-- <a class=" openMask" href="#">로그인</a> -->
		<button onclick="document.getElementById('id02').style.display='block'"  class="w3-btn w3-round-large w3-white ">Login</button>
  <%} else{%>
		<a class="" href="#" ><%=user.getId()%>님</a>
		<button onclick="document.getElementById('id01').style.display='none'"  class="w3-btn w3-round-large w3-white ">
			<a id="_btnLogout" class="" href="logout.do" > 로그아웃 </a>
		</button>
		<!-- <a id="_btnLogout" class="" href="logout.do" > 로그아웃 </a> -->
  <%} %>
    <button class="w3-btn w3-right w3-round-large w3-white" onclick="document.getElementById('id01').style.display='none'">Close</button>
  </div>
 </div>
</div>
</div>
<!-- 로그인 모달 -->
<div id="id02" class="w3-modal" style="z-index: 120;">
  <span onclick="document.getElementById('id02').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-hor-8 w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-card-9 w3-animate-zoom" style="right:-10px; width:400px; height: 400px;">
    <div class="w3-center"><br>
    	<h1>Login</h1>
    </div>
    <div class="w3-container">
      <div class="w3-section">
      	<form action="loginAf.do" name="frmForm" id="_frmForm"  method="post">
	        <label><b>Id</b></label><br>
	        <input class="w3-input w3-border w3-margin-bottom" id="_userid" name="_userid" required="required" type="text" placeholder="Id"><br>
	        <label><b>Password</b></label><br>
	        <input class="w3-input w3-border w3-margin-bottom" type="password" id="_pwd" name="_pwd" required="required" placeholder="Password">
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="w3-btn w3-btn-round w3-white" id="_btnLogin" style="width:70%; text-align: center;">로그인</button><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('id03').style.display='block'" class="w3-btn w3-btn-round w3-white" style="width:70%; text-align: center;">회원가입</button>
       	</form>
      </div>
    </div>
    <div class="w3-container w3-border-top w3-padding-hor-16 w3-light-grey">
      <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-btn w3-round-large w3-white" style="float: right;">Cancel</button>
    </div>
  </div>
</div>


<!-- 회원가입 모달 -->
<div id="id03" class="w3-modal" style="z-index: 130;">
  <span onclick="document.getElementById('id03').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-hor-8 w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-card-9 w3-animate-zoom" style="right:-10px; width:600px; height: 680px;">
  
    <div class="w3-center"><br>
    	<h1>회원가입</h1>
    </div>
    <div class="w3-container">
      <div class="w3-section">
      	<form action="" method="post" id="_frmForm2" name="frmForm2">
      		<div class="form-group">
                <label class="col-lg-2 control-label">아이디</label>
                <div class="col-lg-10">
					<input type="text" name="sid" id="_id2" class="form-control" size="40" placeholder="id"><br>
					<a href="#none" id="_btnGetId" class="form-control" title="회원가입" style="height: 30px; text-align: center;">아이디체크</a>
					<div id="_rgetid"></div>
					<input type="text" name="id" id="_userid2" class="form-control" size="40" data-msg="아이디를 " readonly="readonly">
                </div>
            </div>
            <div class="form-group">
            	<label class="col-lg-2 control-label">패스워드</label>
                <div class="col-lg-10">
              	  	<input type="password" name="pwd" id="_pwd2" class="form-control" size="40" placeholder="password" data-msg="패스워드를 ">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">이름</label>
                <div class="col-lg-10">
               		<input type="text" name="name" id="_name" class="form-control onlyHangul" size="40" placeholder="name" data-msg="성함을 ">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">이메일</label>
                <div class="col-lg-10">
                	<input type="text" name="email" id="_email" size="40" class="form-control" placeholder="e-mail" data-msg="이메일을 ">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">별명</label>
                <div class="col-lg-10">
                	<input type="text" name="snickname" id="_nickname" class="form-control" placeholder="nickname" size="40">
                	<a href="#none" id="_btnGetNickName" class="form-control" title="회원가입" style="height: 30px; text-align: center;">닉네임체크</a>
					<div id="_rgetnickname"></div>
					<input type="text" name="nickname" id="_usernickname" class="form-control" size="40" data-msg="별명을 " readonly="readonly"> 
                </div>

            </div>
       	</form>
      </div>
    </div>
    <div class="w3-container w3-border-top w3-padding-hor-16 w3-light-grey">
      <button style="float: left;" id="_btnRegi" type="button" onclick="document.getElementById('id02').style.display='block'"  class="w3-btn w3-round-large w3-white ">회원가입</button>
      <button style="float: right;" onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-btn w3-round-large w3-white">Cancel</button>      
    </div>
  </div>
</div>

<script>
document.getElementsByClassName("tablink")[0].click();

function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-light-grey");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.classList.add("w3-light-grey");
}

function alarm() {
	alert('로그인 하시거나 즐겨찾기 추가해 주세요');
}

</script>
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

String s_keyword = keyword + category;

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
		style="background-color: #c53211; padding-bottom: 10px; margin-top:-58px">
		<div class="container" style="float: left; width: 15%">
			<a class="navbar-brand" href="home.do">EAT PLACE</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		
		<div style="float: left; width: 60%">
		  <!-- 전체 검색 -->
  <fieldset id="search" class="main-search ng-scope" ng-controller="mp20_main_search_suggest_controller" style="z-index: 110;border: 0;">
      
		<form action="" id="main-search" name="main-search" method="get" > 
	 			 <div class="in-line" style="margin-left: auto; margin-right: auto; ">
	 			 <span>검색 :</span>
			     <strong>
			     <input type="text" class="seaechAll" onkeypress="if(event.keyCode==13) {search();}" onclick="displayVsearch()"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" autocomplete="off" style="color: #ffffff; margin-left: 40px;">
			     </strong>
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
		
		<div class="container" style="float: left; width: 25%; margin-right:-80px">
			<div class="collapse navbar-collapse" id="navbarResponsive">				
				<ul class="navbar-nav ml-auto">
					
					<li class="nav-item"><a class="nav-link"
						href="restaurntsList.do"><strong
							style="color: white; margin-left: 20px">맛집 리스트</strong></a></li>
					<!-- <li class="nav-item"><a class="nav-link"
						href="restaurantsInsert.do"><strong
							style="color: white; margin-left: 20px">맛집 추가</strong></a></li> -->
					<li class="nav-item" style="margin-left: 20px">
						<a onclick="document.getElementById('id01').style.display='block'" class="w3-btn">
						<img alt=""	src="img/main/man-user.png">
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>


<%
List<ReviewDto> rvlist = (List<ReviewDto>)request.getAttribute("reviewlist");
List<String> imagelist = (List<String>) request.getAttribute("imagelist");

%>


<!--  -->

<div class="modal fade" id="carouselModal" tabindex="-1" role="dialog" aria-labelledby="carouselModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <div class="row">
        	<div class="col-md-1">

        <h4 class="modal-title" id="carouselModalLabel">${rs.rs_name }</h4>
        	</div>
        </div>
      </div>
      <div class="modal-body">
<div class="customNavigation">
  <input type="hidden" name="trigger" id="trigger">
  <a class="prev" id="_prev" style="z-index: 110;"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
  <a class="next" id="_next" ><i class="fa fa-angle-right" aria-hidden="true"></i></a>
</div>
	<div class="row">
	<div class=" col-md-8">
	    <div id="sync1" class="owl-carousel"><!-- 이게 큰거 -->
        	<div class="item"><img id="mainImage" src="" class="img-responsive"></div>
        </div>
     </div>   
   		<div class="col-md-4">
   		<div class="row">
   			 <div class="col-md-8"> 
   				<p id="p_id">${review.id }</p>	
   		 		<div class="row">
   					<div class="col-md-1">
   						<img src="img/button/review.png">
   					</div>
   					<div class="col-md-1">
   						<p id="p_rc">0</p>
   					</div> 
   					<div class="col-md-1">
   						<img alt="" src="img/button/fav.png">
   					</div>
    				<div class="col-md-1">
   						<p id="p_lk">0</p>
   					</div> 

   				</div>
   		 	</div> 
   		 	<div class="col-md-4">
   					<img id = "p_ratingP" alt="" src="./img/like/3-1.png" style="width: 45px; height: auto" msg="3" title="3점" >
   			</div>
  	 	</div>
   	<div style="height: 400px;overflow-y: auto;">
   				<p id="pause" ></p>
   			</div>
   	<!-- 
   	   				 -->
   	
   </div>
   </div>
	<div>  
	
	
	
	
	</div>
       <div id="sync2" class="owl-carousel thumbnails-wrap" style=""> <!-- 이게 아래에 있는 썸네일 -->
        		 <%
        		String str = "?fit=around|148:152&crop=148:152;*,*&output-format=jpg&output-quality=80";
        		
        			
        			for (int i=0;i<imagelist.size();i++){
        				if(imagelist.get(i).contains("https://")){
        					%>
        					<div class="item"><img src="<%=imagelist.get(i) + str%>" class="img-responsive"></div>
        					<%
        				}else{
        					%>
        			          <div class="item"><img src="/image/<%=imagelist.get(i)%>" class="img-responsive"></div>
        			          <%
        				}
        			
        			}
        		
		
          %>  
          
        </div>     
      </div>
      
    </div>
  </div>
</div>


<%
String mstr = "?fit=around|254:300&crop=254:300;*,*&output-format=jpg&output-quality=80";
if(imagelist==null||imagelist.size()<3){
	%>
	이미지가 등록된 리뷰가 없다..고 띄워야 함.
	<%
}else{
	%>
	<br>
	<br>
	<br>
	<div class="owl-carousel123 owl-theme" style="margin-top: -80px" >
<%
for(int i=0;i<imagelist.size();i++){
	if(imagelist.get(i).contains("https://")){
%>
	<div class="item" id="owlImages" style="margin-right: 5px;">
	<a href="#" data-toggle="modal" data-target="#carouselModal">
	<img src="<%=imagelist.get(i)+mstr%>" style="height: 300px; margin-right: 3px" onclick="onefunc()" >
	</a>
	</div>
<%
	}else{
		%>
	 <div class="item" id="owlImages" style="margin-right: 5px">
	 <a href="#" data-toggle="modal" data-target="#carouselModal">
	 <img src="\image\<%=imagelist.get(i)%>" style="height: 300px; margin-right: 3px" onclick="onefunc()">
	 </a>
	 </div>
		<%
	}
}
%>
</div>

	<%
}
%>

<script type="text/javascript">
//plugin call
$(document).ready(function(){
$('.owl-carousel123').owlCarousel({
	
    autoWidth:true,
	responsive : {
		0 : {
			items : 1
		},
		600 : {
			items : 3
		},
		1000 : {
			items : 5
		}
	}
})
});

function onefunc() {
	$("#sync2 .owl-wrapper *").remove();
	 <%
	for (int i=0;i<imagelist.size();i++){
		if(imagelist.get(i).contains("https://")){
			%>
			
			$("#sync2 .owl-wrapper").append(
					$('<div>').attr('class','owl-item').attr("style","width: 119px;").append(
					    $('<div>').attr('class','item synced').append(
					            $('<img>').attr('src','<%=imagelist.get(i) + str%>').attr('class','img-responsive').append(
					            		
				              ))));
			<%
		}else{
			%>
			$("#sync2 .owl-wrapper").append(
					$('<div>').attr('class','owl-item').attr("style","width: 119px;").append(
					    $('<div>').attr('class','item').append(
					            $('<img>').attr('src','/image/<%=imagelist.get(i) %>').attr('class','img-responsive').append(
					            	
				              ))));
	          <%
		}
	
	}
		

 	%>  
	
	
}

</script>


 <br>
 <br>
 <%
 /* wannagolist 확인 작업 */
 boolean wannago = false;

 int rsseq = rvlist.get(0).getRs_seq();

 for(int i =0; i<wannagolist.size();i++){
	
	 if(rsseq == wannagolist.get(i).getRs_seq()){
		 wannago = true;
		 break;
	 }
 }
 
 %>
<div class="column-wrapper">
		<div class="column-contents">
			<div class="inner">
				<!-- 레스토랑 상세 -->
				<section class="restaurant-detail"> 
				
				<header>
				
				
				<div style="float: left; width: 10%">
					<p></p>
				</div>
				<div style="float: left; width: 60%" >
					<div>
					
						<span class="title">
					<div class="col-md-8" style="text-align: left; padding-left: 0px">
							<font size="26" color="#000000" id="rs_seq" value="${rs.seq }">${rs.rs_name }</font>
					</div>		
							<div class="col-md-4">  
								<img id="review_btn" class="review_writing_button" onclick="WriteReview('${rs.seq}','${login.id }');" src="img/button/reviewIcon.png">
								<%if(wannago){%>
									<a href="wannago.do?rs_seq=${rs.seq}&rs_name=${rs.rs_name}"><img id="like_btn_delete" src="img/button/likeIconR.png" ></a>
								<%}else{%>
									<img id="like_btn" onclick="like()" src="img/button/likeIcon.png" >
								<%}
								
								%>
							</div>
						</span>
						
					
						
					</div>
					<script type="text/javascript">
						/* 가고싶다 스크립트  */
						
						function like() {
							
							<%-- var isS = '<%=user%>'; --%>
							 if (<%=loginok%>) {
								
								//location.href = "insertLike.do?rs_seq=${rs.seq }&rs_name=${rs.rs_name}&id=${login.id}";
								location.href = "insertLike.do?rs_seq="+${rs.seq }+"&rs_name="+'${rs.rs_name}'+"&id="+'${login.id}';
							
							}else{
								alert("로그인 해주십시오.");
							}
							
						}
						
						
						
					</script>
			
					<div class="status branch_none" style="text-align: left;">
						 
						<span class="cnt hit" style="color: gray;">
							<img src="img/button/readcount.png">
						<!-- 조회수 --> ${rs.rs_readcount } 
						</span> 
						<span class="cnt review" style="color: gray;">
							<img src="img/button/review.png">							<span>
						<!-- 리뷰수 -->${reviewcount }
							</span>
						</span> 
						<span class="cnt favorite" style="color: gray;">
							<img src="img/button/fav.png">
						<!-- 즐겨찾기 수 -->${likescount }
						</span>
						<br>
						<img src="img/button/hr.png" style="margin-right: 400px; width: 900px;">
						
					</div>

                
                <table class="info no_menu" style="width: 50%">
						

						<tbody style="text-align: left">
							<tr style="text-align: left; color:#4f4f4f ">
								<th style="width: 30%">주소</th>
								<td>${rs.rs_address1 }<%--  ${rs.rs_address2 } --%></td>
							</tr>

							<tr class="only-desktop" style="text-align: left; color:#4f4f4f">
								<th>전화번호</th>
								<td>${rs2.rs_phone }</td>
							</tr>

							<tr style="text-align: left; color:#4f4f4f">
								<th style="width: 30%">음식 종류</th>
								<td><span>${rs.rs_category }</span></td>
							</tr>

							<tr style="text-align: left; color:#4f4f4f">
								<th style="width: 30%">가격대</th>
								<td>
									${rs2.rs_price }
								</td>
							</tr>

							<tr style="text-align: left; color:#4f4f4f">
								<th style="width: 30%">주차</th>
								<td>
								<c:if test="${empty rs2.rs_parking}">
								정보 없음
								</c:if>
								<c:if test="${not empty rs2.rs_parking}">
								${rs2.rs_parking }
								</c:if>
								
								</td>
							</tr>

							<tr style="text-align: left; color:#4f4f4f">
								<th style="vertical-align: top; width: 30%">영업시간</th>
								<td>
									${rs2.rs_time }
								</td>
							</tr>
						
						

						</tbody>
					</table>
	
			<%-- 	<button class="review_writing_button" onclick="WriteReview('${rs.seq}');">리뷰쓰기</button> --%>
					
				</div>
				<div style="float: left;width: 10%">
					<p>  </p>
				</div>
				<div id="map" style="width: 400px; height: 450px;"></div>
				
				
				<img src="img/button/hr.png" style="margin-right: 350px; width: 920px;">
				</header>
				</section>
				
		<!-- 리뷰 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~REVIEW~~~~~~~~~~~~~~~~~~~~~~~~-->
		 <script type="text/javascript">
//JavaScript Document

  $(window).on('load', function () {
  	load('#js-load', '2');
  	$("#js-btn-wrap .button").on("click", function () {
  		load('#js-load', '2', '#js-btn-wrap');
  	})
  });

  function load(id, cnt, btn) {
  	var girls_list = id + " .js-load:not(.active)";
  	var girls_length = $(girls_list).length;
  	var girls_total_cnt;
  	if (cnt < girls_length) {
  		girls_total_cnt = cnt;
  	} else {
  		girls_total_cnt = girls_length;
  		$('.button').hide()
  	}
  	$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
  }
  </script>
  <!-- demo-more-btn-js-load --> 
  <!-- <ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1534417142445600"
     data-ad-slot="9710655373"
     data-ad-format="auto"></ins>  -->
 <!--  <script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>  -->
<!-- </div> -->
<div class="row">
<div id="contents" class="col-md-8">
  <div id="js-load" class="main">
    <ul class="lists">
    <%
    EatReviewDao eatReviewDao = EatReviewDaoImpl.getInstance();
    List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("reviewlist");
    int Good=0;
    int soso=0;
    int notGood=0;
    int totalCount = 0;
    String nickName = "";
    String fileName[] = new String[0];
    String id = "";
    
    for(int i =0;i<list.size();i++){
  	  
  	  switch(list.get(i).getRs_rating()){
  	  
  	  case 1:
  		  notGood = notGood+1; break;
  	  case 3:
  		  soso = soso+1; break; 
  	  case 5:
  		  Good = Good+1; break;
  	  }
  	  
    }totalCount = Good+soso+notGood;
    
		for(int i = 0; i < list.size(); i ++){
	
		nickName = eatReviewDao.getNickName(list.get(i).getId());
		if(nickName != "" || !nickName.isEmpty()){
			id = nickName;	
		}else{
		 id = list.get(i).getId();
		 }
		String content = list.get(i).getRs_content();
		
		%>
		<li class="lists__item js-load">
			<table style="width: 171%;">
				<tr>
					<td style="width: 15%; padding-top: 1px; vertical-align: top;"> <%=id %></td>
					<td style="width: 70%; padding-top: 1px; vertical-align: top;"> <%=content %></td>
					<!-- 좋아요 별로 -->
					<!-- <td width="30" style="border: none"> -->
					
					<td style="width: 15%; padding-top: 1px; vertical-align: top;">
					<%switch(list.get(i).getRs_rating()){
					case 1:
					%>						
					<img alt="" src="./img/like/1-1.png" style="width: 60px;" id="p1" msg="1" title="1점" >
					<%break;
					case 3: %>
					<img alt="" src="./img/like/3-1.png" style="width: 60px;" id="p3" msg="3" title="3점" >
					<%break;
					case 5: %>
					<img alt="" src="./img/like/5-2.png" style="width: 60px;" id="p5" msg="5" title="5점" >
					<%break;
					default: %>
					<img alt="" src="./img/like/3-1.png" style="width: 60px;" id="p3" msg="3" title="3점" >
					<%} %>
					</td>
					<%
					List<fileDto> f_list = eatReviewDao.getRv_Image(list.get(i).getSeq());
					%>					
				</tr>
				<tr>
				<td style="width: 15%; padding-top: 1px; vertical-align: top;"></td>
				<!-- img td -->
				<td id="review_image" style="width: 100%; padding-top: 1px; float:left; vertical-align: top;">
				<%		
		//List<fileDto> f_list = eatReviewDao.getRv_Image(list.get(i).getSeq());
		//List<String> f_list = (List<String>) request.getAttribute("getImg");
		
		if(f_list != null){
			System.out.println("not null");
			
				if(f_list.size()<4){ //더보기 안붙음.
					fileName = new String[f_list.size()];
					for(int a=0 ; a<f_list.size();a++){
					fileName[a] = f_list.get(a).getFile_name();
					//fileName[0] = f_list.get(a);
					System.out.println("less than 4 f_list.size(): "+f_list.size());
					//System.out.println("fileName has just 1:"+fileName[0]);
					if(fileName[a].contains("https://")){
						%>
						<a href="#" data-toggle="modal" data-target="#carouselModal">
						<img alt="" src="<%=fileName[a]%>" style="float:left; width: 120px; height:120px; margin-left: 10px;"<%--  onclick="reviewDetail(<%=list.get(i).getSeq()%>)" --%>>
						</a>
						<% 
					}else{//does not contain 'https://'
					%>
					<a href="#" data-toggle="modal" data-target="#carouselModal">
					<img alt="" src="/image/<%=fileName[a] %>" style="float:left; width: 120px; height:120px; margin-left: 10px;" <%-- onclick="reviewDetail(<%=list.get(i).getSeq()%>)" --%>>
					</a>
					
					<%}
				 }
				}
				else{ //f_list.size()>4 일때 더보기가 추가하여 붙음.
					fileName = new String[4];
					int remain_picture_count = f_list.size() - 4; 
					for(int a = 0 ; a<4 ; a++){
					fileName[a] = f_list.get(a).getFile_name();					
					System.out.println("more than 4 f_list.size(): "+f_list.size());
					
					if(fileName[a].contains("https://")){
						if(a==3){//마지막 부분에 이미지 위 글자 새김.
					%>
					<!-- <div style="position: relative;"> -->
					<a href="#" data-toggle="modal" data-target="#carouselModal">
					<img alt="" src="<%=fileName[a] %>" style="float:left; width: 120px; height:120px; margin-left: 10px;">
					</a>
					<span style="position: static; top: auto; left: auto; color: orange;"><h1>+<%=remain_picture_count %></h1></span>
					<!-- </div> -->
					<%
					}else{//마지막 이전의 그림들이 출력되는 곳..
					%>
					<a href="#" data-toggle="modal" data-target="#carouselModal">
					<img alt="" src="<%=fileName[a] %>" style="float:left; width: 120px; height:120px; margin-left: 10px;">
					</a>
					<% }
					}
						else{//fileName이 http://가 포함되지 않은 경우..
						if(a==3){%>
							<!-- <div style="position: relative;"> -->
							<a href="#" data-toggle="modal" data-target="#carouselModal">
							<img alt="" src="/image/<%=fileName[a] %>" style="float:left; width: 120px; height:120px; margin-left: 10px;">
							</a>
							<span style="position: static; top: auto; left: auto; color: orange;"><h1>+<%=remain_picture_count %></h1></span>
							<!-- </div> -->
							
						<%}else{%>
						<a href="#" data-toggle="modal" data-target="#carouselModal">
						<img alt="" src="/image/<%=fileName[a] %>" style="float:left; width: 120px; height:120px; margin-left: 10px;">
						</a>
						
					 <%
					}
				}
			}
		}
	
		}else if(f_list == null){
			System.out.println("null");
		}		
		%>	
				</td>
				<td style="width: 15%; padding-top: 1px; vertical-align: top;">
				</td>
				
				</tr>
				 
				<tr style="border: none">
				<td colspan="3" width="100" style="border-bottom: 1px solid #c8c8c8; padding-top: 5px;"></td>
				</tr>
				
			</table>
			
		</li>
		<%
		}
	%>   
    </ul>
   
   
    <div id="js-btn-wrap" class="btn-wrap" style="float: right;"><a href="javascript:;" class="button">더보기</a> </div>
  </div>
  </div>

  
</div>       
    
       <br><br>
     
         
         <script type="text/javascript">
         
         $("#review_image a img").click(function(){
        	 $("#sync2 .owl-wrapper *").remove();
        		
        	 var img=$(this).attr('src');
        	 var rseq = $("#rs_seq").attr("value");
        	 
        	 if(img.indexOf("https://") !=-1){
					var	filename=img;
				}else if(img.indexOf("https://")==-1){
					var filename=img.substring(7);
				} 
        	 
        	 $('#mainImage').attr('src',img);
        	 
        	 var revData2 = {
						'filename':filename,
						'rseq': rseq
				};
        	 $.ajax({
					url:"getRPdetail.do",
					datatype:'json',
					data:revData2,
					type:'post',
					async:true,
					success:function(data){
						//alert("success");
						//alert(data.review.rs_content);
						$("#pause").html(data.review.rs_content);
						$("#p_id").html(data.review.id);
						var rating =data.review.rs_rating;
						if(rating===1){
							$("#p_ratingP").attr('src','./img/like/1-2.png');	
						}else if(rating===3){
							$("#p_ratingP").attr('src','./img/like/3-2.png');
						} else if(rating===5){
							$("#p_ratingP").attr('src','./img/like/5-2.png');
						}
						
						reviewDetail(data.review.seq); //reviewDetail에 리뷰 시퀀스 넣어줌
						
						 
						 
					},
					error:function(req, stu, err){
						alert("error");
						alert(stu + " " + err);
					}
				});
          	 $.ajax({
         		url: "getRPdetail3.do",
         	//	datatype:'json',
         		data: 'id='+$("#review_id").attr('value'),
         		type:'post',
         		async:true,
         		success:function(data){
         		//	alert("???");
         			$("#p_rc").html(data.likes.seq);
         			$("#p_lk").html(data.likes.rs_seq);
         		},
         		error:function(req, s,e){
         			alert(s+""+e);
         			
         		}
         	 }); 
        	 
				
		 });
       
		
         
 		function reviewDetail(seq) {
//      		alert("seq:"+seq);
      		
 			$.ajax({
 				url:"getReviewDetail.do",					
 				type:"POST",
 				data:"seq="+seq,
 				dataType:"json",
 				async:true,
 								
 				success:function(json){
 					//alert("getReviewDetail.do success");
					createImages(json.flist); //받아온 WildCard(rdto, flist)
					//customNavTest(json.flist);
 					
 				},
 				error:function(req, stu, err){
 					alert("error");
 					alert(stu + " " + err+""+req);					
 				}
 			});
 			
 		}
		
		function test(a) {
			//alert("테스트입니다."+a);
			$('#mainImage').attr('src',a);
		}
         
		function createImages(objImageInfo) { 
			var images = objImageInfo; 
			var strDOM = ''; 
			/* alert('createImages');
			alert(images.length);
			alert(images[0]); */
			customNavTest(images);
			var str = "?fit=around|148:152&crop=148:152;*,*&output-format=jpg&output-quality=80";
				for (var i = 0; i < images.length; i++) {
					$("#sync2 .owl-wrapper").append(
							$('<div>').attr('class','owl-item').attr("style","width: 119px;").append(
						    $('<div>').attr('class','item').append(
						    		
						            $('<img>').attr('onclick','test("'+images[i]+'")').attr('src',images[i]).attr('class','img-responsive').append(
						            		
						              ))));  
				}
				//alert(images.length);
				


			}	
		
		 function customNavTest(images) {
				var imglistTest = images;
				//for(i = 0 ; i<imglistTest.length ; i++){
				//console.log("imglistTest: "+imglistTest[i]);}
				$('#trigger').data('target',imglistTest);
				//return imglistTest;
			} 
 		
 		
         </script>
     
		
       <br><br>
          <!-- review_main end -->
<script type="text/javascript">


$(document).ready(function(){
	
	$("#header_frame").width($(window).width());
	$(window).resize(function(){
		$("#header_frame").width($(this).width());
	});
	

	 $("#sync2 div img").click(function(){
		 
		var img=$(this).attr('src');
		//var	filename=img.substring(7);
		
		if(img.indexOf("https://") !=-1){
			var filename=jQuery.trim(img.split( '?', 1 ));
			
		}else if(img.indexOf("https://")==-1){
			var filename=img.substring(7);
		} 
		
		
		//alert(filename);
		$('#mainImage').attr("src",img.split( '?', 1 ));
		//$('#mainImage').attr('src',this);
		//alert($("#pause").val());
		
		var revData = {
				'filename':filename,
				'rseq':$("#rs_seq").attr("value")
		};
		
		
		 $.ajax({
			url:"getRPdetail.do",
			datatype:'json',
			data:revData,
			type:'post',
			async:true,
			success:function(data){
			//	alert("success");
			//	alert(data.review.rs_rating);
				$("#pause").html(data.review.rs_content);
				$("#p_id").html(data.review.id);
				var rating =data.review.rs_rating;
				
				//$("#p_rating").attr('value',data.review.rs_rating);
				if(rating===1){
					$("#p_ratingP").attr('src','./img/like/1-2.png');	
				}else if(rating===3){
					$("#p_ratingP").attr('src','./img/like/3-2.png');
				} else if(rating===5){
					$("#p_ratingP").attr('src','./img/like/5-2.png');
				}     
			},
			error:function(req, stu, err){
				alert("error");
				alert(stu + " " + err);
			}
		});  
		
		 
		
	 }); 
	 
	 $("#owlImages a img").click(function(){
		 	$("#sync2 .owl-wrapper *").remove();
			var img=$(this).attr('src');
			//alert(img);
			//var	filename=img.substring(7);
			
			if(img.indexOf("https://") !=-1){
				var filename=jQuery.trim(img.split( '?', 1 ));
				
			}else if(img.indexOf("https://")==-1){
				var filename=img.substring(7);
			} 
			
			$('#mainImage').attr("src",img.split( '?', 1 ));
			
			var revData = {
					'filename':filename,
					'rseq':$("#rs_seq").attr("value")
			};
			
			//var test=$("#rs_seq").attr("value");
			//alert("success1");
 			 $.ajax({
				url:"getRPdetail.do",
				datatype:'json',
				data:revData,
				type:'post',
				async:true,
				success:function(data){
			//		alert("success");

			//		alert(data.review.rs_content);
					$("#pause").html(data.review.rs_content);
					$("#p_id").html(data.review.id);
					var rating =data.review.rs_rating;
					if(rating===1){
						$("#p_ratingP").attr('src','./img/like/1-2.png');	
					}else if(rating===3){
						$("#p_ratingP").attr('src','./img/like/3-2.png');
					} else if(rating===5){
						$("#p_ratingP").attr('src','./img/like/5-2.png');
					}
					<%-- createImages(<%=imagelist%>); --%>
				},
				error:function(req, stu, err){
					alert("error");
					alert(stu + " " + err);
				}
			});
			  
 			 $.ajax({
 				url:"getRPdetail2.do",
 				datatype:'json',
 				data:'rseq='+$("#rs_seq").attr("value"),
 				type:'post',
 				async:true,
 				success:function(data){ 		
 					 createImages(data.imagelist);
 				},
 				error:function(req, stu, err){
 					alert("error");
 					alert(stu + " " + err);
 				}
 			});
			 
	 });

});


$(document).ready(function() {
	 
	  var sync1 = $("#sync1");
	  var sync2 = $("#sync2");
	  
	 
	  sync1.owlCarousel({
	    singleItem : true,
	    slideSpeed : 1000,
	    pagination:false,
	    afterAction : syncPosition,
	    responsiveRefreshRate : 200,
	  });
	  
	   $(".next").click(function(){
		  
		   customNav("next");
		  
	   
	    	
	  }); 
	  $(".prev").click(function(){
		 
		  customNav("prev");
	  });
	 /*  $(".next").on("click", ".owl-item", function(e){
		    e.preventDefault();
		    var number = $(this).data("owlItem");
		    sync1.trigger("owl.goTo",number);
		  }); */
	 /*  function customNavTest(flist) {
		var imglistTest = new Array();
		imglistTest = flist;
		console.log("imglistTest: "+imglistTest);
		$('#trigger').data('target',imglistTest);
		//return imglistTest;
	}  */
	  
	  function customNav(go) {
			  
		var mainnum = $('#mainImage').attr("src");
		var imglist = new Array();
		var check = 0;
		
		var imagelist = new Array();
		//$('#trigger').data('target',imglistTest);
		imagelist = $("#trigger").data('target');
		for(var i =0; i<imagelist.length;i++){
		console.log("imagelist data target[] "+imagelist[i]);
			imglist.push(imagelist[i]);
		}
		//console.log('data(target): '+$("#trigger").data('target'));
		//레스토랑상단 이미지썸네일 next, prev
		
		for (var i = 0; i < imglist.length; i++) {
			
			if (mainnum == imglist[i]) {
				
				
				
				 if (go == "prev") {
					 check = i-1;
					 if (check <0) {
						return;
					}else{
						 //alert("prev 클릭");
						 
						 $('#mainImage').attr("src",imglist[check]);
						 
						 var filename=imglist[check];
						 var rseq=$("#rs_seq").attr("value");
			        	 
						 var revData = {
									'filename':filename,
									'rseq': rseq
							};
						 
			 			 $.ajax({
			 				url:"getRPdetail.do",
			 				datatype:'json',
			 				data:revData,
			 				type:'post',
			 				async:true,
			 				success:function(data){
			 			//		alert("success");

			 			//		alert(data.review.rs_content);
			 					$("#pause").html(data.review.rs_content);
			 					$("#p_id").html(data.review.id);
			 					var rating =data.review.rs_rating;
			 					if(rating===1){
			 						$("#p_ratingP").attr('src','./img/like/1-2.png');	
			 					}else if(rating===3){
			 						$("#p_ratingP").attr('src','./img/like/3-2.png');
			 					} else if(rating===5){
			 						$("#p_ratingP").attr('src','./img/like/5-2.png');
			 					}
			 				
			 				},
			 				error:function(req, stu, err){
			 					alert("error");
			 					alert(stu + " " + err);
			 				}
			 			});
					}
					 
					  
					  
				}else if(go=="next"){
					check = i+1;
					if (check >=imglist.length) {
						return;
					}else{
						//alert("next클릭");
						 $('#mainImage').attr("src",imglist[check]);
						 var filename=imglist[check];
						 var rseq=$("#rs_seq").attr("value");
			        	 
						 var revData = {
									'filename':filename,
									'rseq': rseq
							};
						 
			 			 $.ajax({
			 				url:"getRPdetail.do",
			 				datatype:'json',
			 				data:revData,
			 				type:'post',
			 				async:true,
			 				success:function(data){
			 			//		alert("success");

			 			//		alert(data.review.rs_content);
			 					$("#pause").html(data.review.rs_content);
			 					$("#p_id").html(data.review.id);
			 					var rating =data.review.rs_rating;
			 					if(rating===1){
			 						$("#p_ratingP").attr('src','./img/like/1-2.png');	
			 					}else if(rating===3){
			 						$("#p_ratingP").attr('src','./img/like/3-2.png');
			 					} else if(rating===5){
			 						$("#p_ratingP").attr('src','./img/like/5-2.png');
			 					}
			 				
			 				},
			 				error:function(req, stu, err){
			 					alert("error");
			 					alert(stu + " " + err);
			 				}
			 			});
					}
					
				}
				
			}
			
		}
		
		
		
		 
		  
	}
	  
	  /*sync1.owlCarousel({
		  nav: true,
		  navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
		});
 	  $(".owl-carousel").owlCarousel({
		    items: 1,
		    autoplay: true,
		    navigation: true,
		    navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
		});
	  */
	  sync2.owlCarousel({
	    items : 8,
	    itemsDesktop      : [1199,8],
	    itemsDesktopSmall     : [979,8],
	    itemsTablet       : [768,4],
	    itemsMobile       : [479,3],
	    pagination:false,
	    responsiveRefreshRate : 100,
	    afterInit : function(el){
	      el.find(".owl-item").eq(0).addClass("synced");
	    }
	  });
	 
	  function syncPosition(el){
	    var current = this.currentItem;
	    $("#sync2")
	      .find(".owl-item")
	      .removeClass("synced")
	      .eq(current)
	      .addClass("synced");
	    if($("#sync2").data("owlCarousel") !== undefined){
	      center(current)
	    }
	  }
	 
	  $("#sync2").on("click", ".owl-item", function(e){
	    e.preventDefault();
	    var number = $(this).data("owlItem");
	    sync1.trigger("owl.goTo",number);
	  });
	 
	  function center(number){
	    var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
	    var num = number;
	    var found = false;
	    for(var i in sync2visible){
	      if(num === sync2visible[i]){
	        var found = true;
	      }
	    }
	 
	    if(found===false){
	      if(num>sync2visible[sync2visible.length-1]){
	        sync2.trigger("owl.goTo", num - sync2visible.length+2)
	      }else{
	        if(num - 1 === -1){
	          num = 0;
	        }
	        sync2.trigger("owl.goTo", num);
	      }
	    } else if(num === sync2visible[sync2visible.length-1]){
	      sync2.trigger("owl.goTo", sync2visible[1])
	    } else if(num === sync2visible[0]){
	      sync2.trigger("owl.goTo", num-1)
	    }
	    
	  }
	  
	  $('.close').click(function(){
	    carousel.data('owlCarousel').jumpTo(1)
	  });
	 
	});
	
$(function(){
	$("#review_btn").mouseover(function(){
		$(this).attr('src','img/button/reviewIconR.png')	
	});
	$("#review_btn").mouseout(function(){
		$(this).attr('src','img/button/reviewIcon.png')	
	});
	$("#like_btn").mouseover(function(){
		$(this).attr('src','img/button/likeIconR.png')	
	});
	$("#like_btn").mouseout(function(){
		$(this).attr('src','img/button/likeIcon.png')	
	});
 });
 
function WriteReview(seq,id) {
	console.log(seq,id);
	if(id != null && id!=''){
	location.href='WriteReview.do?seq='+seq;
	}else{
		alert("로그인하여 주십시요.");
	}
	
}	
</script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
		map.setDraggable(false);		

		// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
		map.setZoomable(false);   

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.56682, 126.97865), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${rs.rs_address1 }', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    }
		});

		
</script>	
<script type="text/javascript">

$("#_btnRegi").click(function() {
	if($("#_userid2").val() == ""){
		alert($("#_userid").attr("data-msg") + " 입력해 주십시오" );
		$("#id").focus();
	} 
	else if($("#_pwd2").val() == ""){
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#pwd").focus();
	} 
	else if($("#_name").val() == ""){
		alert($("#_name").attr("data-msg") + " 입력해 주십시오" );
		$("#_name").focus();
	} 
	else if($("#_nickname").val() == ""){
		alert($("#_nickname").attr("data-msg") + " 입력해 주십시오" );
		$("#_nickname").focus();
	} 
	else if($("#_email").val() == ""){
		alert($("#_email").attr("data-msg") + " 입력해 주십시오" );
		$("#_email").focus();
	}
	else{
		$("#_frmForm2").attr("action", "regiAf.do").submit();
	}
});

/* 아이디체크 */

$("#_btnGetId").click(function () {
	var id = $("#_id2").val();
	if(id == ""){
		alert("아이디를 입력해 주십시오");
	}else{
		idCheckFunc(id);
	}	
});

 function idCheckFunc(id) {
	
	$.ajax({
		type:"post",
		url:"getID.do",
		data:"id=" + id,
		async:true,
		success:function(msg){			
			if(msg.message == 'YES'){
				$("#_rgetid").html("사용할 수 없는 아이디입니다");
				$("#_rgetid").css("background-color", "#ff0000");
			}	
			else{
				$("#_rgetid").html("사용하실 수 있습니다");
				$("#_rgetid").css("background-color", "#0000ff");
				$("#_userid2").val( $("#_id2").val() );
			}
		}		
	});
	
}

/* 닉네임 체크 */
$("#_btnGetNickName").click(function () {
	var nickname = $("#_nickname").val();
	if(_nickname == ""){
		alert("닉네임을 입력해 주십시오");
	}else{
		nicknameCheckFunc(nickname);
	}	
});

 function nicknameCheckFunc(nickname) {
	
	$.ajax({
		type:"post",
		url:"getNickName.do",
		data:"nickname=" + nickname,
		async:true,
		success:function(msg){			
			if(msg.message == 'YES'){
				$("#_rgetnickname").html("사용할 수 없는 닉네임입니다");
				$("#_rgetnickname").css("background-color", "#ff0000");
			}	
			else{
				$("#_rgetnickname").html("사용하실 수 있습니다");
				$("#_rgetnickname").css("background-color", "#0000ff");
				$("#_usernickname").val( $("#_nickname").val() );
			}
		}		
	});
	
}
</script>
</body>
</html>