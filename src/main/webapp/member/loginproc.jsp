<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

boolean b = memberManager.loginCheck(id, passwd);

if (b) {
	session.setAttribute("idKey", id); // idKey라는 이름으로 id넣기
	response.sendRedirect("login.jsp");
} else {
	response.sendRedirect("logfail.html");
}
%>