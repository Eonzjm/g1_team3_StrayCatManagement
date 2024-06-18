<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册界面</title>
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
    .register-container {
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
    .register-container input[type="text"],
    .register-container input[type="password"],
    .register-container select,
    .register-container button {
        width: 100%;
        padding: 10px;
        margin: 5px 0 20px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    .register-container button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        margin: 10px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    .register-container button:hover {
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
        <div class="register-container">
        <h2>注册</h2>
        <form action="registerServlet" method="post">
        
        <label for="username"><b>用户名</b></label>
        <input type="text" placeholder="输入用户名" name="username" required>
        
         <label for="mail"><b>邮箱</b></label>
         <input type="text" placeholder="输入邮箱" name="mail" required>
        
         <label for="password"><b>密码</b></label>
         <input type="password" placeholder="输入密码" name="password" required>
         
         <label for="gender"><b>性别</b></label>
         <select id="gender" name="gender" required>
             <option value="">选择性别</option>
             <option value="male">男</option>
             <option value="female">女</option>
         </select>
         
         <div class="button-container">
             <button type="submit">注册</button>
             <button type="button" onclick="location.href='login.jsp'">返回登录</button>
         </div>
       </form>
      </div>
    </div>
</body>
</html>