<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.board.BoardBean" />
<jsp:setProperty property="*" name="bean" />
<jsp:useBean id="boardManager" class="pack.board.BoardManager" />

<%
// 자동으로 채워지는 거 생성
int newNum = boardManager.currentMaxNum() + 1;
bean.setNum(newNum);
bean.setBip(request.getRemoteAddr()); // 글을 입력한 사람의 주소를 받을 수 있음
bean.setBdate();
bean.setGnum(newNum); // 원글인 경우 newNum을 setGnum에게 준다.

boardManager.savaData(bean);

response.sendRedirect("boardlist.jsp?page=1"); // 최신글은 1페이지에 있다, 추가 후 목록보기 (forwarding X)
%>