<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>

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
        
        
            <li class="nav-item dropdown" id="before">
              
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	LOGIN
              </a>        
				
                <div  class="dropdown-menu dropdown-menu-right" id="kakao_btn_changed" aria-labelledby="navbarDropdownPortfolio">
					<a  class="dropdown-item" href="regi.do" style="text-align: center;">회원가입</a>					
					<a  class="dropdown-item" id="kakao-login-btn">	
					</a>
				</div>				
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
	             
	              <div style="padding-top: 64px; width: 550px; margin-left: 375px;">				
				    <input style=" width: 150%; height:60px; padding: 12px 24px; background-color: transparent; transition: transform 250ms ease-in-out; font-size: 14px;
       					line-height: 18px; color: #575756; background-color: #e9ecef; background-image: url(http://mihaeltomic.com/codepen/input-search/ic_search_black_24px.svg);
        				background-repeat: no-repeat; background-size: 18px 18px; background-position: 95% center; border-radius: 50px; border: 5px solid #ff7100;
        				transition: all 250ms ease-in-out; backface-visibility: hidden; transform-style: preserve-3d;" type="text" placeholder="지역, 식당 또는 음식">
        			
        			<!-- 
					<aside class="search-keywords-container" ng-controller="mp20_search_list_controller" ng-cloak>
					  <nav class="tab-keywords" ng-show="!keyword">
					    <button class="searching_tap_recommend searching_tap"
					            onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECOMMEND')"
					            ng-click="select_tab_by_recommend()">
					      추천 검색어
					    </button>
					    <button class="searching_tap_trending searching_tap"
					            onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_POPULAR')"
					            ng-click="select_tab_by_popular()">
					      인기 검색어
					    </button>
					    <button class="searching_tap_recent searching_tap"
					            onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT')"
					            ng-click="select_tab_by_lately()">
					      최근 검색어
					    </button>
					  </nav>
					
					   검색 자동완성
					  <div class="keywords">
						  <div class="list-keywords-wrap">
						    <ol class="list-keywords" ng-class="{'no_tab': keyword}">
						      <li class="list-keyword"
					            ng-repeat="item in show_keyword_list track by $index"
					            ng-class="{'selected': $index == pointer}"
					            ng-click="go_to_link(item, item.keyword, $event)">
						        <a href="#" category="{{item.display_text}}" onclick="return false;" ng-bind="item.keyword"></a>
						        <div class="search_result_delete"
					               ng-show="selected_tab == constant.lately_tab_name"
					               ng-click="remove_lately_keyword($index, $event)"
					               onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT_CANCEL')">
					          </div>
						      </li>
					
							    <li class="clear_all"
					            ng-show="selected_tab === 'lately' && show_keyword_list.length">
					          <button ng-click="remove_lately_keyword_all()"
					                  onclick="common_ga(get_now_page_code(), 'CLICK_SEARCH_RECENT_CLEAR')">
					            x clear all
					          </button>
					        </li>
					
						      <li class="no_lately_keyword"
					            ng-show="selected_tab === 'lately' && !show_keyword_list.length">
					          최근 검색어가 없습니다.
					        </li>
						    </ol>
						  </div>
					  </div>
					</aside> -->

				</div>
	 
	          </div> 
	        </div>
	      </div>
	  
    </header>


	<br><br>
    <!-- Portfolio Section -->
      

      <div class="row" style="margin-left: 65px; margin-right: 65px">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project One</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Two</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Three</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Four</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Five</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Six</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
            </div>
          </div>
        </div>
      </div>
 	
 	<section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/1.jpg">
              <img class="img-fluid" src="img/portfolio/thumbnails/1.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/2.jpg">
              <img class="img-fluid" src="img/portfolio/thumbnails/2.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/3.jpg">
              <img class="img-fluid" src="img/portfolio/thumbnails/3.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/4.jpg">
              <img class="img-fluid" src="img/portfolio/thumbnails/4.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/5.jpg">
              <img class="img-fluid" src="img/portfolio/thumbnails/5.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/6.jpg">
              <img class="img-fluid" src="img/portfolio/thumbnails/6.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    Project Name
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





  </body>






</html>
