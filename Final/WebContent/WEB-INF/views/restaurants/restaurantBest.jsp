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
            <h1 style="color: black;"><strong>EAT PLACE 한식 BEST 5</strong></h1>
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
			%>
			<tr>
			<td>
			<div>
			<li style="text-align: center; margin-left: 430px">
				<div>
					<figure style="float: left;"> 
						<img src="<%=bestlist.get(i).getRs_picture() %>" style="width: 238px; height: 238px;">
					</figure>
					
					<figcation style="float:left; text-align: left;">
						<div style="padding-top: 13px">
							<span style="font-size: 1.8rem;"><%=i+1 %>. <%=bestlist.get(i).getRs_name() %></span>&nbsp;&nbsp;<strong style="font-size: 1.8rem;"><%=bestlist.get(i).getRs_rating() %></strong>
							<p style="font-size: 1.063rem; color: gray;"><%=bestlist.get(i).getRs_address1() %></p>
						</div>
						
						<div>
							<p class="test"><%if(reviewlist.get(i).getRs_content() == null){ %>
								리뷰가 아직 없습니다
								<%}else{ %>
									<%=reviewlist.get(i).getRs_content() %>
								<%} %>
							 </p> 
						</div>						
					</figcation>										
				</div>
			</li>
			</div>
			 <img alt="" src="img/button/hr.png" style="width: 55%; margin-left: 460px">
			</td>
			</tr>			
			<%} %>				
			</table>							
		</ul>
	</section>

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
      <!-- /.container -->
      </div>
    </footer>
</body>
</html>