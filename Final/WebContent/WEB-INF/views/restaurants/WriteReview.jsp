<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script type="text/javascript">

		
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="owlcarousel/owl.carousel.min.js"></script>

<!-- owl carousel css -->
<link rel="stylesheet" href="owlcarousel/owl.carousel.min.css">
<link rel="stylesheet" href="owlcarousel/owl.theme.default.min.css">
</head>
<body>
<%
//여기서 list(get review list)

%>
<div class="owl-carousel owl-theme">


	<div class="item"><img src="img/portfolio/fullsize/1.jpg"></div>
	<div class="item"><img src="img/portfolio/fullsize/2.jpg"></div>
	<div class="item"><img src="img/portfolio/fullsize/3.jpg"></div>
	<div class="item"><img src="img/portfolio/fullsize/4.jpg"></div>
	<div class="item"><img src="img/portfolio/fullsize/5.jpg"></div>
	<div class="item"><img src="img/portfolio/fullsize/6.jpg"></div>
	
</div>


<!-- 레스토랑 상세 -->
		<section class="restaurant-detail">
			<header>
				<div class="restaurant_title_wrap">
               
   
<h4 style="color: grey"><% %>회원님</h4>
<h3><% %>에 대한 솔직한 리뷰를 써주세요.</h3>

 <form action = "writeReviewAf.do">
   
		<!-- <div class="star">
		<img alt="" src="./img/like/1-1.png" id="p1" msg="1" title="1점" onclick="$(this).attr('src','./img/like/1-2.png');">
		<img alt="" src="./img/like/3-1.png" id="p3" msg="3" title="3점" onclick="$(this).attr('src','./img/like/3-2.png');">
		<img alt="" src="./img/like/5-1.png" id="p5" msg="5" title="5점" onclick="$(this).attr('src','./img/like/5-2.png');">
		</div> -->


		<div class="star">
		<img alt="" src="./img/like/1-1.png" id="p1" msg="1" title="1점" >
		<img alt="" src="./img/like/3-1.png" id="p3" msg="3" title="3점" >
		<img alt="" src="./img/like/5-1.png" id="p5" msg="5" title="5점" >
		</div> 
       
        <br><br><br>
     
        <textarea rows="10" cols="50" name='content' id="content"></textarea>
        
        
        
        <br><br>
         <input type="button" value="이미지추가" onclick="">
        <input type = "submit" value ="리뷰작성">
        <input type="button" value="돌아가기" onclick="history.back();">
    </form>
               
     <br><br>          
               
               
               
               
               
               
               
              </div>
            
			</header>

<script type="text/javascript">
//plugin call
$('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
})
</script>

<script type="text/javascript">
$(function () {
	$("#p1").click(function () {
		var aName = $(this).attr("msg");
		$("#p1").attr('src','./img/like/1-2.png');
		$("#p3").attr('src','./img/like/3-1.png');
		$("#p5").attr('src','./img/like/5-1.png');
		
		alert(aName + "점입니다");
	});	
	
	
	$("#p3").click(function () {
		var aName = $(this).attr("msg");
		$("#p1").attr('src','./img/like/1-1.png');
		$("#p3").attr('src','./img/like/3-2.png');
		$("#p5").attr('src','./img/like/5-1.png');
		
		alert(aName + "점입니다");
	});	
	
	$("#p5").click(function () {
		var aName = $(this).attr("msg");
		$("#p1").attr('src','./img/like/1-1.png');
		$("#p3").attr('src','./img/like/3-1.png');
		$("#p5").attr('src','./img/like/5-2.png');
		
		alert(aName + "점입니다");
	});	
	
});


</script>




</body>
</html>