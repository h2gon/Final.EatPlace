<%@page import="kh.c.five.model.EatMemberDto"%>
<%@page import="kh.c.five.model.RegiDto"%>
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



<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/creative.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 지도API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b79e9996c3bab29b8e5285b04135813"></script>



</head>


<body>
<%

//로그인 세션
EatMemberDto login = (EatMemberDto)request.getSession().getAttribute("login");

//System.out.println(login.toString());

//맛집 정보 dto
RegiDto dto = (RegiDto)request.getAttribute("dto");
//여기서 list(get review list)

int reviewcount = (int)request.getAttribute("reviewcount");

%>


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

<div align="center">
<br>
<h3><%=dto.getRs_name() %>에 대한 솔직한 리뷰를 써주세요.</h3>

 <form action = "writeReviewAf.do" method="post" enctype="multipart/form-data">
 
 <input type="hidden" name="rs_seq" value="<%=dto.getSeq()%>">
 	<input type="hidden" name="id" value="<%=login.getId()%>">
   
		<div class="star">
		<input type = "hidden" id="rs_rating" name = "rs_rating" value = "5">
		<img alt="" src="./img/like/1-1.png" id="p1" msg="1" title="1점" >
		<img alt="" src="./img/like/3-1.png" id="p3" msg="3" title="3점" >
		<img alt="" src="./img/like/5-2.png" id="p5" msg="5" title="5점" >
		</div> 
		
		<table>
			<tr>
				<td>아이디</td>
				<td><%=login.getId() %></td>
			</tr>
			<tr>
				<td><p style="color: grey">리뷰수</p></td>
				<td><%=reviewcount %></td>
			</tr>
			
			
		</table>
		
        
        <br>
        <br>
     
        <textarea rows="10" cols="50" name='rs_content' style="resize: none" placeholder="<%=login.getName() %> 회원님 솔직한 리뷰 부탁드립니다." id="rs_content"></textarea>
        
  
        
        <br><br>
         <!-- <input type="file" name="file" multiple="multiple"> -->
       <input name="file" type=file id="input_imgs" multiple/>
		<div class="imgs_wrap">
		<br>
       
       	</div>
       	
       	<br><br>
        <input type = "submit" value ="리뷰작성">
        <input type="button" value="돌아가기" onclick="history.back();">
    </form>
               
     <br><br>          
               
      </div>
            
</header>
</div>


<script type="text/javascript">
$(function () {
	$("#p1").click(function () {
		var aName = $(this).attr("msg");
		$("#p1").attr('src','./img/like/1-2.png');
		$("#p3").attr('src','./img/like/3-1.png');
		$("#p5").attr('src','./img/like/5-1.png');
		
		
		$("#rs_rating").val(1); 
		
/* 		alert($("#rs_rating").val()); */
	});	
	
	
	$("#p3").click(function () {
		var aName = $(this).attr("msg");
		$("#p1").attr('src','./img/like/1-1.png');
		$("#p3").attr('src','./img/like/3-2.png');
		$("#p5").attr('src','./img/like/5-1.png');
		
		$("#rs_rating").val(3); 
		
	/* 	alert($("#rs_rating").val()); */
	});	
	
	$("#p5").click(function () {
		var aName = $(this).attr("msg");
		$("#p1").attr('src','./img/like/1-1.png');
		$("#p3").attr('src','./img/like/3-1.png');
		$("#p5").attr('src','./img/like/5-2.png');
		
		$("#rs_rating").val(5); 
		
	/* 	alert($("#rs_rating").val()); */
	});	
	
});


</script>




<script type="text/javascript">
var sel_files = [];

$(document).ready(function() {
    $("#input_imgs").on("change", handleImgsFilesSelect);
}); 

function handleImgsFilesSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        
        $(".imgs_wrap").empty();
        
        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
           /*  
           var img_html = "<img src=\"" + e.target.result + "\" />";
             */
           
       var img_html = "<img src=\"" + e.target.result + "\" height=200 width=200  />";  
           
            $(".imgs_wrap").append(img_html);
        }
        reader.readAsDataURL(f);
    });
}

</script>




</body>
</html>