<%@page import="pack.product.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<h2>전체 상품 목록(관리자용)</h2><!-- 관리자만 봐야되니까 session 필요함 -->
<%@include file="admin_top.jsp" %>
<br>
<a href="productinsert.jsp">[ 상품 등록 ]</a>
<table style="width:95%">
	<tr style="background-color: blue; color: white;">
	<th>제품번호</th><th>제품명</th><th>가격</th><th>등록일</th><th>재고량</th><th>상세보기</th>
		<%
		ArrayList<ProductDto> list = productManager.getProductAll();
		if (list.size() == 0) {
		%>
		<tr><td colspan="6">등록된 상품이 없습니다.</td></tr>
		<%	
		} else {
			for (ProductDto p : list) {
		%>
		<tr>
			<td><%=p.getNo() %></td>
			<td><%=p.getName() %></td>
			<td><%=p.getPrice() %></td>
			<td><%=p.getSdate() %></td>
			<td><%=p.getStock() %></td>
			<td>
				<a href="javascript:productDetail('<%=p.getNo() %>')">보기</a>
			</td>
		</tr>		
		<%
			}
		}
		%>
</table>
<%@include file="admin_bottom.jsp" %>

<form action="productdetail.jsp" name="detailFrm" method="post">
	<input type="hidden" name="no"> <!-- productdetail에 no를 들고감 -->
</form>
</body>
</html>