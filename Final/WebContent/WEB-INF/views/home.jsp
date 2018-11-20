<%@page import="kh.c.five.model.RegiDto"%>
<%@page import="java.util.List"%>
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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"> 
//<![CDATA[
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
	
 
	
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
       
	        <div class="carousel-inner" role="listbox">
	         
	           <div class="carousel-item active" style="text-align: center; padding-top: 150px; background-image: url('img/main_food.jpg');">
	            
	            <h1 style="color: white;"><strong>솔직한 리뷰, 믿을 수 있는 평점!</strong></h1>
	              <h1 style="color: white;"><strong>EAT PLACE</strong></h1> 
	             
	             <form action="" id="main-search" name="main-search" method="post">
	              <div style="padding-top: 64px; width: 550px; margin-left: 375px;">				
				    <input type="search" id="main-keyword" name="main-keyword" onkeypress="if(event.keyCode==13){search();}" style="width: 150%; height: 60px; padding: 12px 24px; background-color: transparent; color: #575756; background-color: #e9ecef;
    						border-radius: 50px; border: 5px solid #ff7100; float: left;" placeholder="지역, 식당 또는 음식">	        			 
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
    
     for(int i=0; i<6; i++){
    %>	 
        <div class="col-lg-4 col-sm-6 portfolio-item" style="height: 400px; width: 430px;">
        
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="\image\<%=RankList.get(i).getRs_picture() %>" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="rsdetail.do?seq=<%=RankList.get(i).getSeq() %>"><%=RankList.get(i).getRs_name() %></a>
              </h4>
              <p class="card-text"><%=RankList.get(i).getRs_address1() %> - <%=RankList.get(i).getRs_category() %></p>
            </div>
          </div>
        </div>
   
    <%}%>
    
       </div>
 	<section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="img/portfolio/fullsize/1.jpg">
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
            <a class="portfolio-box" href="img/portfolio/fullsize/2.jpg">
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
            <a class="portfolio-box" href="img/portfolio/fullsize/3.jpg">
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
            <a class="portfolio-box" href="img/portfolio/fullsize/4.jpg">
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
            <a class="portfolio-box" href="img/portfolio/fullsize/5.jpg">
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
            <a class="portfolio-box" href="img/portfolio/fullsize/6.jpg">
              <img class="img-fluid" src="img/portfolio/fullsize/v.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    Category
                  </div>
                  <div class="project-name">
                    	뷔폐
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
	  //alert("main-keyword = " + keyword);
	  
}
    
 


</script>



  </body>






</html>
