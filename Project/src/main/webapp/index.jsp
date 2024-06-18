<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" href="layout.css" type="text/css" />
<link rel="stylesheet" href="form.css" type="text/css" />
</head>
<body>
	<header><jsp:include page="header.jsp" /></header>
	<nav><jsp:include page="nav.jsp" /></nav>
	<div class="container" >
	    <div class="left"></div>
	    <div class="mid">欢迎来到宿舍管理系统！你可以在本系统对学生的姓名，宿舍号等基本信息进行添加，修改，删除等操作。</div>
	    <div class="right"></div>
	</div>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>
