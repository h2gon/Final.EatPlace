<%@page import="kh.c.five.model.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%!
public String makeTable(List<ReviewDto> dto){
	String s="";
	
		
	s="<table class='review'>";
	
	s+="</table>";
	return s;
}

%>

<script type="text/javascript">
function WriteReview(seq) {
	location.href='WriteReview.do?seq='+seq;
}		
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EAT PLACE</title>
  <!-- Bootstrap core CSS -->
     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/creative.min.css" rel="stylesheet">
    
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
	
 <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="owlcarousel/owl.carousel.min.js"></script>

<!-- owl carousel css -->
<link rel="stylesheet" href="owlcarousel/owl.carousel.min.css">
<link rel="stylesheet" href="owlcarousel/owl.theme.default.min.css">

<!-- font -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>

<style type="text/css">
/*css for modal box*/
<!--light box -->

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.3);
}

/* Modal Content */
.modal-content {
  position: none;
  background-color: rgba(0, 0, 0);
  margin: auto;
  padding: 0;
  width: 90%;
  max-width: 1200px;
}

/* The Close Button */
.close {
  color: white;
  position: absolute;
  top: 10px;
  right: 25px;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #999;
  text-decoration: none;
  cursor: pointer;
}

/* Hide the slides by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */ 
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/*On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Caption text */
.caption-container {
  text-align: center;
  background-color: black;
  padding: 2px 16px;
  color: white;
}

img.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

img.hover-shadow {
  transition: 0.3s;
}

.hover-shadow:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
/*~css for modal box*/


* { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; }
 .between {
        border: 1px #4f4f4f;
        margin-left:10px;
        margin-right:10px;
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
 }

.table1 {
    border-collapse: collapse;
    border: 1px solid black;
}
/*new css for new main*/
<style>
 img.card-img-top{
 	max-width: 453px;
 	min-width: 453px;
 	max-height: 300px;
 	min-height: 300px; 
 	display: block;
 	margin-left: auto;
 	margin-right: auto; 	
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
</head>
<body>

    <!-- Navigation -->
     <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="home.do">EAT PLACE</a>
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
 			<li>
 				  <a href="#" class="openMask">로그인</a>
 			</li>       
        <!-- 로그인 팝업참 -->
            <div class="dropdown-item" id="mask"></div>
            <div class="window">
				<table style="width: 100%">
				<tr>
					<td style="align-content: center;">
						<input type="text" id="_userid" name="id" value="" data-msg="ID를 " 
										size="15" title="아이디" style="border: 1px solid #dddddd;">
					</td>
				
				</tr>
				<tr>
					<td>
						<input type="text" id="_pwd" name="pwd" value="" data-msg="패스워드를 " 
										size="15" title="패스워드" style="border: 1px solid #dddddd;">
					</td>
				
				</tr>
				<tr>
					<td>
						<a  class="dropdown-item" id="kakao-login-btn">	
						 <a  class="dropdown-item" href="login.do" style="text-align: center;">로그인</a>
               			 <a  class="dropdown-item" href="regi.do" style="text-align: center;">회원가입</a>
					</td>
				</tr>
	
				</table>
				
            </div>
        
          </ul>
        </div>
      </div>
    </nav>
	<%
		//여기서 list(get review list)
		//List<String> imagelist = 
	%>
	<div class="owl-carousel owl-theme">


		<div class="item">
			<img src="img/portfolio/fullsize/a.jpg" onclick="openModal(); currentSlide(1)">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/cafe.jpg" onclick="openModal(); currentSlide(2)">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/china.jpg" onclick="openModal(); currentSlide(3)">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/j.jpg"onclick="openModal(); currentSlide(4)">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/k.jpg"onclick="openModal(); currentSlide(5)">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/v.jpg"onclick="openModal(); currentSlide(6)">
		</div>
		<c:forEach var="list" items="${imagelist}" varStatus="vs">
			<div class="item">
				<img alt="" src="${list.file_name }">
			</div>
		</c:forEach>
<%-- 		<%
								// 이미지 리스트에서 파일 이름을 전부 불러옴
								 for(int i = 1; i < imagelist.size(); i++){
													
								String path = imagelist.get(i);
								%>
								<div class="item">
									<img alt="" src="<%=path%>">
								</div>
								
								<%} %> --%>
							
		<%-- <%
	for(int i = 0; i<list.size();i++){ //list: 리뷰 목록
		%>
		 <div class="item"><img src=""></div>
		<%
	}
	
	
   
    %> --%>
	</div>
	<div class="column-wrapper">
		<div class="column-contents">
			<div class="inner">
				<!-- 레스토랑 상세 -->
				<section class="restaurant-detail"> 
				
				<header>
				
				
				<div style="float: left; width: 10%">
					<p></p>
				</div>
				<div style="float: left; width: 60%">
					<span class="title">
						<font size="26" color="#000000">${rs.rs_name }</font>
						
						
					</span>
	

					<div class="status branch_none">
						 
						<span class="cnt hit">
							<span class="hidden"><img src="img/button/readcount.png"></span>
						<!-- 조회수 --> ${rs.rs_readcount }
						</span> 
						<span class="cnt review">
							<span class="hidden"><img src="img/button/review.png"></span>
							<span>
						<!-- 리뷰수 -->${reviewcount }
							</span>
						</span> 
						<span class="cnt favorite">
							<span class="hidden"><img src="img/button/fav.png"></span>
						<!-- 즐겨찾기 수 -->${likescount }
						</span>
						<br>
						<img src="img/button/hr.png">
						
					</div>

					<!-- <div class="restaurant_action_button_wrap">
                  <button class="review_writing_button" >  -->
					<!-- data-restaurant_key="레스토랑 번호" -->
					<!--  <i class="review_writing_button_icon"></i>
                    <span class="review_writing_button_text">리뷰쓰기</span>
                  </button>

                  <div class="wannago_wrap">
                    <button class="btn-type-icon favorite wannago_btn">가고싶다</button>
                    
                  </div>
                </div> -->
                
                
					<table class="info no_menu" style="width: 50%">
						

						<tbody style="text-align: left">
							<tr style="text-align: left; color:#4f4f4f ">
								<th style="width: 30%">주소</th>
								<td>${rs.rs_address1 } ${rs.rs_address2 }</td>
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
								<c:if test="${rs2.rs_parking eq 0}">
								주차 불가
								</c:if>
								<c:if test="${rs2.rs_parking eq 1}">
								주차 가능
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
					
					
				<button class="review_writing_button" onclick="WriteReview('${rs.seq}');">리뷰쓰기</button>
					
				</div>
				<div style="float: left;width: 10%">
					<p>  </p>
				</div>
				<div style="float: left; width: 30%">
					<div class="map-container daum_map_wrap">

						<img class="naver_static_map"
							src="https://openapi.naver.com/v1/map/staticmap.bin?clientId=_arHno93XUB1pXRNOA9w&amp;url=https%3A%2F%2Fwww.mangoplate.com%2Frestaurants%2FRpNZ-7AuSDm5&amp;center=126.9778416,37.5512226&amp;level=10&amp;w=400&amp;h=328&amp;baselayer=default"
							alt="naver_map_image">
					</div>
				</div>
				
				</header>
				<div style="float: left; width: 60%;"></div>

				</section>
				<!-- 리뷰 -->
				<section class="module review-container">
				<!-- 리뷰 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~REVIEW~~~~~~~~~~~~~~~~~~~~~~~~-->
		<hr>
		<section class="module review-container">
            <div class="title_fliter_wrap">
              <h2 class="title only-mobile">푸줏간생고기점의 리뷰 (36)</h2>
              <h2 class="title only-desktop">리뷰 <span class="review-container-review-count">(36)</span></h2>
                <ul class="review_fliter_list" style="text-align: right;">
                 
                    <button class="btn active" data-review_count="36" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEALL')" ng-class="{selected: action_values === undefined, not_selected_btn: 36 == 0}" ng-click="get_review_list(undefined, $event)">전체
                      (36)
                    </button>
                     <button class="btn" data-review_count="27" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEGOOD')" ng-class="{selected: action_values === 3, not_selected_btn: 27 == 0}" ng-click="get_review_list(3, $event)">맛있다
                      (27)
                    </button>
                    <button class="btn" data-review_count="7" onclick="common_ga(get_now_page_code(), 'CLICK_TASTESOSO')" ng-class="{selected: action_values === 2, not_selected_btn: 7 == 0}" ng-click="get_review_list(2, $event)">괜찮다
                      (7)
                    </button>
                    <button class="btn" data-review_count="2" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEBAD')" ng-class="{selected: action_values === 1, not_selected_btn: 2 == 0}" ng-click="get_review_list(1, $event)">별로
                      (2)
                    </button>
                  
                </ul>
            </div>   
           
          </section>
          
          <%
          
          List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("reviewlist");
          
          final int LIST = 5;
          int totalCnt = list.size();
          int pagingCount = totalCnt / LIST;
          int remainList = totalCnt % LIST;
          
                    
          %>
         
		<div class="review_main">
		          
         
         
         <%-- <c:forEach items="${reviewlist }" var="review" varStatus="vs">  --%>
         
         <%for(int i=0 ; i<totalCnt;i++) {
         	if(totalCnt<=LIST){
         %>
         <table id="table" class="table1">
         
         <thead>
        	<tr>
        		<th>ID</th>
        		<th>Content</th>
        		<th>평점</th>
        	</tr>
         </thead>
         
         <tr>
         	<td>
         	<!-- review_info -->
         	<div class="review_img_container">
           
           
          
           
                             	
           	<div class="reviewer_info">
           	 <%=i+1 %>
           	<input type="text" name="review_id" style="width: 20%;" value="<%=list.get(i).getId() %>" readonly="readonly">
           
           	</div>
                     
           </div>
         	</td>
         	<!-- review context -->
         <td>
         	<div class="review_content">
         	<input type="text" name="review_content" style="width: 70%;" value="<%=list.get(i).getRs_content() %>" readonly="readonly">          	
            </div>
         </td>         	
         <td>
          <!-- 맛있다/괜찮다/별로 -->
           <div class="review_like">
           <input type="text" name="review_ratin" style="width: 10%;" value="<%=list.get(i).getRs_rating() %>" readonly="readonly">           
           </div>
           <!-- 맛있다/괜찮다/별로 end -->
         </td>         
         </tr>
                             
         
         
         </table>
         <%}
         	else if(pagingCount>1 && remainList != 0){
         	 pagingCount++;
         	%>
         	
         <table id="table" class="table1">
         
         <thead>
        	<tr>
        		<th>ID</th>
        		<th>Content</th>
        		<th>평점</th>
        	</tr>
         </thead>
         
         <tr>
         	<td>
         	<!-- review_info -->
         	<div class="review_img_container">
           
           <div class="review_date">
           <%=i+1 %>
           </div>
                             	
           	<div class="reviewer_info">
           	<input type="text" name="review_id" style="width: 20%;" value="<%=list.get(i).getId() %>" readonly="readonly">
           
           	</div>
                     
           </div>
         	</td>
         	<!-- review context -->
         <td>
         	<div class="review_content">
         	<input type="text" name="review_content" style="width: 70%;" value="<%=list.get(i).getRs_content() %>" readonly="readonly">          	
            </div>
         </td>         	
         <td>
          <!-- 맛있다/괜찮다/별로 -->
           <div class="review_like">
           <input type="text" name="review_ratin" style="width: 10%;" value="<%=list.get(i).getRs_rating() %>" readonly="readonly">           
           </div>
           <!-- 맛있다/괜찮다/별로 end -->
         </td>         
         </tr>
                 
         
         </table>			
         		
         	
         	
         	<%}
      
         }
         %>
         <a>더보기</a>
          <%-- </c:forEach>
           --%>
          </div>
          <!-- review_main end -->


				
				</section>
			</div>
		</div>
	</div>
		<!-- The Modal will open  -->
<div id="myModal" class="modal">
<br>
<span class="close cursor" onclick="closeModal()">&times;</span>
  
<div class="modal-content" align="center">
  
<br>
<div class="test" style="width: 70%; float: left">
   <div class="mySlides" style="margin-left: 30px">
      <div class="numbertext">1 / 6</div>
       <img src="img/portfolio/fullsize/a.jpg" style="width:50%;">    
    </div>

    <div class="mySlides">
      <div class="numbertext">2 / 6<!-- 이부분에 id --></div> 
      <img src="img/portfolio/fullsize/cafe.jpg" style="width:50%">
    </div>

    <div class="mySlides">
      <div class="numbertext">3 / 6</div>
      <img src="img/portfolio/fullsize/china.jpg" style="width:50%">
    </div>

    <div class="mySlides">
      <div class="numbertext">4 / 6</div>
      <img src="img/portfolio/fullsize/j.jpg" style="width:50%">
    </div>
        <div class="mySlides">
      <div class="numbertext">5 / 6</div>
      <img src="img/portfolio/fullsize/k.jpg" style="width:50%">
    </div>
        <div class="mySlides">
      <div class="numbertext">6 / 6</div>
      <img src="img/portfolio/fullsize/v.jpg" style="width:50%">
    </div> 

    <!-- Next/previous controls -->
   <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    <!-- Caption text -->
    <div class="caption-container">
      <p id="caption"></p>
    </div>


    <!-- Thumbnail image controls -->
    
<div class="owl-carousel" >
		<div class="item" >
			<img class="demo" src="img/portfolio/fullsize/a.jpg" onclick="currentSlide(1)" >
		</div>
		<div class="item">
			<img class="demo" src="img/portfolio/fullsize/cafe.jpg" onclick="currentSlide(2)">
		</div>
		<div class="item">
			<img class="demo" src="img/portfolio/fullsize/china.jpg" onclick="currentSlide(3)">
		</div>
		<div class="item">
			<img class="demo" src="img/portfolio/fullsize/j.jpg" onclick="currentSlide(4)">
		</div>
		<div class="item">
			<img class="demo" src="img/portfolio/fullsize/k.jpg" onclick="currentSlide(5)">
		</div>
		<div class="item">
			<img class="demo" src="img/portfolio/fullsize/v.jpg" onclick="currentSlide(6)">
		</div>
	</div>
 </div><!-- /test -->
 <div style="width: 30%; float: right">
 <h3>좀 돼라~</h3>
 </div>
  </div> <!-- /content-modals -->

</div> <!-- /modals -->
	



<script type="text/javascript">
	//plugin call
	$('.owl-carousel').owlCarousel({
		loop : true,
		margin : 10,
		nav : true,
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
	});
	//lightbox
	// Open the Modal
function openModal() {
  document.getElementById('myModal').style.display = "block";
}

// Close the Modal
function closeModal() {
  document.getElementById('myModal').style.display = "none";
}

var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
	</script>
</body>
</html>