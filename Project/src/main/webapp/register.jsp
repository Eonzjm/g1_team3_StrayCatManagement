<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册界面</title>
<style>
</style>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
    <div class="bg">
       <h2>用户注册</h2><form action="registerServlet" method="post">
                <label for="username"><b>用户名</b></label>
                <input type="text" placeholder="输入用户名" name="username" required>
                
                <label for="password"><b>密码</b></label>
                <input type="password" placeholder="输入密码" name="password" required>
                
                <label for="email"><b>电子邮件</b></label>
                <input type="email" placeholder="输入电子邮件" name="email" required>
                
                <div class="button-container">
                    <button type="submit">注册</button>
                    <button type="button" onclick="location.href='login.jsp'">返回登录</button>
                </div>
            </form>
        </div>
</body>
</html>