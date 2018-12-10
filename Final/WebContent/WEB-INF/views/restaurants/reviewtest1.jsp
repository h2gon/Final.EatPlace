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
<link type="text/css" rel="stylesheet" href="https://nanati.me/common/css/js-load.css" media="screen" />
<script type="text/javascript" src="https://nanati.me/common/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="https://nanati.me/common/js/js-load.js"></script>

</head>
<header>
  <h1>더보기(MORE) 버튼을 눌러 일정갯수의 리스트 더 보기</h1>
</header>
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
<div id="contents">
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
			<table>
				<tr>
					<td>아이디: <%=id %></td>
					<td>내용: <%=content %></td>
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
					<%
					List<fileDto> f_list = eatReviewDao.getRv_Image(list.get(i).getSeq());
					%>
				</tr>
				<tr>
				<td>none</td>
				<td>
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
				<td>
				</td>
				
				</tr>
				
				<tr style="border: none">
				<td colspan="3" width="80" style="border-bottom: 1px solid #c8c8c8;"><!-- <img alt="-----------------------------------------------" src=""> --></td>
				</tr>
				
			</table>
			
		</li>
		<%
		}
	%>   
    </ul>
    <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
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