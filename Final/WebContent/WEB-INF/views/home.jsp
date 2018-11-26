<%@page import="kh.c.five.model.EatMemberDto"%>
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<%
EatMemberDto user = (EatMemberDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>

<style>
@use postcss-color-function;
@use postcss-nested;
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700,900');
input:hover,
input:focus {
            padding: 12px 0;
            outline: 0;
            border: 1px solid transparent;
            border-bottom: 1px solid #575756;
            border-radius: 0;
            background-position: 100% center;
        } 
        
@use postcss-color-function;
@use postcss-nested;
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700,900');
input:hover,
input:focus {
            padding: 12px 0;
            outline: 0;
            border: 1px solid transparent;
            border-bottom: 1px solid #575756;
            border-radius: 0;
            background-position: 100% center;
        } 
/* 마스크 뛰우기 */
#mask3 {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window3 {
    display: none;
    position:absolute;  
    top:50px;
    margin-left: -500px;
    width:400px;
    height:500px;
    background-color:#FFF;
    z-index:10000;   
    
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
 }      

/*----------- 로그인 팝업창------ */  
/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window {
    display: none;
    position:absolute;  
    top:50px;
    margin-left: -500px;
    width:400px;
    height:500px;
    background-color:#FFF;
    z-index:10000;   
    
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
 }
 /* ----------회원가입 팝업창 ---------*/
 /* 마스크 뛰우기 */
#mask1 {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window1 {
    display: none;
    position:absolute;  
    top:30px;
	border-top: "-50px";
    padding-left: 60px;
    margin-left: -500px;
    width:400px;
    height:700px;
    background-color:#FFF;
    z-index:10000;   
  
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
 }
 
/* 로그인 */
@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

.popbody { 
    width: 100%;
    height:100%;
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
 
.gologin { 
    position: absolute;
    top: 200px;
    left: 80%;
    margin: -150px 0 0 -150px;
    width:300px;
    height:300px;
}
.gologin h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

.login { 
    position: absolute;
    top: 200px;
    left: 50%;
    margin: -150px 0 0 -150px;
    width:300px;
    height:300px;
}
.login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

.regi { 
    position: absolute;
    top: 200px;
    left: 50%;
    margin: -150px 0 0 -150px;
    width:300px;
    height:300px;
}
.regi h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

.pinput { 
    width: 100%; 
    margin-bottom: 10px; 
    background: rgba(0,0,0,0.3);
    border: none;
    outline: none;
    padding: 10px;
    font-size: 13px;
    color: #fff;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
    border: 1px solid rgba(0,0,0,0.3);
    border-radius: 4px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
}
.pinput:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }

 }
 
</style>

<style>
 img.card-img-top{
 	max-width: 453px;
 	min-width: 453px;
 	max-height: 300px;
 	min-height: 300px; 
 	display: block;
 	margin-left: auto;
 	margin-right: auto; 	
 	}
</style>

<!-- SEARCH -->
<style>
   
    .in-line{
      width:660px;	/* 350 */
      height:60px;	/* 40 */
    }
   
    input[type="text"]{
      width:70%;
      height:100%;
      border:none;
      font-size:1.213rem;
      padding-left: 20px;
      font-style: oblique;
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






<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"> 
//<![CDATA[
	
	////////////
	 function wrapWindowByMask3(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask3").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask3").fadeIn(0);      
        $("#mask3").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $(".window3").show();
 
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask3").click(function(e){
            e.preventDefault();
            wrapWindowByMask3();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window3 .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask3, .window3").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask3").click(function () {  
            $(this).hide();  
            $(".window3").hide();  
 
        });      
 
    });
	////////////
    function wrapWindowByMask(){
 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $(".window").show();
 
    }
 
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask").click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
 
        });      
 
    });
 
//////////////
    function wrapWindowByMask1(){
    	 
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $("#mask1").css({"width":maskWidth,"height":maskHeight});  
 
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask1").fadeIn(0);      
        $("#mask1").fadeTo("slow",0.6);    
 
        //윈도우 같은 거 띄운다.
        $(".window1").show();
 
    }
    
    $(document).ready(function(){
        //검은 막 띄우기
        $(".openMask1").click(function(e){
            e.preventDefault();
            wrapWindowByMask1();
        });
 
        //닫기 버튼을 눌렀을 때
        $(".window1 .close").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask1, .window1").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask1").click(function () {  
            $(this).hide();  
            $(".window1").hide();  
 
        });      
 
    });
    
//]]>
</script>



  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EAT PLACE: 나만의 맛집 검색</title>

  <!-- Bootstrap core CSS -->
     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/creative.min.css" rel="stylesheet">
    
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
	
 <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

  </head>

  <body>

   <!-- Navigation -->
     <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.html">EAT PLACE</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="about.html">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="restaurntsList.do">맛집 리스트</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="restaurantsInsert.do">맛집 추가</a>
            </li>
            <li class="nav-item" style="margin-left: 20px">
            	<a class="nav-link openMask3" href="#">
            		<img alt=""	src="img/main/man-user.png">
				</a>
			</li>
			
 			<li class="nav-item">
 		
 				  <%if(user == null){%>
					
						<a class="nav-link openMask" href="#">로그인</a>
						<%} else{%>
						<a class="nav-link" href="#" ><%=user.getId()%>님</a>
						<a id="_btnLogout" class="nav-link" href="logout.do" > 로그아웃 </a>
				<%} %>	
 				  
 			</li>  
 			 <!-- 가고싶다 팝업창 및 로그인  -->
           <div class="dropdown-item popbody" id="mask3"></div> 
            <div class="window3">
		   		<div class="gologin">
					
				</div>
            </div>
            
 			     
        <!-- 로그인 팝업참 -->
           <div class="dropdown-item popbody" id="mask"></div> 
            <div class="window">
		   		<div class="login">
					<h1>Login</h1>
					<br>
					<form action="loginAf.do" name="frmForm" id="_frmForm"  method="post">
					     <input type="text" name="id" class="pinput" placeholder="Username" id="_userid" required="required" />
					     <input type="password" name="pwd" class="pinput" placeholder="Password" id="_pwd" required="required" />
					     <button type="submit" class="btn btn-primary btn-block btn-large" id="_btnLogin" style="text-align: center;">로그인</button>
		               	 <a  class="btn btn-primary btn-block btn-large openMask1" href="#" style="text-align: center;">회원가입</a>
		               	 <a  class="dropdown-item" id="kakao-login-btn"></a>
					 </form>
				</div>
            </div>
            
            
             <!-- 회원가입 팝업창 -->
        	<div class="dropdown-item" id="mask1"></div> 
            <div class="window1">
		   		<div class="regi">
					<h1>회원가입</h1>
					<br>
					<div id="login_wrap">
					<form action="" method="post" id="_frmForm2" name="frmForm2">
					
					<table class="content_table" style="width: 100%">
					<colgroup>
						<col style="width:40%">
						<col style="width:60%">
					</colgroup>
					
					<tr>
						<th>아이디 첵크</th>
						<td>
							<input type="text" name="sid" id="_id2" class="pinput" size="40" placeholder="id"><br>
							<a href="#none" id="_btnGetId" class="btn btn-primary btn-block btn-large" title="회원가입" style="height: 30px;">아이디체크</a>
							<div id="_rgetid"></div>
						</td>
						
					</tr>
					
					
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" id="_userid2" class="pinput" size="40" data-msg="아이디를 " readonly="readonly"> 
						</td>
					</tr>
					
					<tr>
						<th>패스워드</th>
						<td>
							<input type="text" name="pwd" id="_pwd2" class="pinput" size="40" placeholder="password" data-msg="패스워드를 "> 
						</td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" id="_name" class="pinput" size="40" placeholder="name" data-msg="성함을 "> 
						</td>
					</tr>
					<tr>
						<th>닉네임 첵크</th>
						<td>
							<input type="text" name="snickname" id="_nickname" class="pinput" size="40" placeholder="nickname"><br>
							<a href="#none" id="_btnGetNickName" class="btn btn-primary btn-block btn-large" title="회원가입" style="height: 30px;">닉네임체크</a>
							<div id="_rgetnickname"></div>
						</td>
						
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input type="text" name="nickname" id="_usernickname" class="pinput" size="40" data-msg="별명을 " readonly="readonly"> 
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email" id="_email" size="40" class="pinput" placeholder="e-mail" data-msg="이메일을 "> 
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="height: 50px; text-align: center;">
						
						<a href="#none" id="_btnRegi" class="btn btn-primary btn-block btn-large" style="height: 30px; title="회원가입">회원가입</a>
						
						<!-- <a href="#none" id="_btnLogin" class="btn btn-primary btn-block btn-large" style="height: 30px; title="로그인">로그인</a> -->					
						
						</td>					
					</tr>					
					
					</table>					
					
					</form>				
				
				</div>
				</div>
        
          </ul>
        </div>
      </div>
    </nav>
	
 
	
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
       
	        <div class="carousel-inner" role="listbox">
	         
	           <div class="carousel-item active" style="text-align: center; padding-top: 150px; background-image: url('img/main_food.jpg');">
	            
	            <h1 style="color: white;"><strong>솔직한 리뷰, 믿을 수 있는 평점!</strong></h1>
	              <h1 style="color: white;"><strong>EAT PLACE</strong></h1> 
	             
	 			<form action="" id="main-search" name="main-search" method="get"> 
	 			 <div class="in-line" style="margin-left: 470px; ">
			      <strong><input type="text" onkeypress="if(event.keyCode==13) {search();}"  id="main-keyword" name="s_keyword" value="" placeholder="지역, 식당 또는 음식" style="color: #575756; border-bottom-left-radius: 20px; border-top-left-radius: 20px"></strong>
			      <strong><input type="button" onclick="search()"  value="검색" style="border-bottom-right-radius: 20px; border-top-right-radius: 20px; border-bottom-left-radius: 20px; border-top-left-radius: 20px; background-color: darkorange; color: white;"></strong>
			     </div>
			   </form>
			   
	          </div> 
	        </div>
	      </div>
	  
   </header>


	<br><br>
    <!-- Portfolio Section -->
    
    <p style="margin-left: 58px; font-size: 24px; color: #ff7100"><strong>평점이 높은 식당</strong></p>
      <div class="row" style="margin-left: 65px; margin-right: 65px">
    
     <%
     List<RegiDto> RankList = (List<RegiDto>)request.getAttribute("RankList");
         
     if(RankList == null){
      %>
   		 <div class="col-lg-4 col-sm-6 portfolio-item" style="height: 400px; width: 430px;">
       
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#"></a>
              </h4>
              <p class="card-text"></p>
            </div>
          </div>
        </div>
      <%}else{ %>      
     	<%for(int i=0; i<6; i++){%>	 
        <div class="col-lg-4 col-sm-6 portfolio-item" style="height: 400px; width: 430px;">
        
          <div class="card h-100">
            <a href="rsdetail.do?seq=<%=RankList.get(i).getSeq() %>"><img class="card-img-top" src="\image\<%=RankList.get(i).getRs_picture() %>" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="rsdetail.do?seq=<%=RankList.get(i).getSeq() %>"><%=RankList.get(i).getRs_name() %>&nbsp;&nbsp;<strong><span style="color:#ff792a; font-size: 1.37rem;"><%=RankList.get(i).getRs_rating() %></span></strong></a>
              </h4>
              <p class="card-text"><%=RankList.get(i).getRs_address1() %> - <%=RankList.get(i).getRs_category() %></p>
            </div>
          </div>
        </div>  	    
	 	<%}%>
	 <%} %>
		    
    </div>
    <br><br>
      
	<img alt="" src="img/button/hr.png" style="width: 100%"> 
	
	<br><br><br><br> 
	
 	<section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?category=한식">
              <img class="img-fluid" src="img/portfolio/fullsize/k.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    	한식
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?category=양식">
              <img class="img-fluid" src="img/portfolio/fullsize/a.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    	양식
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?category=일식">
              <img class="img-fluid" src="img/portfolio/fullsize/j.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                   	일식
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?category=중식">
              <img class="img-fluid" src="img/portfolio/fullsize/china.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    	중식
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?category=카페">
              <img class="img-fluid" src="img/portfolio/fullsize/cafe.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    	카페
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?category=뷔페">
              <img class="img-fluid" src="img/portfolio/fullsize/v.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    	뷔페
                  </div>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>
 
 <br>
 
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
      
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
<!--      <script src="js/creative.min.js"></script> -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	
	 
	
<script type='text/javascript'>
	$(document).ready(function(){
		console.log(Kakao.Auth.getAccessToken());
		if(Kakao.Auth.getAccessToken() ==null){
			console.log("nothing");
		}
	});
		  //<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('7b79e9996c3bab29b8e5285b04135813');
			
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container: '#kakao-login-btn',
				success: function(authObj) {
			
			/* Kakao.Auth.login({      
				success: function(authObj) { */
						
					// 로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url: '/v1/user/me',
						success: function(res) {
							console.log(res);
							
							var userID = res.id;						//유저의 카카오톡 고유 id
							var userEmail = res.kaccount_email;			//유저의 이메일
							var userNickName = res.properties.nickname;	//유저가 등록한 별명
							
							console.log(userID);
							console.log(userEmail);
							console.log(userNickName);
							
							document.getElementById("before").innerHTML="<li class='nav-item dropdown' id='after'>"+
							"<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownPortfolio' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>" + 
			               	userNickName + "</a>" +
			               	"<div  class='dropdown-menu dropdown-menu-right' aria-labelledby='navbarDropdownPortfolio' style='text-align: center'>" +
			               	"<a class='dropdown-item'>" + 
			               	"<button type='button' onclick='Kakao.Auth.logout()'>로그아웃</button>"+
			               	"</a>"+
			               	"</div></li>";
			               	
			               	
			               	
						},
						fail: function(error) {
							alert(JSON.stringify(error));
						}


					});
				},
				fail: function(err) {
					alert(JSON.stringify(err));
				},
				persistRefreshToken: false,
				persistAccessToken: false
				
			
			});
		  //]]>
		  
		  
		</script>

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
    
$("#_btnLogin").click(function () {
	 /* location.href = "login.do";  */
	"login.do";  
});


$("#_btnLogout").click(function () {
	/* location.href = "logout.do"; */
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



  </body>






</html>
