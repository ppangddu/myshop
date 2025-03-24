<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- guest_top은 session을 읽는 작업을 작성.  --%>

<%
String memid = (String)session.getAttribute("idKey"); //loginproc에서 이렇게 정함, 리턴 타입이 Object라 String으로 형 변환 해줘야 한다.
String log = "";

if (memid == null) {
	log = "<a href='../member/login.jsp'>로그인</a>";
} else {
	log = "<a href='../member/logout.jsp'>로그아웃<a>";
}

String mem = "";
if (memid == null) {
	mem = "<a href='../member/register.jsp'>회원가입</a>";
} else {
	mem = "<a href='../member/memberupdate.jsp'>회원수정</a>";
}
%>
<h2>MENU</h2>
<table style="width: 95%">
	<tr style="background-color: #FFB347;">
		<th><%=log %></th>
		<th><%=mem %></th>
		<th><a href="productlist.jsp">상품 목록</a></th>
		<th><a href="cartlist.jsp">장바구니</a></th>
		<th><a href="orderlist.jsp">구매목록</a></th>
		<th><a href="../board/boardlist.jsp">게시판</a></th>
	</tr>
</table>
