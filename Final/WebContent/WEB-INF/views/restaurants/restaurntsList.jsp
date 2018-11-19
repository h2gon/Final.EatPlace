<%-- <%@page import="kh.com.c.util.BbsArrow"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 


<table class="rslist" style="width: 85%">
	<colgroup>
		<col style="width:70px;">
		<col style="width:auto;">
	</colgroup>
	
<thead>
	<tr>
		<th>순서</th><th>제목</th>
	</tr>
</thead>

<tbody>
	<c:if test="${empty rslist }">
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>
	</tr>	
	</c:if>
	
	<!-- for(BbsDto bbs : bbslist) -->
	<c:forEach items="${rslist }" var="bbs" varStatus="vs">
	

	
	<tr class="_hover_tr">
		<td>${rs.seq }</td>
		<td style="text-align: left;">
			${rs.name }
		</td>

	</tr>		
	</c:forEach>
</tbody>

</table>









