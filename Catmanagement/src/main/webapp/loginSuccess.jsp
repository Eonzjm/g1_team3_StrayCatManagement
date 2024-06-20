<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录成功</title>
<link rel="stylesheet" href="layout.css" type="text/css" />
</head>
<body>
	<header><jsp:include page="header.jsp" /></header>
	<nav><jsp:include page="nav.jsp" /></nav>
	<div class="container" >
	    <div class="left"></div>
	    <div class="mid">
			<!-- jsp:useBean id="user" type="dto.User" scope="request" /-->
			恭喜${user.name}<!-- jsp:getProperty property="name" name="user" /-->登录成功！
		</div>
	    <div class="right"></div>
	</div>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>