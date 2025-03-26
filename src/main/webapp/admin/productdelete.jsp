<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager" />

<%

String no = request.getParameter("no");
boolean result = productManager.deleteProduct(no);

if (result) {
%>
	<script>
		alert("수정되었습니다.")
		location.href="productmanager.jsp";
	</script>
<%	
} else {
%>
	<script>
		alert("오류가 발생했습니다. 관리자에게 문의해주세요.")
		location.href="productmanager.jsp";
	</script>
<%	
}
%>