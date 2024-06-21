<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆界面</title>
<style>
body, html {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;

    }
   .bg {
        background-image: url('cat.jpg');
        height: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .bg::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5); 
        z-index: 1;
    }
    .login-container {
        position: absolute;
        left: 80%;
        top: 55%;
        transform: translate(-50%, -75%);
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        z-index: 2;
    }
    .login-container input[type="text"],
    .login-container input[type="password"],
    .login-container button {
        width: 100%;
        padding: 10px;
        margin: 5px 0 20px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    .login-container button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        margin: 10px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    .login-container button:hover {
        opacity: 0.8;
    }
    .button-container{
        display: flex;
        justify-content:space-between;
        margin-top: 10px;
    }
    .button-container button{
        width:45%;
    }
</style>
</head>
<body>
	<div class="bg">
	    <div class="login-container" >
            <h2>登录</h2>
	        <form action="LoginServlet" method="post">
				    <label for="name">用户名</label>
				    <input type="text" id="name" placeholder="输入用户名" name="name" />
	
				    <label for="pwd">密码:</label>
				    <input type="password" id="pwd" placeholder="密码" name="pwd" />

				  <div class="button-container">
				      <button type="submit">登录</button>
				      <button type="button" onclick="location.href='register.jsp'"> 注册</button>
				  </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			</form>
		</div>
	</div>
</body>
</html>