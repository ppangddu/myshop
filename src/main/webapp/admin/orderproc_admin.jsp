<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="orderManager" class="pack.order.OrderManager" />

<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
String state = request.getParameter("state");

boolean b = false;

if (flag.equals("update")) {
	b = orderManager.updateOrder(no, state);
} else if (flag.equals("delete")) {
	b = orderManager.deleteOrder(no);
} else {
	response.sendRedirect("ordermanager.jsp");
}

if (b) {
%>
<script>
	alert("정상적으로 state 처리되었습니다.");
	location.href = "ordermanager.jsp";
</script>
<%
} else {
%>
<script>
	alert("오류가 발생했습니다. 관리자에게 문의바랍니다.");
	location.href = "ordermanager.jsp";
</script>

<%
}
%>
