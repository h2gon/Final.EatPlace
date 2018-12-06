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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
  background: #0c83e7;
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

</style>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #c53211;  padding-bottom: 10px;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.do" style="color: white; margin-left: 10px">EAT PLACE</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item">
        	<a class="nav-link"	href="restaurntsList.do">
        		<strong	style="color: white; margin-left: 20px">맛집 리스트</strong>
        	</a>
        </li>
        <li class="nav-item">
        	<a class="nav-link"	href="restaurantsInsert.do">
        		<strong	style="color: white; margin-left: 20px">맛집 추가</strong>
        	</a>
        </li>
		<li class="nav-item" style="margin-left: 20px">
			<a onclick="document.getElementById('id01').style.display='block'" class="w3-btn">
				<img alt=""	src="img/main/man-user.png">
			</a>
		</li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<%
List<ReviewDto> rvlist = (List<ReviewDto>)request.getAttribute("reviewlist");
List<fileDto> imagelist = (List<fileDto>) request.getAttribute("imagelist");
%>  

<div class="modal fade" id="carouselModal" tabindex="-1" role="dialog" aria-labelledby="carouselModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="carouselModalLabel">${rs.rs_name }</h4>
      </div>
      <div class="modal-body">
<div class="customNavigation">
  <a class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
  <a class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
</div>
	<div class="row">
	<div class=" col-md-8">
	    <div id="sync1" class="owl-carousel"><!-- 이게 큰거 -->
        	<div class="item"><img id="mainImage" src="" class="img-responsive"></div>
        </div>
     </div>   
   		<div class="col-md-4">
   			<div class="col-xs-8">
	   			<p id="p_id">${review.id }</p>
	   			<img src="img/button/review.png">review count<img alt="" src="img/button/fav.png">
	   		</div>
   			<div class="col-xs-4" style="align-content: right">
   				<img id = "p_ratingP" alt="" src="./img/like/3-1.png" style="width: 45px; height: auto" msg="3" title="3점" >
   			</div>
   			<br>
   			<hr>
   			<br>
   			<div>
   				<p id="pause" ></p>
   			</div>
   		</div>
   </div>
	<div>  
	
	
		
		<%-- <c:choose>
		<c:when test="${review.rs_rating eq 1 }">
		<img alt="" src="./img/like/1-1.png" style="width: 60px;" msg="1" title="1점" >
		</c:when>
		<c:when test="${review.rs_rating eq 3 }">
		<img alt="" src="./img/like/3-1.png" style="width: 60px;" msg="3" title="3점" >
		</c:when>
		<c:when test="${review.rs_rating eq 5 }">
		<img alt="" src="./img/like/5-1.png" style="width: 60px;" msg="5" title="5점" >
		</c:when>
		</c:choose> --%>
	
	
	</div>
        <div id="sync2" class="owl-carousel thumbnails-wrap"> <!-- 이게 아래에 있는 썸네일 -->
        		<%
		for (int i=0;i<imagelist.size();i++){
			if(imagelist.get(i).getFile_name().contains("https://")){
				%>
				<div class="item"><img src="<%=imagelist.get(i).getFile_name()%>" class="img-responsive"></div>
				<%
			}else{
				%>
		          <div class="item"><img src="\image\<%=imagelist.get(i).getFile_name()%>" class="img-responsive"></div>
		          <%
			}
		
		}
          %>
          
        </div>     
      </div>
      
    </div>
  </div>
</div>

<!-- Navigation
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
	</nav> -->

<%
if(imagelist==null||imagelist.size()<3){
	%>
	이미지가 등록된 리뷰가 없다..고 띄워야 함.
	<%
}else{
	%>
	<br>
	<br>
	<br>
	<div class="owl-carousel123 owl-theme" style="margin-top: 50px" >
<%
for(int i=0;i<imagelist.size();i++){
%>
	<div class="item" id="owlImages">
	<a href="#" data-toggle="modal" data-target="#carouselModal">
		<img src="<%=imagelist.get(i).getFile_name()%>" style="height: 300px; margin-right: 3px">
	</a>
	</div>
<%
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
	margin : 10,
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
</script>

 <br>
 <br>
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
					<div class="col-md-8">
							<font size="26" color="#000000" id="rs_seq" value="${rs.seq }">${rs.rs_name }</font>
					</div>		
							<div class="col-md-4">  
								<img id="review_btn" class="review_writing_button" onclick="WriteReview('${rs.seq}');" src="img/button/reviewIcon.png">
								<c:if test="${isLike ne true }">
								<a href="insertLike.do?rs_seq=${rs.seq }&rs_name=${rs.rs_name}&id=${login.id}"><img id="like_btn" src="img/button/likeIcon.png" ></a>
								</c:if>
								<c:if test="${isLike eq true }">
								<a href="#none"><img id="like_btn_delete" src="img/button/likeIconR.png" ></a>
								</c:if>
							</div>
						</span>
					
						
					</div>
			
					<div class="status branch_none">
						 
						<span class="cnt hit">
							<img src="img/button/readcount.png">
						<!-- 조회수 --> ${rs.rs_readcount } 
						</span> 
						<span class="cnt review">
							<img src="img/button/review.png">							<span>
						<!-- 리뷰수 -->${reviewcount }
							</span>
						</span> 
						<span class="cnt favorite">
							<img src="img/button/fav.png">
						<!-- 즐겨찾기 수 -->${likescount }
						</span>
						<br>
						<img src="img/button/hr.png">
						
					</div>

                
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
		
		<table>
		<%if(list.size()<5){
		
			for(int i = 0 ; i< list.size();i++){	
		%>
		<tr style="border: none;">
		
		 <td style="text-align: center; width: 66; border: none;" >
		
		<%
		 nickName = eatReviewDao.getNickName(list.get(i).getId());
		 System.out.println("nickName:"+nickName+" id: "+list.get(i).getId());
		%>
		
		<%if(nickName != "" || !nickName.isEmpty()){ %>		
		<div style="size: 80px; position: relative;">
		<span style="position: absolute; text-align: center; line-height: 60px; width: 63px; height: 100px;">
		<%=nickName %>
		</span>
		<img alt="" src="./img/circular-shape-silhouette (1).png">
		</div>
		<%}else{ %>
		<div style="size: 80px; position: relative;">
		<span style="position: absolute; text-align: center; line-height: 60px; width: 63px; height: 100px;">
		<%=list.get(i).getId() %>
		</span>
		<img alt="" src="./img/circular-shape-silhouette (1).png">
		</div>
		
		<%} %>		
						
		</td>
		
		<!-- 내용  -->		
		<td width="80" style="border: none">
		<%-- <input type="text" style="width: 480px;" name="content" value="<%=list.get(i).getRs_content()%>"> --%>
		<textarea rows="7" cols="70" style="border: 0;" readonly="readonly"><%=list.get(i).getRs_content()%></textarea>
		</td>
		
		<!-- 좋아요,싫어요,별로 -->
		<td width="30" style="border: none">
		
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
		</tr>
		<!--  -->
		<tr>
		<td width="66" style="border: none">
		</td> 
		<td width= "80" style="border: none" >
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
				if(fileName[0].contains("https://")){
					%>
					<img alt="" src="<%=fileName[0] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=rv_seq%>)">
					<% 
				}else{
				%>
				<img alt="" src="/image/<%=fileName[0] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=rv_seq%>)">
				<%} 
			}
			else{
				fileName = new String[f_list.size()];				
				fileName[a] = f_list.get(a).getFile_name();
				System.out.println("f_list.size(): "+f_list.size());
				System.out.println("fileName more than 1:"+fileName[a]);
				if(fileName[a].contains("https://")){
					%>
					<img alt="" src="<%=fileName[a] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=rv_seq%>)">
					<%
				}else{
				%>
				<img alt="" src="/image/<%=fileName[a] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=rv_seq%>)">
				<%
				 }
				}
			}
		}else if(f_list == null){
			System.out.println("null");
		}			
		%>		
		</td>
		
		<td style="border: none">
		</td>
					 			       
        </tr>
        
        <tr style="border: none">
		<td colspan="3" width="80" style="border-bottom: 1px solid #c8c8c8;"><!-- <img alt="-----------------------------------------------" src=""> --></td>
		</tr>		 			       
        	
        
		<%} %>	
		
		<%}else{ %>
		
		
		<%
		//reviewlist more than 5----------------------------------------------------------
		for(int i =0 ; i<list.size() ; i++){ %> 
		<%-- for(int i =0 ; i<5 ; i++){ %> --%>
		<tr style="border: none" id="_tr<%=i %>" name="_tr<%=i %>">		
		<td style="text-align: center; border: none;" width="66;">
		<!-- <label> -->
		
		
		<%
		 nickName = eatReviewDao.getNickName(list.get(i).getId());
		 System.out.println("nickName:"+nickName+" id: "+list.get(i).getId());
		%>
				
		<%if(nickName != "" || !nickName.isEmpty()){ %>		
		<div style="size: 80px; position: relative;">
		<span style="position: absolute; text-align: center; line-height: 60px; width: 63px; height: 100px;">
		<%=nickName %>
		</span>
		<img alt="" src="./img/circular-shape-silhouette (1).png">
		</div>
		<%}else{ %>
		<div style="size: 80px; position: relative;">
		<span style="position: absolute; text-align: center; line-height: 60px; width: 63px; height: 100px;">
		<%=list.get(i).getId() %>
		</span>
		<img alt="" src="./img/circular-shape-silhouette (1).png">
		</div>
		
		<%} %>
		</td>		
		<td style="border: none">
		<textarea rows="7" cols="70" style="border: 0;" readonly="readonly"><%=list.get(i).getRs_content()%></textarea>
		</td>
		<!-- 좋아요 별로 -->
		<td width="30" style="border: none">
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
		</tr>
		
		
		<!--  -->
		<tr style="border: none" id="_tr<%=i %>" name="_tr<%=i %>">
		<td width="66" style="border: none">
		</td> 
		<td style="border: none">
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
					if(fileName[0].contains("https://")){
						%>
						<img alt="" src="<%=fileName[0] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
						<% 
					}else{
					%>
					<img alt="" src="/image/<%=fileName[0] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
					
					<%} 
				}
				else{
					fileName = new String[f_list.size()];				
					fileName[a] = f_list.get(a).getFile_name();
					//fileName[a] = f_list.get(a);
					System.out.println("f_list.size(): "+f_list.size());
					System.out.println("fileName more than 1:"+fileName[a]);
					if(fileName[a].contains("https://")){
					%>
					<img alt="" src="<%=fileName[a] %>" style="width: 75px; height: 75px;" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
					<%
					}else{
					%>
					<img alt="" src="/image/<%=fileName[a] %>" style="width: 75px; height: 75px;" data-toggle="modal" data-target="#myModal"<%-- onclick="reviewDetail(<%=list.get(i).getSeq()%>)" --%>>
					<% }
					}
			}
		}else if(f_list == null){
			System.out.println("null");
		}	
		
		
		%>	
		</td>
		<td style="border: none">
		</td>	
		</tr>
				
		
		<tr style="border: none">
		<td colspan="3" width="80" style="border-bottom: 1px solid #c8c8c8;"><!-- <img alt="-----------------------------------------------" src=""> --></td>
		
		</tr>
		
                               
         <%}
		 }
		}
         %>
         </table>
  <!-- Review Modal -->       
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal with Dark Overlay</h4>
        </div>
        <div class="modal-body">
          <p>This modal has a dark overlay.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
         
         <%if(list.size()>5){
         %>
         
         <button onclick="show_morelist()">더보기</button> 
         
         <%}
          
         %>
         </div>
         
       
         
       <script type="text/javascript">
     	function reviewDetail(seq) {
			alert("seq:"+seq);
			$("#myModal").modal({backdrop:"static"});
			
			//location.href = "reviewDetail.do?seq="+seq;
		}
       
       function show_morelist(index) {
    	  /*  var Rv_array = [];
    	   var temp, item, a, i, id;
    	      	   
    	   console.log("review_item: "+review_item);
    	   Rv_array = review_item.split("],");
    	   console.log("Rv_array.length: "+Rv_array.length);
    	   
    	   var remain_array = new Array[Rv_array.length - 5];
    	       	       	   
    	    for(i = 0;i<Rv_array.length;i++){
    	  	console.log("console array: "+Rv_array[i]);
    	    } */
    	  	
    	   	    	  
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
			var	filename=img;
		}else if(img.indexOf("https://")==-1){
			var filename=img.substring(7);
		} 
		
		
		//alert(filename);
		$('#mainImage').attr("src",img);
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
		 var img=$(this).attr('src');
		//	alert(img);
			$('#mainImage').attr("src",img);
			
			var revData = {
					'filename':filename,
					'rseq':$("#rs_seq").attr("value")
			};
			
			//var test=$("#rs_seq").attr("value");
			alert("success1");
			 $.ajax({
				url:"getRPdetail.do",
				datatype:'json',
				data:revData,
				type:'post',
				async:true,
				success:function(data){
					//alert("success");
					alert(data.review.rs_content);
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
	    sync1.trigger('owl.next');
	  });
	  $(".prev").click(function(){
	    sync1.trigger('owl.prev');
	  });
	 
	  sync2.owlCarousel({
	    items : 6,
	    itemsDesktop      : [1199,6],
	    itemsDesktopSmall     : [979,6],
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
 
function WriteReview(seq) {
	location.href='WriteReview.do?seq='+seq;
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