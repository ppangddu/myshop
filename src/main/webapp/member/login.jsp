<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = () => { //멤버 필드와 바디를 구분하기 위해 화살표 씀
	document.querySelector("#btnLogin").addEventListener("click", funcLogin);
	document.querySelector("#btnNewMember").addEventListener("click", funcNewMember);
}
</script>
</head>
<body>
	<%
	if (id != null) {
	%>
	<b><%=id%>님 환영합니다.</b> 지금부터 저희가 준비한 쇼핑몰 사용 가능합니다.
	<br>
	<a href="logout.jsp">로그아웃</a>
	<%
	} else {
	%>
	<form name="loginForm">
		<table>
			<tr>
				<td colspan="2" style="text-align: center;">회원 로그인</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="로그인" id="btnLogin">
				<input type="button" value="회원가입" id="btnNewMember">
			</tr>
		</table>
	</form>
<%
}
%>

</body>
</html>