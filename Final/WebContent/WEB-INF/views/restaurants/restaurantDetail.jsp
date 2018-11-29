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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



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
  width: 80%;
  height: 80%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

/* Modal Content */
.modal-content {
  position: none;
  background-color: rgba(0, 0, 0);
  margin: auto;
  padding: 0;
  width: 80%;
  max-width: 1200px;
}

/* The Close Button */
.close {
  color: white;
  position: auto;
  top: 10px;
  right: 50px;
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
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b79e9996c3bab29b8e5285b04135813&libraries=services"></script>

</head>
<body>

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
					<li class="nav-item"><a class="nav-link" href="about.html"><strong
							style="color: white; margin-left: 20px">About</strong></a></li>
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
	<%
	List<ReviewDto> rvlist = (List<ReviewDto>)request.getAttribute("reviewlist"); //이거 나중에 리뷰랑 합치고 리뷰에서 불러오는거 지우면 됩니다
	List<fileDto> imagelist = (List<fileDto>) request.getAttribute("imagelist");
	%>

	<!-- rest images navigation start(thumbnails) -->
	<div class="owl-carousel">
	<%
	for (int i = 0; i < imagelist.size(); i++) {
		%>
		

			<div class="item">
				<img class="_fvalue" src="\image\<%=imagelist.get(i).getFile_name()%>"	
				alt="" style="height:300px ;width: auto; margin-right: 3px" onclick="openModal(); currentSlide(<%=i+1%>)" value="<%=imagelist.get(i).getFile_name()%>">
			</div>
		
		<%
			}

		%>
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
					<div>
					<span class="title">
						<font size="26" color="#000000" id="rs_seq" value="${rs.seq }">${rs.rs_name }</font>
						
						
					</span>
					
					<div style="align-items: right;vertical-align: center" >
					
					<img id="review_btn" class="review_writing_button" onclick="WriteReview('${rs.seq}');" src="img/button/reviewIcon.png">

					<c:if test="${isLike ne true }">
					<a href="insertLike.do?rs_seq=${rs.seq }&rs_name=${rs.rs_name}&id=${login.id}"><img id="like_btn" src="img/button/likeIcon.png" ></a>
					</c:if>
					<c:if test="${isLike eq true }">
					<a href="#none"><img id="like_btn_delete" src="img/button/likeIconR.png" ></a>
					</c:if>
					</div>
					</div>
			
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
				
				
				</header>

				</section>
		<!-- 리뷰 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~REVIEW~~~~~~~~~~~~~~~~~~~~~~~~-->
				 <%          
         // EatReviewService eatReviewService ;
		  EatReviewDao eatReviewDao = EatReviewDaoImpl.getInstance();
                  
          List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("reviewlist");
          
          
          final int LIST = 5;
          int totalCnt = list.size();
          int pagingCount = totalCnt / LIST;
          int remainList = totalCnt % LIST; 
          int Good=0;
          int soso=0;
          int notGood=0;
          int totalCount = 0;
          String nickName = "";
          String fileName[] = new String[0];
          
          if(!list.isEmpty()){
          
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
          System.out.println("notGood Count:"+notGood+"soso Count:"+soso+"Good:"+Good);
         
                  
                    
          %>
		
				
		<hr>
		<section class="module review-container">
            <div class="title_fliter_wrap">
              <h2 class="title only-mobile">${rs.rs_name }'s 리뷰</h2>
              <h2 class="title only-desktop">리뷰 <span class="review-container-review-count">(<%=totalCount %>)</span></h2>
                <ul class="review_fliter_list" style="text-align: right;">
                 
                    <button class="btn active" data-review_count="<%=totalCount %>" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEALL')" ng-class="{selected: action_values === undefined, not_selected_btn: 36 == 0}" ng-click="get_review_list(undefined, $event)">전체
                      (<%=totalCount %>)
                    </button>
                     <button class="btn" data-review_count="<%=Good %>" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEGOOD')" ng-class="{selected: action_values === 3, not_selected_btn: 27 == 0}" ng-click="get_review_list(3, $event)">맛있다
                      (<%=Good %>)
                    </button>
                    <button class="btn" data-review_count="<%=soso %>" onclick="common_ga(get_now_page_code(), 'CLICK_TASTESOSO')" ng-class="{selected: action_values === 2, not_selected_btn: 7 == 0}" ng-click="get_review_list(2, $event)">괜찮다
                      (<%=soso %>)
                    </button>
                    <button class="btn" data-review_count="<%=notGood %>" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEBAD')" ng-class="{selected: action_values === 1, not_selected_btn: 2 == 0}" ng-click="get_review_list(1, $event)">별로
                      (<%=notGood %>)
                    </button>
                  
                </ul>
            </div>   
           
          </section>
          
         
         
		<div class="review_main">
		
		
		<table border="1">
		<%if(list.size()<5){
		
			for(int i = 0 ; i< list.size();i++){	
		%>
		<tr>
		
		 <td style="width: 700px;">
		<!-- <label> -->
		
		<%
		 nickName = eatReviewDao.getNickName(list.get(i).getId());
		 System.out.println("nickName:"+nickName+" id: "+list.get(i).getId());
		%>
		
		<%-- 아이디 : <%=list.get(i).getId() %>	 --%>
		<div style="size: 100px; position: relative;">
		<span style="position: absolute; text-align: center; line-height: 60px; width: 63px; height: 100px;">
		<%=nickName %>
		</span>
		<img alt="" src="./image/circular-shape-silhouette (1).png">
		</div>
		
		<%-- 닉네임 : <%=nickName %> --%>
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
	
		<!-- </label> -->
		
		<span style="text-align: right;">
		<input type="text" style="width: 480px;" name="content" value="<%=list.get(i).getRs_content()%>">
		
		<%
		int rv_seq = list.get(i).getSeq();
		
		System.out.println("rv_seq:"+rv_seq);
		
		List<fileDto> f_list = eatReviewDao.getRv_Image(rv_seq);
		if(f_list != null){
			System.out.println("not null");
			for(int a = 0;a<f_list.size();a++){
				
			if(f_list.size()==1){
				fileName = new String[1];			
				fileName[0] = f_list.get(a).getFile_name();
				System.out.println("f_list.size(): "+f_list.size());
				System.out.println("fileName has just 1:"+fileName[0]);
				%>
				<img alt="" src="/image/<%=fileName[0] %>" style="width: 75px; height: 75px;">
				<% 
			}
			else{
				fileName = new String[f_list.size()];				
				fileName[a] = f_list.get(a).getFile_name();
				System.out.println("f_list.size(): "+f_list.size());
				System.out.println("fileName more than 1:"+fileName[a]);
				%>
				<img alt="" src="/image/<%=fileName[a] %>" style="width: 75px; height: 75px;">
				<%
				}
			}
		}else if(f_list == null){
			System.out.println("null");
		}			
		%>
	
		
		
		</span>
							 
		 </td>	
		 			       
        </tr>
		
		
		
		<%} %>	
		
		<%}else{ %>
		
		
		<%
		//reviewlist more than 5----------------------------------------------------------
		/* for(int i =0 ; i<list.size() ; i++){  */
		for(int i =0 ; i<5 ; i++){ %>
		<tr>
		
		 <td style="width: 700px;">
		<!-- <label> -->
		
		
		<%
		 nickName = eatReviewDao.getNickName(list.get(i).getId());
		 System.out.println("nickName:"+nickName+" id: "+list.get(i).getId());
		%>
				
		<%-- 아이디 : <%=list.get(i).getId() %>	
		닉네임 : <%=nickName %> --%>
		<div style="size: 100px; position: relative;">
		<span style="position: absolute; text-align: center; line-height: 60px; width: 63px; height: 100px;">
		<%=nickName %>
		</span>
		<img alt="" src="./image/circular-shape-silhouette (1).png">
		</div>
		
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
		
		<!-- </label> -->
		<span style="text-align: right;">				
		<input type="text" style="width: 480px;" name="content" value="<%=list.get(i).getRs_content()%>">
		
		<%-- <form action="getImage.do?rv_seq=<%=list.get(i).getSeq() %>"> --%>
		<%		
		List<fileDto> f_list = eatReviewDao.getRv_Image(list.get(i).getSeq());
		//List<String> f_list = (List<String>) request.getAttribute("getImg");
		
		if(f_list != null){
			System.out.println("not null");
			for(int a = 0;a<f_list.size();a++){
				if(f_list.size()==1){
					fileName = new String[1];			
					fileName[0] = f_list.get(a).getFile_name();
					//fileName[0] = f_list.get(a);
					System.out.println("f_list.size(): "+f_list.size());
					System.out.println("fileName has just 1:"+fileName[0]);
					%>
					<img alt="" src="/image/<%=fileName[0] %>" style="width: 75px; height: 75px;">
					<% 
				}
				else{
					fileName = new String[f_list.size()];				
					fileName[a] = f_list.get(a).getFile_name();
					//fileName[a] = f_list.get(a);
					System.out.println("f_list.size(): "+f_list.size());
					System.out.println("fileName more than 1:"+fileName[a]);
					%>
					<img alt="" src="/image/<%=fileName[a] %>" style="width: 75px; height: 75px;">
					<% 
					}
			}
		}else if(f_list == null){
			System.out.println("null");
		}	
		
		
		%>		
		
		<!-- <input name="file" type=file id="input_imgs" multiple/>
		<div class="imgs_wrap">
		<br>
       
       	</div> -->
       
     
        <%-- <img alt="" src="/image/<%=fileName %>" style="width: 75px; height: 75px;"> --%>
       	
		
		
		<%-- </form> --%>
			 </span>
		 </td>	
		 			       
        </tr>
         <%}
		}
		}
         %>
         </table>
         
         </div>
       <script type="text/javascript">
       function morelist() {
    	   var x = d
       }
		
	
       
       </script>

		
       <br><br>
          <!-- review_main end -->


	
		</div>
		</div>
	</div>
	
		<!-- Footer -->
	<footer class="py-5 bg-dark" style="position: absolute; width: 100%;">
			<div class="container" >
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2018</p>

			</div>
	</footer>
		<!-- The Modal will open  -->
	<div id="myModal" class="modal">
	<br>
	<span class="close cursor" onclick="closeModal()">&times;</span>  
		<div class="modal-content" align="center">
  		<br>
  			
		 <%		 	
		  //  for (int i = 0; i < imagelist.size(); i++) {
			   %>
			   
			   <iframe id="myframe"name="myFrame" src="" frameborder="0" marginwidth="0" marginheight="0" frameborder="0" 
			   style="width: 640px; height: 480px; align-content: center; margin-top: 20px"></iframe>
			 
			  <div class="mySlides" style="margin-left: 30px; width: 640px; height: auto" >
		        <%-- <img class="_fvalue" src="\image\<%=imagelist.get(i).getFile_name()%>" style="width:50%;" value="\image\<%=imagelist.get(i).getFile_name()%>">    
		       <img id="mySlides" src="" style="width:50%;" value="">   --%>
		       		       		
		       </div>
		    	
			   <%
	//	   }
		   %>
		<br>

	<!-- Thumbnail image controls -->
  
	<div class="owl-carousel">
	<button onclick="func()">button</button>
	<%
		for (int i = 0; i < imagelist.size(); i++) {
			%>
			<div class="item">
				
			<a href="\image\<%=imagelist.get(i).getFile_name()%>" target="myFrame">	
				<img class="_fvalue1" id="_fvalue1" src="\image\<%=imagelist.get(i).getFile_name()%>"	
				
					<%-- alt="이미지없음" style="height:150px ;width: auto" onclick="currentSlide(<%=i+1%>)" --%>
					alt="이미지없음" style="height:150px; width: auto; max-width: 300px; margin-right: 3px" >
			</a>
					<%-- value="<%=imagelist.get(i).getFile_name()%>" cslide="<%=i+1%>"> --%>
				<br>
			</div>
			<%
		}
	%>
	</div><!-- /thumbnail -->

<div style="background-color: white; height: auto">
   <p id="revCont">tests</p>
   </div>

    <!-- Next/previous controls -->
   <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    <!-- Caption text -->
    <div class="caption-container">
      <p id="caption"></p>
      
    </div>


   
  </div> <!-- /content-modals -->

</div> <!-- /modals -->
	

      
  
<script type="text/javascript">
 
function func() {
	alert("func");

	var revData={
			//int seq, String o_name, String file_name, long file_size, int rs_seq
			'seq':120, //temp
			'o_name':null, //temp
			'file_name':"test.txt",
			'file_size':1231540, //temp
			'rs_seq':123
	};
	
	$.ajax({
		datatype:'json',
		url:"getRPdetail.do",
		data:revData,
		type:'post',
		async:true,
		success:function(data){
			alert("success");
	//		alert(rcontent);
			
		},
		error:function(req, stu, err){
			alert("error");
			alert(stu + " " + err);
		}
	}); 
}
 

$("._fvalue1").on("click", function () {
	var pic_link=$(this).attr("src");
	var filename=pic_link.substring(7);
	$('#myframe').attr("src",pic_link);
	showSlides(slideIndex = <%=imagelist.size() %>);
	
//	$("._fvalue1").attr("width",640px);
//	$("._fvalue1").attr("height",480px);

	
var rs_seq=$("#rs_seq").val();
var file_name=$(this).attr("src"); 
 	var revData={
			//int seq, String o_name, String file_name, long file_size, int rs_seq
			'seq':120, //temp
			'o_name':null, //temp
			'file_name':filename,
			'file_size':1231540, //temp
			'rs_seq':$("#rs_seq").attr("value")
	};
 	
 	alert(revData.file_name);
 	
	$.ajax({
		datatype:'json',
		url:"getRPdetail.do",
		data:revData,
		type:'post',
		async:true,
		success:function(data){
			alert("success");
	//		alert(rcontent);
			
		},
		error:function(req, stu, err){
			alert(stu + " " + err);
		}
	}); 
 	
});

$("._fvalue").on("click", function () {		
//	alert("click");
	var pic_link=$(this).attr("src");
//	alert(pic_link);
//	alert($(this).attr("src"));
	$('#myframe').attr("src",pic_link);
	showSlides(slideIndex = <%=imagelist.size() %>);
//	showSlides(slideIndex=1);
});

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
				items : 4
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


//var slideIndex = 1;
//showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

/* // Thumbnail image controls
function currentSlide(n) {
	
	showSlides(slideIndex = n);

} 
  
}); */
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


function showSlides(n) {
  var i;
  var ii = <%=imagelist.size() %>
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");

  if (n > ii) {slideIndex = 1}

  if (n < 1) {slideIndex = ii}

	    
 	  
  for (i = 0; i < ii; i++) {
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
	
</body>
</html>