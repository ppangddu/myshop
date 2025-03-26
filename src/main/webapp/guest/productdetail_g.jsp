<%@page import="pack.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"></jsp:useBean>    

<%
String no = request.getParameter("no");
ProductDto productDto = productManager.getProduct(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>

</head>
<body>
<%@include file="guest_top.jsp"%>

<form action="cartproc.jsp">
<table style="width: 95%">
	<tr>
	<td style="width: 20%">
	<img src="../upload/<%=productDto.getImage() %>" width="150" /> <%=productDto.getName() %>
	</td>
	<td style="width: 50%; vertical-align: top;">
		<table style="width: 100%">
		<tr>
			<td>번호</td><td><%=productDto.getNo() %></td>
		</tr>
		<tr>
			<td>상품명</td><td><%=productDto.getName() %></td>
		</tr>
		<tr>
			<td>가격</td><td><%=productDto.getPrice() %></td>
		</tr>
		<tr>
			<td>등록일</td><td><%=productDto.getSdate() %></td>
		</tr>
		<tr>
			<td>재고수량</td><td><%=productDto.getStock() %></td>
		</tr>
		<tr>
			<td colspan="3"><br><br><br>주문 수량 : </td>
			<td colspan="2"><br><br><br><input type="number" min="1" name="quantity" value="1" style="text-align: center; width=2cm">
		</tr>
		</table>
	</td>
		<td style="width: 30%; vertical-align:top;">
		<h3>상품 설명</h3>
		<%=productDto.getDetail() %>
	</td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: center;">
		<br>
		<input type="hidden" name="product_no" value="<%=productDto.getNo() %>">
		<input type="submit" value="장바구니에 담기">
		<input type="button" value="이전으로 이동" onclick="history.back()">
	</tr>
</table>
</form>


<%@include file="guest_bottom.jsp"%>
</body>
</html>