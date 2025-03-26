<%@page import="pack.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"></jsp:useBean>
    <%
    //productmanager에서 no를 들고온다.
    String no = request.getParameter("no");
    
    ProductDto productDto = productManager.getProduct(no);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<h2>상품 상세 보기</h2>
<%@include file="admin_top.jsp" %> <!-- 로그인 한 사람만 볼 수 있어야 해서 세션 가져와줌  -->

<table style="width: 95%">
	<tr>
	<td style="width: 20%">
		<img src="../upload/<%=productDto.getImage() %>" width="200" />
	</td>
	<td style="width: 50%; vertical-align: top;">
		<table style="width: 100%">
		<tr>
			<td>번호</td><td><%=productDto.getNo() %></td>
		</tr>
		<tr>
			<td>제품명</td><td><%=productDto.getName() %></td>
		</tr>
		<tr>
			<td>가격</td><td><%=productDto.getPrice() %></td>
		</tr>
		<tr>
			<td>등록일</td><td><%=productDto.getSdate() %></td>
		</tr>
		<tr>
			<td>재고량</td><td><%=productDto.getStock() %></td>
		</tr>
		</table>
	</td>
	<td style="width: 30%; vertical-align: top;">
		<b>상품 설명</b><br>
		<%=productDto.getDetail() %>
	</td>
	</tr>
	<tr>
	<td colspan="3">
		<a href="javascript:productUpdate('<%=productDto.getNo() %>')">수정하기</a>
		<a href="javascript:productDelete('<%=productDto.getNo() %>')">삭제하기</a>
	
	</td>
	</tr>
</table>

<%@include file="admin_bottom.jsp" %>

<form action="productupdate.jsp" name="updateFrm" method="post">
	<input type="hidden" name="no">
</form> 
<form action="productdelete.jsp?flag=delete" name="delFrm" method="post">
	<input type="hidden" name="no">
</form>
</body>
</html>