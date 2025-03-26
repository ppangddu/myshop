<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="cartManager" class="pack.order.CartManager" scope="session" /> <!-- session이 살아있는 동안만 유효하다. "scope=session" -->    
<jsp:useBean id="orderBean" class="pack.order.OrderBean" />
<jsp:setProperty property = "*" name="orderBean" />

<%
String flag = request.getParameter("flag"); //구매목록 보기, 수정, 삭제 판단
String id = (String)session.getAttribute("idKey");

if (id == null) { // 로그인을 안 한 경우
    response.sendRedirect("../member/login.jsp");
} else {
    if (flag == null) { // 주문 상품 Cart에 저장
        orderBean.setId(id);
        cartManager.addCart(orderBean); // product_no, quantity, id 3개가 cartManager에 전달됨.
%>
    <script>
    alert("장바구니에 담았습니다.");
    location.href="cartlist.jsp";
    </script>
<%
    } else if (flag.equals("update")) {
        orderBean.setId(id);
        cartManager.updateCart(orderBean);
%>
    <script>
    alert("장바구니의 내용을 수정했습니다.");
    location.href="cartlist.jsp";
    </script>
<%        
    } else if (flag.equals("del")){
        cartManager.deleteCart(orderBean);
%>
    <script>
    alert("해당 상품의 주문을 삭제했어요.");
    location.href="cartlist.jsp";
    </script>
<%
    }
}
%>
