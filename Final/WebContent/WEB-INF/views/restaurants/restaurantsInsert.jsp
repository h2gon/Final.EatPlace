<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/creative.min.css" rel="stylesheet">
    
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/magnific-popup/magnific-popup.css">
	
 <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 
 <style type="text/css">
 
 .login-form form input, .signup-form form input {
     background: #F0F0E9;
    border: medium none;
    color: #696763;
    display: block;
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 300;
    height: 40px;
    margin-bottom: 10px;
    outline: medium none;
    padding-left: 10px;
    width: 100%;
 }
 
 .login-form h2, .signup-form h2 {
    color: #696763;
    font-family: 'Roboto', sans-serif;
    font-size: 20px;
    font-weight: 300;
    margin-top: 30px;
}
 
 </style>

</head>
<body>
 <!-- Navigation -->
     <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.html">Start Bootstrap</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="about.html">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="services.html">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="restaurantsInsert.do">식당추가</a>
            </li>
        
        
            <li class="nav-item dropdown" id="before">
              
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	LOGIN
              </a>        
				
                <div  class="dropdown-menu dropdown-menu-right" id="kakao_btn_changed" aria-labelledby="navbarDropdownPortfolio">
					<a  class="dropdown-item" href="regi.do" style="text-align: center;">regi</a>
					<!-- href="javascript:loginWithKakao()" -->
					<a  class="dropdown-item" id="kakao-login-btn">	
					</a>
				</div>				
            </li>
          </ul>
        </div>
      </div>
    </nav>
	
	<section>
		<div class="container" style="    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;">
			<div class="row22" style="display: inline-flex; margin-right: -15px;
    margin-left: -15px;"><div class="col-sm-3" style="    width: 25%;
    ">
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
	
	<div id="contact-page" class="container" style="width: 970px;padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto;">
		<h2 class="title text-center" style="color: #86c4f0; font-family: 'Roboto', sans-serif;
    font-size: 18px;
    font-weight: 700;
    margin: 0 15px;
    text-transform: uppercase;
    margin-bottom: 30px;
    position: relative;
}">
			<strong>맛집 등록</strong>
		</h2>

		<div class="signup-form">
			<!--sign up form-->
			
			<form action="InsertRS.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
						
			
			<!-- <input type="hidden" name="id" value="123"> -->
			<!--  <input type="hidden" name="id" value="">  -->

				<div>
					<h2>
						<label>맛집이름</label>
					</h2>
					<input id="rsName" name="rs_name" type="text" placeholder="맛집이름">
				</div>

				<div>
					<h2>
						<label>영업시간</label>
					</h2>
					<input id="startPrice" name="rs_time" type="text" numberOnly placeholder="영업시간">
	
				</div>

				<div>
					<h2>
						<label>가격대</label>
					</h2>
					<input id="bnPrice" name="rs_price" type="text"  placeholder="ex)2만원대">
				</div>
				
				<div>
					<h2>
						<label>메뉴</label>
					</h2>
					<!-- <input type="text" placeholder="판매종료일"> -->
					<input name="rs_menu"  type="text" placeholder="삼겹살,양꼬치 등">
				</div>
				<div>
					<h2>
						<label>연락처</label>
					</h2>
					<!-- <input type="text" placeholder="판매종료일"> -->
					<input name="rs_phone"  type="text" placeholder="02-0000-0000">
				</div>
				
				<div>
					<h2>
						<label>주차장유무</label>
					</h2>
					<select name="rs_parking" style="height: 40px">
						<option value="0" selected="selected">가능</option>
						<option value="1">불가</option>
					</select>
				</div>
				
				<div>
					<h2>
						<label>카테고리</label>
					</h2>
					<select name="rs_category" style="height: 40px">
						<option selected="selected">한식</option>
						<option>양식</option>
						<option>일식</option>
						<option>중식</option>
						<option>카페</option>
						<option>PUB</option>
						<option>세계음식</option>
						<option>뷔폐</option>
					</select>
				</div>
				
				<div>
				<h2>
					<label>키워드</label>
				</h2>
				<textarea id="expln" name="rs_keyword" rows="5" cols="40" style="overflow-x: hidden; overflow-y: auto;"
				placeholder="역삼역3번출구,가로수길 등"></textarea>
				
				
			</div>
				
				
				
				<div id="fileArea">
			
				<h2 style="margin-bottom: 10px;">
					<label>대표사진 등록</label> 
					<!-- <input class="clear1" type="button" id="append" value="파일추가" > -->
					
				</h2>
				
				<!-- <button style="margin-bottom: 10px; margin-right:5px; width: auto; padding: 3px 15px; float: left" type="button" id="append">파일추가</button>
				<button  style="width: auto; padding: 3px 15px; float: left	" type="button" id="delete">파일삭제</button>
				 -->
					<input type="file" name="rs_picture" id="userfile" />
					<!-- <input type="file" name="fileload" style="width: 400px"> -->
					<!-- <input name="pic" type=file id="input_imgs" multiple/>
					<div class="imgs_wrap"> -->
						
					
				
				</div>
				
				<div style="width: 350px; display: block;">
							<h3 align="left" >주소 </h3>
							<!-- <input type="text" name="address" placeholder="Address"> -->
							<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" style="width: 115px; float: left; margin-right: 10px">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 105px; float: left"><br>
							<input type="text" name="rs_address1" id="sample6_address" placeholder="주소">
							<input type="text" name="rs_address2" id="sample6_address2" placeholder="상세주소">
						</div>

	
			<br>
			
			<input type="submit" value="등록">
			
			</form>
			
			<form action="home.do">
				<input type="submit" value="취소">
			</form>	
	</div>
	
	</div>
	</div>
	</section>
	<br>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
	
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