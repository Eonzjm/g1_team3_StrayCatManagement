<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;

    }
    .bg {
        background-image: url('background.jpg');
        height: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        box-shadow: 0 0 20px rgba(1, 1, 1, 0.5); /* Add shadow effect */
    }
    .login-container {
        position: absolute;
        left: 85%;
        top: 50%;
        transform: translate(-50%, -75%);
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .login-container input[type="text"],
    .login-container input[type="password"] {
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
</style>
</head>
<body>
    <div class="bg">
        <div class="login-container">
            <h2>登录</h2>
            <form action="loginServlet" method="post">
                <label for="username"><b>用户名</b></label>
                <input type="text" placeholder="输入用户名" name="username" required>
                
                <label for="password"><b>密码</b></label>
                <input type="password" placeholder="输入密码" name="password" required>
                
                <button type="submit">登录</button>
            </form>
        </div>
    </div>
</body>
</html>