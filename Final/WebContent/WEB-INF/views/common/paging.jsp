<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int totalRecordCount;	// 전체 글수
	int pageNumber;			// 현재 페이지의 넘버	23 -> 3		0 1 2
	int pageCountPerScreen;	// 스크린당 페이지 수
	int recordCountPerPage;	// 페이지당 글수
	
	String st1 = request.getParameter("totalRecordCount");
	if(st1 == null) totalRecordCount = 0;	
	else			totalRecordCount = Integer.parseInt(st1);

	String st2 = request.getParameter("pageNumber");
	if(st2 == null) pageNumber = 0;	
	else			pageNumber = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null) pageCountPerScreen = 0;	
	else			pageCountPerScreen = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null) recordCountPerPage = 0;	
	else			recordCountPerPage = Integer.parseInt(st4);
	
	// 총페이지 수
	int totalPageCount = totalRecordCount / recordCountPerPage;
	//		1 		   =			12	  /	10
	//      		
	
	if((totalRecordCount % recordCountPerPage) != 0){
		totalPageCount++;
	}
	
	/* System.out.println("pageNumber = "+pageNumber);
	System.out.println("pageCountPerScreen = "+pageCountPerScreen);
	System.out.println("totalPageCount = "+totalPageCount);
	System.out.println("totalRecordCount = "+totalRecordCount); */
	
	//						  1       2    	  3		 4	
	// 0 1 2 ~ 9			1 ~ 10 11 ~ 20 21 ~ 30   31 ~ 40
	int screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;
	//			0  10          =			9 + 1            10                   10 
	int screenEndPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
	//			10  20         = 			9 + 1 / 		10				  10					+ 10		
			
	if(screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;

	
	 if((pageNumber + 1) % pageCountPerScreen == 0){
		screenStartPageIndex = ((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen - pageCountPerScreen;
		screenEndPageIndex = pageNumber + 1;	
	}  
/* 	System.out.println("screenStartPageIndex = "+screenStartPageIndex);
	
	System.out.println("screenEndPageIndex = "+screenEndPageIndex); */
	/*
	totalRecordCount : 12	<- 예
	pageNumber:0
	pageCountPerScreen : 10
	recordCountPerPage : 10
	totalPageCount : 2
	screenStartPageIndex : 0
	screenEndPageIndex : 2
	
	totalRecordCount : 123	<- 예
	pageNumber:11	<- 현재 페이지
	pageCountPerScreen : 10	
	recordCountPerPage : 10
	totalPageCount : 13	
	screenStartPageIndex : 10		
	screenEndPageIndex : 4
	
	*/
	
	
	
	
	
%>    


<style>
.center {
    text-align: center;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
}

.pagination a.active {
    background-color: #c53211;
    color: white;
    border: 1px solid #c53211;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

<div class="center">
<div  class="pagination" style=" text-align: center;">
	<!-- << -->
<!-- 	<a href="#none" title="처음페이지" onclick="goPage('0');">
		<img alt="처음페이지" src="image/arrow_first.gif" style="width: 9px;height: 9px">
	</a>&nbsp; -->
		<%
		// <
		if(screenStartPageIndex > 1){	// 글의 수가 100개 넘었을 때 보임
			%>
			<%-- <a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1 %>')">
				<img alt="이전페이지" src="image/arrow_prev.gif" style="width: 9px;height: 9px">
			</a>&nbsp; --%>
			<a href="#" onclick="goPage('<%=screenStartPageIndex-1 %>')" style="font-family: monospace; font-size: 15px;">이전</a>
			
			<%
		}
		
		// [1] 2 [3]
		for(int i = screenStartPageIndex;i < screenEndPageIndex; i++){
			if(i == pageNumber){
				%>
				<%-- <span style="font-size: 9pt; color: #000000; font-weight: bold;">
					<%=i+1 %>	<!-- 현재 페이지 -->
				</span> --%>
				<a href="#"class="active" onclick="goPage('<%=i %>')" style="font-family: monospace; font-size: 15px;"><%=i+1 %></a>
			
				<%
			}else{
				%>
				<%-- <a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)" 
					style="font-size: 7.5pt; color: #000000; font-weight: normal;">
					[<%=i+1 %>]	
				</a>&nbsp;
				 --%>
				<a href="#" onclick="goPage('<%=i %>')" style="font-family: monospace; font-size: 15px;"><span><%=i+1 %></span></a>	
				<%
			}			
		}
		if(screenEndPageIndex < totalPageCount){// [1][2] ~ 9[10] 		
			%>
			<%-- <a href="#none" title="다음페이지" onclick="goPage(<%=screenEndPageIndex %>)">
				<img alt="다음페이지"	src="image/arrow_next.gif" style="width: 9px; height: 9px">
			</a>&nbsp; --%>
			<a href="#" onclick="goPage('<%=screenEndPageIndex %>')" style="font-family: monospace; font-size: 15px;">다음</a>
			
			<%
		}		
				
		int end_page = 0;
		if(totalPageCount > 0){
			end_page = totalPageCount - 1;
		}
		%>

	<%-- <a href=" #none" title="마지막페이지" onclick="goPage(<%=end_page %>)">
		<img alt="마지막페이지" src="image/arrow_end.gif" style="width: 9px; height: 9px">
	</a>  
	<a href="#" onclick="goPage('<%=end_page %>')" style="font-family: monospace; font-size: 15px;">끝페이지</a>--%>
</div>
</div>

<%-- <div style="float: left; width: 4%; text-align: center;">
	<span style="font-size: 1em; color: #000000">
		<%=pageNumber+1 %>/<%=totalPageCount %>
	</span>
</div> --%>








