<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<%@include file="admin_top.jsp"%>

	<form action="/myshop/product/upload" method="post"
		enctype="multipart/form-data">
	<table style="width: 95%">
		<tr>
			<th colspan="2"><h2>상품 추가</h2></th>
		</tr>
		<tr>
			<td>상품명</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>설명</td> <!-- 타입이 text이니까 textarea로 해줬다. 많은 글이 들어갈 것을 예상 -->
			<td><textarea rows="5" style="width: 98%" name="detail"></textarea></td>
		</tr>
		<tr>
			<td>재고량</td>
			<td><input type="text" name="stock"></td>
		</tr>
		<tr>
			<td>사 진</td>
			<td><input type="file" name="image" size="30" accept="image/*"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
			<br>
			<input type="submit" value="상품 등록">
			<input type="reset" value="입력 초기화">
			
			</td>
		</tr>
	</table>
	</form>
	<%@include file="admin_bottom.jsp"%>
</body>
</html>