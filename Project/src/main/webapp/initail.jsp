<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<style>

</style>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
    <div class="bg">
        <div class="login-container">
            <h2>登录</h2>
            <form action="loginServlet" method="post">
            <label for="userType"><b>登录类型</b></label>
                <select id="userType" name="userType">
                    <option value="user">用户</option>
                    <option value="admin">管理员</option>
                </select>
                
                <label for="username"><b>用户名</b></label>
                <input type="text" placeholder="输入用户名" name="username" required>
                
                <label for="password"><b>密码</b></label>
                <input type="password" placeholder="输入密码" name="password" required>
                
                <div class="button-container">
                    <button type="submit">登录</button>
                    <button type="button" onclick="location.href='register.jsp'">注册</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>