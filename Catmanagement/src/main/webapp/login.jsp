<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆界面</title>
<link rel="stylesheet" href="layout.css" type="text/css" />
<link rel="stylesheet" href="form.css" type="text/css" />
</head>
<body>
	<header><jsp:include page="header.jsp" /></header>
	<nav><jsp:include page="nav.jsp" /></nav>
	<div class="container" >
	    <div class="left"></div>
	    <div class="mid">
			<br/><h2 align="center">用户登录</h2>
    		<br/>
	        <form action="LoginServlet" method="post">
				  <p>请输入用户名、密码，然后点击“提交”按钮登录。</p>
				  <div>
				    <label for="name">用户名:</label>
				    <input type="text" id="name" name="name" />
				  </div>
				  <div>
				    <label for="pwd">密码:</label>
				    <input type="password" id="pwd" name="pwd" />
				  </div>
				  <div>
				    <div class="column"></div>
				    <div class="column"><button type="submit">提交</button>&nbsp;&nbsp;<button type="reset">重置</button></div>
				  </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			</form>
		</div>
	    <div class="right"></div>
	</div>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>