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
        <label for = "like"></label>
        <input type = "radio" name = "like" value = "5" checked="checked">맛있어요
        <input type = "radio" name = "like" value = "3">괜찮아요
        <input type = "radio" name = "like" value = "1">별로에요
       
        <br><br><br>
     
        <textarea rows="10" cols="50" name='content' id="content"></textarea>
        
        
        
        <br><br>
         <input type="button" value="이미지추가" onclick="">
        <input type = "submit" value ="리뷰작성">
        <input type="button" value="돌아가기" onclick="history.back();">
    </form>
               
               
               
               
               
               
               
               
               
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

</body>
</html>