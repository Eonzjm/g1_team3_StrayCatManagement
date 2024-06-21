<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结账</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        text-align: center;
        padding: 50px;
    }
</style>
</head>
<body>

<h1>结账成功！</h1>
<p>感谢您的购买。</p>

<%
    // 清空购物车
    session.removeAttribute("cart");
%>

<a href="shop.jsp">返回商城</a>

</body>
</html>
