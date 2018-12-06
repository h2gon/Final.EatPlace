<%@page import="kh.c.five.dao.impl.EatRestaurantsDaoImpl"%>
<%@page import="kh.c.five.dao.EatRestaurantsDao"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="kh.c.five.model.EatMemberDto"%>
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<%
EatMemberDto user = (EatMemberDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>

 
<%

Cookie[] cookies = request.getCookies();            // 요청정보로부터 쿠키를 가져온다.



System.out.println("현재 설정된 쿠키의 개수 : " + cookies.length);    // 쿠키가 저장된 배열의 길이를 가져온다.



for(int i = 0 ; i<cookies.length; i++){                            // 쿠키 배열을 반복문으로 돌린다.

/* URLDecoder.decode(cookies[i].getName(), "utf-8") */

System.out.println(i + "번째 쿠키 이름 : " + URLDecoder.decode(cookies[i].getName(), "utf-8"));            // 쿠키의 이름을 가져온다.

System.out.println(i + "번째 쿠키에 설정된 값 : " + cookies[i].getValue());    // 쿠키의 값을 가져온다.


}

%>

<!-- slideshow -->
<style>

	
	*{margin:0;padding:0;}
	ul,li{list-style:none;}
	#slide{height:300px;position:relative;overflow:hidden;}
	#slide ul{width:400%;height:100%;transition:1s;}
	#slide ul:after{content:"";display:block;clear:both;}
	#slide li{float:left;width:25%;height:100%;}
	/*#slide li:nth-child(1){background:#faa;}
	#slide li:nth-child(2){background:#ffa;}
	#slide li:nth-child(3){background:#faF;}
	#slide li:nth-child(4){background:#aaf;} */
	#slide input{display:none;}
	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	#pos1:checked~ul{margin-left:0%;}
	#pos2:checked~ul{margin-left:-100%;}
	#pos3:checked~ul{margin-left:-200%;}
	#pos4:checked~ul{margin-left:-300%;}
	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	#pos4:checked~.pos>label:nth-child(4){background:#666;}
</style>

<style>
 img.card-img-top{
 	max-width: 453px;
 	
 	max-height: 300px;
 	
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

<style>

.modal-dialog.modal-80size {
  top: 55px;
  left: 1150px;
  width: 400px;
  height: 700px;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}
</style>

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

<!-- 가고싶어 제발 -->
<div  class="w3-container">
<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
 	<div>
  		<ul class="pagination w3-white w3-border-bottom" style="height:50px; width:100%; position:relative; list-style:none;">
  		<li style="position:relative; height:100%; width:50%; float:left; text-align: center;"><a href="#" class="tablink" onclick="openCity(event, 'London')" style="width: 100%; height: 100%; border-top: 7px;">최근 본 맛집</a></li>
  		<li style="position:relative; height:100%; width:50%; float:left; text-align: center;"><a href="#" class="tablink" onclick="openCity(event, 'Paris')" style="width: 100%; height: 100%; border-top: 7px;">가고싶다</a></li>
  		</ul>
 	</div> 
	<!-- 최근 본 맛집 -->

  <div id="London" class="w3-container city">
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
%>
 <%} %>

<div style="width:350px; height:100px; background-color:; box-sizing: border-box; border: 1 solid; ">
	<!-- 사진 -->
	<div style="display:inline-block; position:absolute; width: 80px; height: 90px; margin-top:3px; margin-left:10px;">
		<a><img alt="" src="<%=cookiePic%> " style="width: 80px; height: 90px;"></a>
	</div>
	<div>
		<!-- 이름 -->
		<div style="display:inline-block; position:relative; width: 30%; height: 45%; top:10px; left:100px;">
			<a href="rsdetail.do?seq=<%=cookies[i].getValue()%>" style="text-align: center;"><b><font style="font-size: medium;text-align:center;"><%=cn%></font></b></a>
		</div>
		<!-- 주소 -->
		<div style="display:inline-block; position:relative; width: 55%; height: 30%; top:50px; left:-5px;">
			<a><font style="font-size: x-small;"><%=cookieAdd %></font></a>
		</div>

		<!-- 평점 --> 
		<div style="display:inline-block;  position:relative; width: 10%; height: 20%; top:10px; right:90px;">
			<a><font style="color:#c53211 "><%=cookieRating %></font></a>
		</div>
		<!-- 즐찾 -->
		<div style="display:inline-block;  position:relative; width: 15%; height: 10%; top:-3px; left:295px;">
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
  </div>
	<!-- 가고 싶다 -->
  <div id="Paris" class="w3-container city">
   <h1>Paris</h1>
   
    <table class="wannagolist" border="2">
						        		<thead>
						        			<tr>
						        				<th>가게이름</th>
						        			</tr>
						        		</thead>
						        		
						        		<tbody>
						        		
						        	
						        		<c:if test="${empty wannagolist }">
						        			가고싶은 가게를 추가해주세요~
						        		</c:if>
						        		
						        		<c:forEach items="${wannagolist }" var="wl" varStatus="vs">
						        		
						        		<tr>
						        		<td><a href="rsdetail.do?seq=${wl.rs_seq }">${wl.rs_name }</a></td>
						        		
						        		</tr>
						        		
						        		</c:forEach>
						        		
						        		</tbody>
						        		
						        	</table>   
   
  </div>
  <div class="w3-container w3-light-grey w3-padding">
  <%if(user == null){%>
		<!-- <a class=" openMask" href="#">로그인</a> -->
		<button onclick="document.getElementById('id02').style.display='block'"  class="w3-btn w3-green w3-large">Login</button>
  <%} else{%>
		<a class="" href="#" ><%=user.getId()%>님</a>
		<button onclick="document.getElementById('id01').style.display='none'"  class="w3-btn w3-green w3-large">
			<a id="_btnLogout" class="" href="logout.do" > 로그아웃 </a>
		</button>
		<!-- <a id="_btnLogout" class="" href="logout.do" > 로그아웃 </a> -->
  <%} %>
    <button class="w3-btn w3-right w3-white w3-border" onclick="document.getElementById('id01').style.display='none'">Close</button>
  </div>
 </div>
</div>
</div>

<!-- 로그인 모달 -->
<div id="id02" class="w3-modal" style="">
  <span onclick="document.getElementById('id02').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-hor-8 w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-card-9 w3-animate-zoom" style="right:-10px; max-width:600px; height: 400px;">
    <div class="w3-center"><br>
    	<h1>Login</h1>
    </div>
    <div class="w3-container">
      <div class="w3-section">
      	<form action="loginAf.do" name="frmForm" id="_frmForm"  method="post">
	        <label><b>Username</b></label><br>
	        <input class="w3-input w3-border w3-margin-bottom" id="_userid" name="_userid" required="required" type="text" placeholder="Username"><br>
	        <label><b>Password</b></label><br>
	        <input class="w3-input w3-border w3-margin-bottom" type="password" id="_pwd" name="_pwd" required="required" placeholder="Password">
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="w3-btn w3-btn-block w3-green" id="_btnLogin" style="width:70%; text-align: center;">로그인</button><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('id03').style.display='block'" class="w3-btn w3-btn-block w3-green" style="width:70%; text-align: center;">회원가입</button>
       	</form>
      </div>
    </div>
    <div class="w3-container w3-border-top w3-padding-hor-16 w3-light-grey">
      <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-btn w3-red" style="float: right;">Cancel</button>
    </div>
  </div>
</div>


<!-- 회원가입 모달 -->
<div id="id03" class="w3-modal" style="">
  <span onclick="document.getElementById('id03').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-hor-8 w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-card-9 w3-animate-zoom" style="right:-10px; width:600px; height: 650px;">
  
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
					<a href="#none" id="_btnGetId" class="form-control" title="회원가입" style="height: 30px;">아이디체크</a>
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
                	<a href="#none" id="_btnGetNickName" class="form-control" title="회원가입" style="height: 30px;">닉네임체크</a>
					<div id="_rgetnickname"></div>
					<input type="text" name="nickname" id="_usernickname" class="pinput" size="40" data-msg="별명을 " readonly="readonly"> 
                </div>
                <div class="col-lg-10" style="">
                <a href="#none" id="_btnRegi" class="form-control" style="height: 30px; title="회원가입">회원가입</a>
                </div>
            </div>
       	</form>
      </div>
    </div>
    <div class="w3-container w3-border-top w3-padding-hor-16 w3-light-grey">
      <button style="float: right;" onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-btn w3-red">Cancel</button>      
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
</script>

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
					<li class="nav-item"><a class="nav-link"
						href="restaurntsList.do"><strong
							style="color: white; margin-left: 20px">맛집 리스트</strong></a></li>
					<li class="nav-item"><a class="nav-link"
						href="restaurantsInsert.do"><strong
							style="color: white; margin-left: 20px">맛집 추가</strong></a></li>
					<li class="nav-item" style="margin-left: 20px">
						<a onclick="document.getElementById('id01').style.display='block'" class="w3-btn">
						<img alt=""	src="img/main/man-user.png">
						</a>
					</li>
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
			     
			     
				<!-- controller로 넘겨주기 위한 값 -->
				<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
					value="${(empty recordCountPerPage)?9:recordCountPerPage }">
							     
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
            <a href="rsdetail.do?seq=<%=RankList.get(i).getSeq() %>"><img class="card-img-top" src="<%=RankList.get(i).getRs_picture() %>" alt=""></a>
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
    
    <br><br><br>
    
    <p style="margin-left: 58px; font-size: 24px; color: #ff7100"><strong>믿고 보는 맛집 리스트</strong></p>
<!-- slideshow -->
  <div id="slide" style="margin-left: 65px; margin-right: 65px; height: 350px">
	<input type="radio" name="pos" id="pos1" checked>
	<input type="radio" name="pos" id="pos2">
		
	 <ul>
		<li style="text-align: center;"><a href="KFBest.do?rs_category=한식"><img alt="" src="img/main/한식_수정.jpg" style="width: 450px; height: 300px"></a> <a href="GuBest.do?rs_address1=강남"><img alt="" src="img/main/강남맛집_수정.jpg" style="width: 450px; height: 300px; margin-left: 40px; margin-right: 40px"></a> <a href="keyword.do?rs_keyword=삼겹살"><img alt="" src="img/main/삼겹살_수정.jpg" style="width: 450px; height: 300px"></a></li>
		<li style="text-align: center;"><a href="keyword.do?rs_keyword=디저트"><img alt="" src="img/main/디저트_수정.jpg" style="width: 450px; height: 300px"></a> <a href="keyword.do?rs_keyword=술집"><img alt="" src="img/main/술집_수정.jpg" style="width: 450px; height: 300px; margin-left: 40px; margin-right: 40px"></a> <a href="keyword.do?rs_keyword=데이트코스"><img alt="" src="img/main/데이트코스_수정.jpg" style="width: 450px; height: 300px"></a></li>
	     
	</ul>
	<p class="pos" style="top: 330px">
		<label for="pos1"></label>
		<label for="pos2"></label>
		<!-- <label for="pos3"></label>
		<label for="pos4"></label> -->
	</p>
</div>
    
    <br>
    <img alt="" src="img/button/hr.png" style="width: 100%">
	<br><br><br>
	
 	<section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="category.do?s_category=한식">
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
            <a class="portfolio-box" href="category.do?s_category=양식">
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
            <a class="portfolio-box" href="category.do?s_category=일식">
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
            <a class="portfolio-box" href="category.do?s_category=중식">
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
            <a class="portfolio-box" href="category.do?s_category=카페">
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
            <a class="portfolio-box" href="category.do?s_category=뷔페">
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
    
      <div style="text-align:left; color: white; font-size: 35px; padding-top: 20px;">
      	<p>EAT PLACE</p>
      <img alt="" src="img/button/hr.png" style="width: 5%; height: 1px">
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

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
<!--      <script src="js/creative.min.js"></script> -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<script type="text/javascript">

$("#clear").click(function() {
	 alert("삭제");
	 /* location.href = "clear.do"; */
		$("#_frmForm5").attr("action", "clear.do").submit();
});

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



  </body>

</html>
