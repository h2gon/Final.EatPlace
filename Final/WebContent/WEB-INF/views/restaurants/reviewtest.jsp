<%@page import="kh.c.five.model.fileDto"%>
<%@page import="kh.c.five.dao.impl.EatReviewDaoImpl"%>
<%@page import="kh.c.five.dao.EatReviewDao"%>
<%@page import="kh.c.five.model.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no">
<title>더보기(MORE) 버튼을 눌러 일정갯수의 리스트 더 보기</title>
<link type="text/css" rel="stylesheet" href="https://nanati.me/common/css/reset.css" media="screen" />
<!-- <link type="text/css" rel="stylesheet" href="https://nanati.me/common/css/js-load.css" media="screen" /> -->
<script type="text/javascript" src="https://nanati.me/common/js/jquery-1.11.2.min.js"></script>
<style type="text/css">
@charset "UTF-8";
/* CSS Document */

header {
	padding: 0.8em;
	color: #FFF;
	font-size: 150%;
	text-align: center;
	background: #59b1eb;
}
header,
.back {
	margin-bottom: 6rem;
}
#contents {
	max-width: 780px;
	margin: 0 auto;
	text-align: center;
	padding-bottom: 50px;
}

.ad {
	text-align: center;
	border: 1px dotted #ccc;
	max-width: 780px;
	margin: 0 auto 6rem;
}

a.btn {
	background: #59b1eb;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 108%;
	padding: .6em 1em;
	transition: 800ms ease all;
	outline: none;
}
a.btn:hover {
	background: #fff;
	color: #59b1eb;
}
a.btn:before, a.btn::after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #59b1eb;
	transition: 400ms ease all;
}
a.btn::after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}
a.btn:hover:before, a.btn:hover::after {
	width: 100%;
	transition: 800ms ease all;
}


.js-load {
	display: none;
}
.js-load.active {
	display: block;
}
.is_comp.js-load:after {
	display: none;
}
.btn-wrap, .lists, .main {
	display: block;
}
.main {
	max-width: 640px;
	margin: 0 auto;
}
.lists {
	margin-bottom: 4rem;
}
.lists__item {
	padding: 20px;
	background: white;
	font-style: "color : black";
}
.lists__item:nth-child(2n) {
	background: white;
	color: black;
	font-style: "color : black";
}
.btn-wrap {
	text-align: center;
}
.button {
	display: inline-block;
	width: 200px;
	height: 54px;
	text-align: center;
	text-decoration: none;
	line-height: 54px;
	outline: none;
	position: relative;
	z-index: 2;
	background-color: #333;
	border: 2px solid #333;
	color: #fff;
	line-height: 50px;
	margin-bottom: 4rem;
}
.button:hover {
	background-color: #fff;
	border-color: #59b1eb;
	color: #59b1eb;
}
.button::before,
.button::after {
	position: absolute;
	z-index: -1;
	display: block;
	content: '';top: 0;
	width: 50%;
	height: 100%;
	background-color: #333;
}
.button,
.button::before,
.button::after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.button::before {
	right: 0;
}
.button::after {
	left: 0;
}
.button:hover::before,
.button:hover::after {
	width: 0;
	background-color: #59b1eb;
}


footer {
	padding: 1rem;
	font-size: 83%;
	text-align: center;
}
footer a {
	color: #666;
	font-weight: bold;
}
footer a:hover {
	color: #59b1eb;
	text-decoration: underline;
}
</style>
</head>
<header>
  <h1>더보기(MORE) 버튼을 눌러 일정갯수의 리스트 더 보기</h1>
</header>
<body>
<div class="ad"> 
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> 
  <script type="text/javascript">
//JavaScript Document

  $(window).on('load', function () {
  	load('#js-load', '2');
  	$("#js-btn-wrap .button").on("click", function () {
  		load('#js-load', '2', '#js-btn-wrap');
  	})
  });

  function load(id, cnt, btn) {
  	var girls_list = id + " .js-load:not(.active)";
  	var girls_length = $(girls_list).length;
  	var girls_total_cnt;
  	if (cnt < girls_length) {
  		girls_total_cnt = cnt;
  	} else {
  		girls_total_cnt = girls_length;
  		$('.button').hide()
  	}
  	$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
  }
  </script>
  <!-- demo-more-btn-js-load --> 
  <ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1534417142445600"
     data-ad-slot="9710655373"
     data-ad-format="auto"></ins> 
  <script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div>
<div class="row">
<div id="contents" class="col-md-8">
  <div id="js-load" class="main">
    <ul class="lists">
    <%
    EatReviewDao eatReviewDao = EatReviewDaoImpl.getInstance();
    List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("reviewlist");
    int Good=0;
    int soso=0;
    int notGood=0;
    int totalCount = 0;
    String nickName = "";
    String fileName[] = new String[0];
    String id = "";
    
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
    
		for(int i = 0; i < list.size(); i ++){
	
		nickName = eatReviewDao.getNickName(list.get(i).getId());
		if(nickName != "" || !nickName.isEmpty()){
			id = nickName;	
		}else{
		 id = list.get(i).getId();
		 }
		String content = list.get(i).getRs_content();
		
		%>
		<li class="lists__item js-load">
			<table style="width: 100%;">
				<tr>
					<td style="width: 15%; padding-top: 1px; vertical-align: top;"> <%=id %></td>
					<td style="width: 70%; padding-top: 1px; vertical-align: top;"> <%=content %></td>
					<!-- 좋아요 별로 -->
					<!-- <td width="30" style="border: none"> -->
					
					<td style="width: 15%; padding-top: 1px; vertical-align: top;">
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
					<%
					List<fileDto> f_list = eatReviewDao.getRv_Image(list.get(i).getSeq());
					%>					
				</tr>
				<tr>
				<td style="width: 15%; padding-top: 1px; vertical-align: top;"></td>
				<td style="width: 70%; padding-top: 1px; vertical-align: top;">
				<%		
		//List<fileDto> f_list = eatReviewDao.getRv_Image(list.get(i).getSeq());
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
						<img alt="" src="<%=fileName[0] %>" style="width: 75px; height: 75px;" data-toggle="modal" data-target="#carouselModal" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
						<% 
					}else{
					%>
					<img alt="" src="/image/<%=fileName[0] %>" style="width: 75px; height: 75px;" data-toggle="modal" data-target="#carouselModal" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
					
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
					<img alt="" src="<%=fileName[a] %>" style="width: 75px; height: 75px;" data-toggle="modal" data-target="#carouselModal" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
					<%
					}else{
					%>
					<img alt="" src="/image/<%=fileName[a] %>" style="width: 75px; height: 75px;" data-toggle="modal" data-target="#carouselModal" onclick="reviewDetail(<%=list.get(i).getSeq()%>)">
					<% }
					}
			}
		}else if(f_list == null){
			System.out.println("null");
		}	
		
		
		%>	
				</td>
				<td style="width: 15%; padding-top: 1px; vertical-align: top;">
				</td>
				
				</tr>
				
				<tr style="border: none">
				<td colspan="3" width="100" style="border-bottom: 1px solid #c8c8c8;"></td>
				</tr>
				
			</table>
			
		</li>
		<%
		}
	%>   
    </ul>
    <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
  </div>
  </div>
<!--   <p class="back"><a class="btn" href="https://nanati.me/more-btn-js-load/">← 블로그로 돌아가기</a></p> -->
<div class="ad"> 
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> 
    <!-- demo-more-btn-js-load --> 
    <ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-1534417142445600"
     data-ad-slot="9710655373"
     data-ad-format="auto"></ins> 
    <script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>
  <!-- <footer>
    <p>(C) <a href="https://nanati.me/">nanati.me</a> by nanati</p>
  </footer> -->
</div>
</body>
</html>