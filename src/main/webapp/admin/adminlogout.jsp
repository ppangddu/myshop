<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session.removeAttribute("adminKey");
%>

<script>
	alert("관리자 로그아웃 성공");
	location.href="../guest/guest_index.jsp";
	// a href = 사용자가 직접 클릭해서 이동할 때 
	// location.href = 자바스크립트 코드로 자동 이동시킬 때
</script>