<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager" />

<%
String flag = request.getParameter("flag");
boolean result = false;
//String a = request.getParameter("name"); 
// Controller 역할을 한다.

if (flag.equals("update")) {
	//result = productManager.updateproduct(request);	
} else if (flag.equals("delete")) {
	//result = productManager.deleteproduct(request);	
} else {
	response.sendRedirect("productmanager.jsp");
}

if (result) {
	
} else {
	
}
%>