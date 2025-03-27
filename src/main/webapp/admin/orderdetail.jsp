<%@page import="pack.product.ProductDto"%>
<%@page import="pack.order.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderManager" class="pack.order.OrderManager" />
<jsp:useBean id="productManager" class="pack.product.ProductManager" />

<%
OrderBean order = orderManager.getOrderDetail(request.getParameter("no"));
ProductDto product = productManager.getProduct(order.getProduct_no());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp"%>
<h2>주문 상세보기</h2>
<form action="orderproc_admin.jsp" name="detailFrm" method="post">
<table style="width: 95%">
	<tr>
	<td>고객 id: <%=order.getId() %></td>
	<td>주문번호: <%=order.getNo() %></td>
	<td>상품번호: <%=product.getNo() %></td>
	<td>상품명: <%=product.getName() %></td>
	</tr>
	<tr>
	<td>상품가격: <%=product.getPrice() %></td>
	<td>주문수량: <%=order.getQuantity() %></td>
	<td>재고수량: <%=product.getStock() %></td>
	<td>주문일자: <%=order.getSdate() %></td>
	</tr>
	<tr>
		<td colspan="4">총 결제 금액 : 
		<%=Integer.parseInt(order.getQuantity()) * Integer.parseInt(product.getPrice()) %> 원
	</tr>
	<tr>
		<td colspan="4" style="text-align: center;">
		<b>
			주문상태 :
			<select name="state">
			<option value="1">접수</option>
			<option value="2">입금확인</option>
			<option value="3">배송준비</option>
			<option value="4">배송중</option>
			<option value="5">배송완료</option>
			</select>
			<script type="text/javascript">
				document.detailFrm.state.value = <%=order.getState()%>
			</script>
		</b>
		</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: center;">
		<input type="button" value="상태수정" onclick="orderUpdate(this.form)">
		/
		<input type="button" value="상태삭제" onclick="orderDelete(this.form)">
		<input type="hidden" name="no" value="<%=order.getNo() %>">
		<input type="hidden" name="flag">
	</tr>
</table>
</form>

<%@include file="admin_bottom.jsp"%>
</body>
</html>