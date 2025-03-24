<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>

<body>
	<table style="width: 95%">
		<tr>
			<td style="font-size: 30px;">USAGI SHOP</td>
		</tr>
	</table>
	<%@include file="guest_top.jsp"%>

	<table style="width: 95%">
		<%
		if (memid != null) {
		%>
		<tr style="text-align: center;">
			<td style="font-size: 20px;">
			<%=memid%> 님 방문을 환영합니다.
			<img src="../images/usagi.jpeg">
			</td>
		</tr>
		<%
		} else {
		%>
		<tr style="text-align: center;">
			<td style="font-size:20px; 
			 background-image: url(../images/usagi_back.png);
			 background-size:50%">
				<br>고객님 어서오세요.
				로그인 후 이용가능합니다.<br><br><br><br><br><br><br><br><br><br>
			</td>
		</tr>
		<%
		}
		%>
	</table>

	<%@include file="guest_bottom.jsp"%>
</body>
</html>