<%@page import="pack.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager" />
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

MemberDto memberDto = memberManager.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnUpdateOkAdmin").onclick = memberUpdateAdmin;
	document.getElementById("btnUpdateCancelAdmin").onclick = memberUpdateCancelAdmin;
}
</script>
</head>
<body>
<form name="updateFormAdmin" method="post" action="memberupdateproc_admin.jsp">
		<table border="1">
			<tr align="center" style="background-color: #8899aa">
				<td colspan="2"><b style="color: #FFFFFF"><%=memberDto.getName() %> 님의 정보 수정(관리자 권한)</b></td>
			</tr>
			<tr>
				<td width="16%">아이디</td>
				<td width="57%">
				<%=memberDto.getId() %> <!-- id는 수정에서 제외, 그렇지만 들고는 가야하니까 memberupdate에서는 session이 있으니까 hidden으로 안 들고가도 되는데 여기에는 session이 없으니까 hidden으로 들고 가줘야 한다. -->
				<input type="hidden" name="id" value="<%=memberDto.getId() %>">
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="15" value="<%=memberDto.getName() %>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" size="27" value="<%=memberDto.getEmail() %>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size="20" value="<%=memberDto.getPhone() %>"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zipcode" size="7" value="<%=memberDto.getZipcode() %>"> 
				<input type="button" value="우편번호찾기" id="btnZip"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
						<option value="<%=memberDto.getJob() %>"><%=memberDto.getJob() %>
						<option value="회사원">회사원
						<option value="학생">학생
						<option value="자영업">자영업
						<option value="기타">기타
				</select>
			</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="button" value="수정완료" id="btnUpdateOkAdmin">&nbsp;&nbsp;
				<input type="button" value="수정취소" id="btnUpdateCancelAdmin"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>