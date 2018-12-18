<%@page import="kh.c.five.model.EatMemberDto"%>
<%@page import="kh.c.five.model.wannagoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="kh.c.five.model.ReviewParam"%>
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    right: 535px;
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

</style>

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

<!-- 가고싶어 제발 -->
<div class="w3-container ">
<div id="id01" class="w3-modal" style="z-index: 111;">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
 	<div>
  		<ul class="pagination w3-white w3-border-bottom" style="height:50px; width:100%; position:relative; list-style:none;">
  		<li style="position:relative; height:100%; width:50%; float:left; text-align: center;"><a href="#" class="tablink" onclick="openCity(event, 'London')" style="width: 100%; height: 100%; border-top: 7px;">최근 본 맛집</a></li>
  		<li style="position:relative; height:100%; width:50%; float:left; text-align: center;"><a href="#" class="tablink" onclick="openCity(event, 'Paris')" style="width: 100%; height: 100%; border-top: 7px;">가고싶다</a></li>
  		</ul>
 	</div> 
	<!-- 최근 본 맛집 -->

  <div id="London" class="w3-container city" style="overflow-y: scroll; height: 480px;">
  <form action="" name="frmForm5" id="_frmForm5"  method="post">
  	 <div style="display:inline-block; position:absolute; top:3.3em; right: 10px;">
  		<a href="#" id="clear" style="text-align: right;"><font style="color: #BDBDBD">x clear all</font></a>
  	</div> 
 </form>
 <%
 	
    List<RegiDto> RankList = (List<RegiDto>)request.getAttribute("RankList");
 
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
			<a href="rsdetail.do?seq=<%=cookies[i].getValue()%>" style="text-align: center;"><b><font style="font-size: medium;text-align:center;"><%=dot3(cn)%></font></b></a>
		</div>
		<!-- 주소 -->
		<div style="display:inline-block; position:relative; width: 55%; height: 30%; top:-55px; left:120px;">
			<a><font style="font-size: x-small;"><%=cookieAdd %></font></a>
		</div>

		<!-- 평점 --> 
		<div style="display:inline-block;  position:relative; width: 10%; height: 20%; top:-88px; right:-20px;">
			<a><font style="color:#c53211 "><%=cookieRating %></font></a>
		</div>
		<!-- 즐찾 -->
		<div style="display:inline-block;  position:relative; width: 15%; height: 10%; top:-60px; right: -40px;">
		<%if(user == null){ %>
			<img id="like_btn" src="img/button/likeIcon.png" style="width: 45px; height: 45px;" >
		<%}else{ %>
			<a href="wannago.do?rs_seq=<%=cookieLike %>&rs_name=<%=cookiename%>"><img id="like_btn" src="img/button/likeIcon.png" style="width: 45px; height: 45px;" ></a>
		<%} %>
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
  <%} 

  %>
  </div>
<!-- 가고 싶다 -->
  <div id="Paris" class="w3-container city" style="overflow-y: scroll; height: 480px;">
   
		
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
			<a href="rsdetail.do?seq=<%=wannalike%>" style="text-align: center;"><b><font style="font-size: medium;text-align:center;"><%=dot3(wannaname)%></font></b></a>
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
  <div class="w3-modal-content w3-card-9 w3-animate-zoom" style="right:-10px; max-width:600px; height: 400px;">
    <div class="w3-center"><br>
    	<h1>Login</h1>
    </div>
    <div class="w3-container">
      <div class="w3-section">
      	<form action="loginAf.do" name="frmForm" id="_frmForm"  method="post">
	        <label><b>Id</b></label><br>
	        <input class="w3-input w3-border w3-margin-bottom" id="_userid" name="_userid" required="required" type="text" placeholder="Id" style="border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;border-top-left-radius: 10px;border-top-right-radius: 10px;"><br>
	        <label><b>Password</b></label><br>
	        <input class="w3-input w3-border w3-margin-bottom" type="password" id="_pwd" name="_pwd" required="required" placeholder="Password" style="border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;border-top-left-radius: 10px;border-top-right-radius: 10px;">
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
                <!-- <div class="col-lg-10" style="">
                <a href="#none" id="_btnRegi" class="form-control" style="height: 30px; title="회원가입">회원가입</a>
                </div> -->
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
		style="background-color: #c53211; padding-bottom: 10px">
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
		<%-- <form action="" id="main-search" name="main-search" method="get"> 
 			 <div class="in-line">
		      <strong><input type="text" onkeypress="if(event.keyCode==13) {search();}"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" style="color: #575756; border-bottom-left-radius: 20px; border-top-left-radius: 20px"></strong>
		      <strong><input type="button" onclick="search()"  value="검색" style="border-bottom-right-radius: 20px; border-top-right-radius: 20px; border-bottom-left-radius: 20px; border-top-left-radius: 20px; background-color: darkorange; color: white;"></strong>
		     </div>
		<!-- controller로 넘겨주기 위한 값 -->
		<input type="hidden" name="s_category"  value="<%=category %>">
		<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
			value="${(empty recordCountPerPage)?9:recordCountPerPage }">
				
		
		</form> --%>
		<!-- 전체 검색 -->
  <fieldset id="search" class="main-search ng-scope" ng-controller="mp20_main_search_suggest_controller" style="z-index: 110;border: 0;">
      
		<form action="" id="main-search" name="main-search" method="get" > 
	 			 <div class="in-line" style="margin-left: auto; margin-right: auto; ">
	 			 <span>검색 :</span>
			      <strong><input type="text" class="seaechAll" onkeypress="if(event.keyCode==13) {search();}" onclick="displayVsearch()"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" autocomplete="off" style="color: #ffffff; margin-left: 40px;"></strong>
			      
			     </div>
				<!-- controller로 넘겨주기 위한 값 -->
				<input type="hidden" id="_s_category" name="s_category" value="">
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
		
		<div class="container" style="float: left; width: 25%">
			<div class="collapse navbar-collapse" id="navbarResponsive">				
				<ul class="navbar-nav ml-auto">
					
					<li class="nav-item"><a class="nav-link"
						href="restaurntsList.do"><strong
							style="color: white; margin-left: 25px">맛집 리스트</strong></a></li>
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

	<br>
	<br>


	<!-- Portfolio Section -->
	<div style=" content:'';display: table;clear: both;    min-height: 300px;">
	<div style="float: left; width: calc(100% - 400px);     min-width: 850px;">
		<p style="margin-left: 58px; font-size: 24px; color: #ff7100">
			<strong><%=s_keyword %> 맛집 인기 검색순위</strong>
		</p>
		<div class="row" style="margin-left: 55px; margin-right: 10px">
			<%
				List<RegiDto> list = (List<RegiDto>) request.getAttribute("searchlist");
				if(list.size()==0 || list ==null){
				
				%>
				
				<p style="font-size: 25px;line-height: 25px;margin-bottom: 65px;">
		          '<span ><%=s_keyword %></span>'에 대한 검색 결과가 없습니다.
	         	 </p>
	         	 
	         	 <script type="text/javascript">
		         	$(document).ready(function () {
		         		$("#map").css("display","none");})	         		
	         	 </script>
				
				<%
				}
				else{
				for (int i = 0; i < list.size(); i++) {
			%>
			<div class="col-lg-4 col-sm-6 portfolio-item"
				style="height: 350px; width: 430px;max-width: 430px;min-width: 300px;">

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
	<div id="map" style="position: relative;right: 15px;">
		<div id="map" style="width: 400px; height: 500px;"></div>
	</div>
	
	</div>
	<br>
	<br>

	<!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
    
      <div style="text-align:left; color: white; font-size: 35px; padding-top: 20px;">
      	<p>EAT PLACE</p>
      <img alt="" src="img/button/hr.png" style="width: 5%; height: 1px">
      <p style="color: gray; font-size: 13px">Eat, Share, Be Happy</p>
      </div>
      
      <br> 
      
      <div>
	     <span style="color: gray;">
	      	<img alt="" src="img/button/hr.png" style="width: 100%; height: 1px">
	      	 인기지역:<a style="text-decoration: none;" href="search.do?s_keyword=이태원">이태원</a>|<a style="text-decoration: none;" href="search.do?s_keyword=강남" >강남</a>|<a style="text-decoration: none;" href="search.do?s_keyword=홍대">홍대</a>|<a style="text-decoration: none;" href="search.do?s_keyword=가로수길">가로수길</a>|<a style="text-decoration: none;" href="search.do?s_keyword=건대">건대</a>|<a style="text-decoration: none;" href="search.do?s_keyword=대학로">대학로</a>|<a style="text-decoration: none;" href="search.do?s_keyword=신촌">신촌</a>|<a style="text-decoration: none;" href="search.do?s_keyword=혜화">혜화</a>|<a style="text-decoration: none;" href="search.do?s_keyword=잠실">잠실</a>|<a style="text-decoration: none;" href="search.do?s_keyword=왕십리">왕십리</a>|<a style="text-decoration: none;" href="search.do?s_keyword=압구정">압구정</a>|<a style="text-decoration: none;" href="search.do?s_keyword=사당">사당</a>|<a style="text-decoration: none;" href="search.do?s_keyword=명동">명동</a> 
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
      <!-- /.container -->
      </div>
    </footer>
    

	
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
	level : 9
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
	/* alert(pageNumber); */
	
	var str = '<%=category%>';
	var kstr = '<%=keyword%>';
	
	if (str == "") {
		/* alert("카테고리 없"); */
		$("#main-search").attr({"target":"_self", "action":"search.do"}).submit();
	}
	else if (kstr == ""){
		 /* alert("검색어 없");  */
		$("#main-search").attr({"target":"_self", "action":"category.do"}).submit();
	}else {
		alert("?????");
	}
	
	
}


</script>


<script type="text/javascript">
function search() {
	$("#_pageNumber").val(0);
	  var keyword = $("#main-keyword").val();
	  if (keyword == "" || keyword == null) {
		alert("검색어를 입력해주세요")
		
	}else{
		alert("main-keyword = " + keyword);
		
		$("#main-search").attr({"target":"_self", "action":"search.do"}).submit();
	}
	
	  
	  
}
</script>


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
<script type="text/javascript">


$("#_btnLogin").click(function () { 
 	 "login.do"; 
});

$("#_btnLogout").click(function () {
 	"logout.do";
});


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

</html>
