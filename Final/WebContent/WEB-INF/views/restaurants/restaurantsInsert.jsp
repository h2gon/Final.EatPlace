<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> 010-5535-8807 </a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>valva7@naver.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
							<%-- 	<%if(user == null){%>
								<li><a href="account.jsp"><i class="fa fa-user"></i> 회원가입</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i> 로그인</a></li>
								<%} else{%>
								<li><a href="#"><i class="fa fa-user"></i><%=user.getId()%>님</a></li>
								<li><a href="Mypage.jsp?id='<%=user.getId()%>'"><i class="fa fa-lock"></i> 내 정보 </a></li>
								<li><a href="logout.jsp" id="logout"><i class="fa fa-lock"></i> 로그아웃 </a></li>
								<%} %>	 --%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4" style="margin-bottom: 10px">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt=""  width="180px" height="42px"/></a>
						</div>
					</div>
						
						<form action="searchAf.jsp" method="get">								   
						        <div class="col-xs-8 col-xs-offset-2" style="margin: auto">
								    <div class="input-group">
						                <div class="input-group-btn search-panel">
						                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="margin-left: 260px; width: 100px" >
						                    	<span id="search_concept">Filter by</span> <span class="caret"></span>
						                    </button>
						                    <ul class="dropdown-menu" role="menu" style="margin-left: 260px">
						                      <li><a>전체</a></li>
						                      <li><a>의류</a></li>
						                      <li><a>전자기기</a></li>
						                      <li><a>생활용품</a></li>
						                      <li><a>이용권</a></li>
						                    </ul>
						                </div>
						                <input type="hidden" name="choice" value="전체" id="search_param">         
						                <input type="text" class="form-control" name="findWord" placeholder="Search item..." style="width: 350px; float: right">
						                <span class="input-group-btn">
						                    <button class="btn btn-default" type="submit" style="height: 34px"><span class="glyphicon glyphicon-search"></span></button>
						                </span>
						            </div>
						        </div>									
							</form>
							<script type="text/javascript">
							$(document).ready(function(e){
							    $('.dropdown-menu').find('a').click(function(e) {
									e.preventDefault();
									var concept = $(this).text();
									console.log(concept);
									$('.search-panel span#search_concept').text(concept);
									$('.input-group #search_param').val(concept);
								});
							});
							</script>
					</div>
				</div>
			</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp" style="color:#5ca5fe">홈</a></li>
								<li><a href="category.jsp?choice=전체&color='전체'" id="all">전체</a></li>
								<li><a href="category.jsp?choice=의류&color='의류'" id="cloth">의류</a></li>
								<li><a href="category.jsp?choice=전자기기&color='전자기기'" id="elec">전자기기</a></li>
								<li><a href="category.jsp?choice=생활용품&color='생활용품'" id="etc">생활용품</a></li>
								<li><a href="category.jsp?choice=이용권&color='이용권'" id="ticket">이용권</a></li>
								<li><a href="contact-us.jsp?choice=고객센터">고객센터</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	<section>
		<div class="container">
			<div class="row" style="display: inline-flex;"><div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="Mypage.jsp">회원정보</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="insert_product.jsp">판매등록</a></h4>
								</div>
							</div>							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="SellList.jsp">판매내역</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="buyList.jsp">구매내역</a></h4>
								</div>
							</div>		
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="GetOut.jsp">회원탈퇴</a></h4>
								</div>
							</div>																					
						</div><!--/category-products-->
	</div>
</div>
	
	<div id="contact-page" class="container">
		<h2 class="title text-center">
			<strong>상품 등록</strong>
		</h2>

		<div class="signup-form">
			<!--sign up form-->
			<h2>상품 상세 등록</h2>
			<form action="insertProduct" method="post" enctype="multipart/form-data" onsubmit="return check()">
						
			
			<!-- <input type="hidden" name="id" value="123"> -->
			 <input type="hidden" name="id" value=""> 

				<div>
					<h2>
						<label>상품명</label>
					</h2>
					<input id="productName" name="productName" type="text" placeholder="상품명">
				</div>

				<div>
					<h2>
						<label>판매시작가격</label>
					</h2>
					<input id="startPrice" name="startPrice" type="text" numberOnly placeholder="금액">
	


				</div>

				<div>
					<h2>
						<label>즉시판매가격</label>
					</h2>
					<input id="bnPrice" name="bnPrice" type="text" numberOnly placeholder="즉시판매가격">
				</div>
				
				<div>
					<h2>
						<label>판매종료일</label>
					</h2>
					<!-- <input type="text" placeholder="판매종료일"> -->
					<input name="edate" readonly="readonly" type="text" id="datepicker1">
				</div>
				
				<div>
					<h2>
						<label>카테고리</label>
					</h2>
					<select name="category" style="height: 40px">
						<option selected="selected">전자기기</option>
						<option>의류</option>
						<option>생활용품</option>
						<option>이용권</option>
					</select>
				</div>
				
				<div>
					<h2>
						<label>상품상태</label>
					</h2>
					<select name="status" style="height: 40px">
						<option value="0" selected="selected">신품</option>
						<option value="1">중고</option>
					</select>
				</div>
				
				<div id="fileArea">
			
				<h2 style="margin-bottom: 10px;">
					<label>이미지 등록</label> 
					<!-- <input class="clear1" type="button" id="append" value="파일추가" > -->
					
				</h2>
				
				<button style="margin-bottom: 10px; margin-right:5px; width: auto; padding: 3px 15px; float: left" type="button" id="append">파일추가</button>
				<button  style="width: auto; padding: 3px 15px; float: left	" type="button" id="delete">파일삭제</button>
				
					<input type="file" name="userfile" id="userfile" />
					<!-- <input type="file" name="fileload" style="width: 400px"> -->
					<!-- <input name="pic" type=file id="input_imgs" multiple/>
					<div class="imgs_wrap"> -->
						
					
				
				</div>

			<div>
				<h2>
					<label>상품설명</label>
				</h2>
				<textarea id="expln" name="expln" rows="15" cols="" style="overflow-x: hidden; overflow-y: auto;"></textarea>
			</div>
	
			<br>
			
			<input type="submit" value="등록">
			
			</form>
			
			<form action="index.jsp">
				<input type="submit" value="취소">
			</form>	
	</div>
	
	</div>
	</div>
	</section>
	<br>
		<!--/sign up form-->


<footer id="footer">
		<div class="footer-widget">
			<div class="container">
				<div class="row">
				
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>AMORE</span></h2>
							
							<p>	Tel. 1564-5123</p>
							<p>	평일 09:00~18:00</p>
							<p>	Fax. 02-542-6521</p>
							<p>	Mail. amoreP@corp.amore.co.kr</p>
							
							
						</div>
					</div>
				
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="contact-us.jsp">Contact-Us</a></li>
							</ul>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="contact-us.jsp">Notice</a></li>
							</ul>
							<ul class="nav nav-pills nav-stacked">
						<%-- 	<%
							if(user==null){
								%>
								<li class="log"><a href="contact-us.jsp">My Page</a></li>
								<%
							}else{
							%>
								<li><a href="Mypage.jsp?id='<%=user.getId()%>'">My Page</a></li>
							<%
							}
							%> --%>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quick Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="category.jsp?choice=의류">의류</a></li>
								<li><a href="category.jsp?choice=전자기기">전자기기</a></li>
								<li><a href="category.jsp?choice=생활용품">생활용품</a></li>
								<li><a href="category.jsp?choice=이용권">이용권</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>대한민국 서울특별시 강남구 테헤란로 14길 6 남도빌딩</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2018 AMORE Inc. All rights reserved.</p>
					<p class="pull-right">Designed by illjoe</p>
				</div>
			</div>
		</div>
		
	<!-- </footer>/Footer<a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up"></i></a> -->



	<!-- <script src="js/jquery.js"></script> -->
<!-- 	<script src="js/price-range.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script> -->
<!-- 	<script src="js/main.js"></script> -->

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

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var img_html = "<img src=\"" + e.target.result + "\" />";
            $(".imgs_wrap").append(img_html);
        }
        reader.readAsDataURL(f);
    });
}

</script>

<script type="text/javascript">

 //3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}


$("input:text[numberOnly]").on("keyup", function() {
    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
}); 


function check() {
	
	var pName = $("#productName").attr('value');
	var sPrice = Number(removeCommas($("#startPrice").attr('value')));
	var bPrice = Number(removeCommas($("#bnPrice").attr('value')));
	var expln = $("#expln").attr('value');
	var datepicker = $("#datepicker1").attr('value');
	var file = $("#userfile").attr('value');

	
	if(pName == null || pName == ""){
		alert("상품명을 입력해주세요.");
		return false;
	}
	else if(sPrice == null || sPrice == ""){
		alert("시작 가격을 입력해주세요.");
		return false;
	}
	else if(bPrice == null  || bPrice == ""){
		alert("즉시 구매 가격을 입력해주세요.");
		return false;
	}
	else if(expln == null || expln == ""){
		alert("상품 설명을 입력해주세요.");
		return false;
	}
	else if(datepicker == null || datepicker == ""){
		alert("종료일을 선택해주세요.");
		return false;
	}
	else if(file == null || file == ""){
		alert("이미지를 추가해주세요.");
		return false;
	}
	else if(sPrice >= bPrice){
		alert("시작가격은 즉시구매가격보다 같거나 높을수 없습니다.");
		return false;
	}
	else{
		$("#startPrice").attr('value',sPrice);
		$("#bnPrice").attr('value',bPrice);
		
		return true;
	}
}


$(function() {
	
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy/mm/dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년',
    minDate: 1,
    maxDate: +14
  });
  
});
</script>

<script type="text/javascript">
 $(document).ready(function(){
	
  var count = 1;
  $("#append").click(function(){
   if(count >= 20){
    alert("최대 업로드수는 " + count + "개입니다.");
   } else {
    count++;
    $("#fileArea").append("<input type='file' name='userfile[" + count + "]' id='userfile" + count + "' />");
   }
  });
  $("#delete").click(function(){
   if(count <= 1){
    alert("최소 업로드수는 " + count + "개입니다.");
   } else {
    $("#userfile" + count).remove();
    count--;
   }
  });


 });
</script>


</body>
</html>