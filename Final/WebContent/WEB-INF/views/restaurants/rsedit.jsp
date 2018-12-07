<%@page import="kh.c.five.dao.impl.EatReviewDaoImpl"%>
<%@page import="kh.c.five.model.EatMemberDto"%>
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

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>


</head>
	
<body>	

<%

//로그인 세션
EatMemberDto login = (EatMemberDto)request.getSession().getAttribute("login");

%>


<h2>EAT_RESTAURANT</h2>
 
<form action = "rseditAF_1.do?seq="+${rs.seq} method="post" enctype="multipart/form-data">


<%-- <form name="rsedit1" id="rsedit1" method="post">
 --%>
<input type="hidden" name="seq" value="${rs.seq}"/>
 
 
<table border="1">

<tr>
	<th>값 설명</th>
	<th>현재 값</th>
	<th>수정할 값</th>
</tr>

<tr>
	<td>seq</td>
	<td><a href="rsdetail.do?seq=${rs.seq }">${rs.seq }</a> </td>
	<td bgcolor="red">변경x</td>
</tr>

<tr>
	<td>식당이름</td>
	<td>${rs.rs_name }</td>
	<td bgcolor="red">변경x</td>
	</tr>

<tr>
	<td>주소1</td>
	<td>${rs.rs_address1 }</td>
	<td><input type="text" name="form1_rs_address1" value="${rs.rs_address1 }"></td>
</tr>

<tr>
	<td>주소2</td>
	<td>${rs.rs_address2 }</td>
	<td><input type="text" name="form1_rs_address2" value="${rs.rs_address2 }"></td>
</tr>

<tr>
	<td>picture</td>
	<td><a href="${rs.rs_picture }">${rs.rs_picture }</a></td>
	<td bgcolor="red">변경x</td>
	
</tr>

<tr>
	<td>category</td>
	<td>${rs.rs_category }</td>
	<td><input type="text" name="form1_rs_category"  value="${rs.rs_category }"></td>
</tr>

<tr>
	<td>menu</td>
	<td>${rs.rs_menu }</td>
	<td><input type="text" name="form1_rs_menu" value="${rs.rs_menu }"></td>
</tr>

<tr>
	<td>rating</td>
	<td>${rs.rs_rating }</td>
	<td bgcolor="red">변경x</td>
</tr>

<tr>
	<td>readcount</td>
	<td>${rs.rs_readcount }</td>
	<td><input type="text" name="form1_rs_readcount" value="${rs.rs_readcount }"></td>
</tr>

<tr>
	<td>keyword</td>
	<td>${rs.rs_keyword }</td>
	<td><textarea name="form1_rs_keyword" value="${rs.rs_keyword }"></textarea></td>
	
</tr>

</table>

<span>

	<input value="버튼1" type="submit" name="submit1" id="submit1" onclick="submit1();"/>
</span>
		
</form>


<h2>RESTAURANT_INFO</h2>

<form action = "rseditAF_2.do?seq="+${rs.seq} method="post" enctype="multipart/form-data">

<table border="1">
<input type="hidden" name="seq" value="${rs.seq}"/>

<tr>
	<th>값 설명</th>
	<th>현재 값</th>
	<th>수정할 값</th>
</tr>

<tr>
	<td>rs_name</td>
	<td>${rs2.rs_name }</td>
	<td bgcolor="red">변경x</td>
</tr>

<tr>
	<td>rs_seq</td>
	<td>${rs.seq }</td>
	<td bgcolor="red">변경x</td>	
</tr>

<tr>
	<td>rs_time</td>
	<td>${rs2.rs_time }</td>
	<td><input type="text" name="form2_rs_time" value="${rs2.rs_time }"></td>
</tr>

<tr>
	<td>rs_phone</td>
	<td>${rs2.rs_phone }</td>
	<td><input type="text" name="form2_rs_phone" value="${rs2.rs_phone }"></td>
</tr>

<tr>
	<td>rs_price</td>
	<td>${rs2.rs_price }</td>
	<td><input type="text" name="form2_rs_price" value="${rs2.rs_price }"></td>
</tr>

<tr>
	<td>rs_parking</td>
	<td>${rs2.rs_parking }</td>
	<td><input type="text" name="form2_rs_parking" value="${rs2.rs_parking }"></td>
</tr>

</table>

<span>

	<input value="버튼2" type="submit" name="submit2" id="submit2" onclick="submit2();"/>
</span>
</form>

<!-- 
<script type="text/javascript">
$("#_btnUpdate1").click(function() {	
	alert('글수정하기');	
//	submitContents($("#_frmForm"));
	$("#_frmForm").attr({ "target":"_self", "action":"rseditAF_1.do?seq="+seq).submit();
});

$("#_btnUpdate2").click(function() {	
	alert('글수정하기');	
//	submitContents($("#_frmForm"));
	$("#_frmForm2").attr({ "target":"_self", "action":"rseditAF_2.do?seq="+seq }; ).submit();
});
</script>
 -->
 

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


