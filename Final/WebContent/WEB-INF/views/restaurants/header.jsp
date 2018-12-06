<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/creative.min.css" rel="stylesheet">
    
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
<!-- 회원가입 모달 -->
<div id="id03" class="w3-modal" style="">
  <span onclick="document.getElementById('id03').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-hor-8 w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-card-9 w3-animate-zoom" style="right:-10px; width:1000px; height: 700px;">
  
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
                <a href="#none" id="_btnRegi" class="form-control" style="height: 30px; title="회원가입">회원가입</a>
            </div>
       	</form>
      </div>
    </div>
    <div class="w3-container w3-border-top w3-padding-hor-16 w3-light-grey">
      <button onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-btn w3-red">Cancel</button>      
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