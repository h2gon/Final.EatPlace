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
</style>
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
			<img src="img/portfolio/fullsize/1.jpg">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/2.jpg">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/3.jpg">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/4.jpg">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/5.jpg">
		</div>
		<div class="item">
			<img src="img/portfolio/fullsize/6.jpg">
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
						<!-- 조회수 -->
						</span> 
						<span class="cnt review">
							<span class="hidden"><img src="img/button/review.png"></span>
							<span>
									<!-- 리뷰수 -->
							</span>
						</span> 
						<span class="cnt favorite">
							<span class="hidden"><img src="img/button/fav.png"></span>
							<!-- 즐겨찾기 수 -->
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
						<br>
						<img src="img/button/hr.png">



						</tbody>
					</table>
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
				<div class="title_fliter_wrap">
					<!-- <h2 class="title only-desktop">리뷰 <span class="review-container-review-count">(3)</span></h2>
                <ul class="review_fliter_list">
                  <li class="review_fliter_item">
                    <button class="review_fliter_item_btn selected" data-review_count="3" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEALL')" ng-class="{selected: action_values === undefined, not_selected_btn: 3 == 0}" ng-click="get_review_list(undefined, $event)">전체
                      (3)
                    </button>
                  </li>
                  <li class="review_fliter_item">
                    <button class="review_fliter_item_btn" data-review_count="2" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEGOOD')" ng-class="{selected: action_values === 3, not_selected_btn: 2 == 0}" ng-click="get_review_list(3, $event)">맛있다
                      (2)
                    </button>
                  </li>
                  <li class="review_fliter_item">
                    <button class="review_fliter_item_btn" data-review_count="1" onclick="common_ga(get_now_page_code(), 'CLICK_TASTESOSO')" ng-class="{selected: action_values === 2, not_selected_btn: 1 == 0}" ng-click="get_review_list(2, $event)">괜찮다
                      (1)
                    </button>
                  </li>
                  <li class="review_fliter_item">
                    <button class="review_fliter_item_btn not_selected_btn" data-review_count="0" onclick="common_ga(get_now_page_code(), 'CLICK_TASTEBAD')" ng-class="{selected: action_values === 1, not_selected_btn: 0 == 0}" ng-click="get_review_list(1, $event)">별로
                      (0)
                    </button>
                  </li>
                </ul> -->
				</div>


				<p class="no_review_message" style="display: none;"
					onclick="common_ga('PG_RESTAURANT', 'CLICK_DOWNLOAD_REVIEW');go_to_app_restaurant_and_market($('.pg-restaurant').data('restaurant_uuid')); "
					data-event_term="V1" data-event_name="CLICK_DOWNLOAD_REVIEW">
					아직 작성된 리뷰가 없네요.<br> <span class="desc">앱에서 해당 식당의 첫 리뷰를
						작성해주시겠어요?</span>
				</p>
				</section>
			</div>
		</div>
	</div>
	<table style="width: 70%">

	</table>

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
		})
	</script>
</body>
</html>