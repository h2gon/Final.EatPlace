<%-- <%@page import="kh.com.c.util.BbsArrow"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 


<table class="rslist" border="3" style="width: 85%">
	
<thead>
	<tr>
		<th>순서</th><th>가게이름</th>
	</tr>
</thead>

<tbody>
	<c:if test="${empty rslist }">
	<tr>
		<td colspan="3">등록된 식당이 없습니다.</td>
	</tr>	
	</c:if>
	
	<!-- for(BbsDto bbs : bbslist) -->
	<c:forEach items="${rslist }" var="rs" varStatus="vs">
	
	<tr class="td" style="width: 85%">
		<td style="text-align: center;">${rs.seq }</td>
		<td style="text-align: center;">
			<a href="rsdetail.do?seq=${rs.seq }">
			${rs.rs_name }
			</a>
		</td>

	</tr>		
	</c:forEach>
</tbody>

</table>









