<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<body>
<h2>관리자 화면</h2>
<%@include file="admin_top.jsp" %> <!-- 관리자 화면도 구성할겸 세션도 -->
<table style="width: 80%">
	<tr>
		<td style="height: 150; text-align: center;">
			<img src="../images/admin.png" style="width: 350px; height: auto;">

		</td>
	</tr>
</table>
관리자 화면
<%@include file="admin_bottom.jsp" %>
</body>
</html>