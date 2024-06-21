<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>联系栏</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .background {
        position: absolute;
        top: 5;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: url('bg.jpg'); 
        background-size: cover;
        background-position: center;
        z-index: -1; 
        filter: brightness(0.5) blur(5px); 
        
     }
    .topbar {
        width: 100%;
        background-color: #333;
        color: white;
        padding: 15px 0;
        text-align: right;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
    }
    .topbar ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }
    .topbar li {
        margin-right: 30px;
    }
    .topbar a {
        color: white;
        text-decoration: none;
    }
    .sidebar {
        height: 100vh;
        width: 200px;
        position: fixed;
        top: 30px;
        left: 0;
        background-color: #333;
        overflow-x: hidden;
        padding-top: 20px;
    }
    .sidebar a {
        padding: 10px 15px;
        text-decoration: none;
        font-size: 18px;
        color: white;
        display: block;
    }
    .sidebar a:hover {
        background-color: #575757;
    }
    .main-content {
        margin-left: 220px;
        margin-top: 70px;
        padding: 20px;
        position: relative;
        z-index: 1; 
        padding: 20px; 
        background: rgba(255, 255, 255, 0.8); 
        border-radius: 10px; 
    }
    h1 {
        text-align: center;
        margin-top: 0;
    }
</style>
</head>
<body>

<div class="topbar">
    <ul>
         <li>流浪猫管理系统</li>
    </ul>
</div>

 <div class="sidebar">
        <a href="<%= response.encodeUrl("home.jsp") %>">主页</a>
        <a href="<%= response.encodeUrl("catsEditor.jsp") %>">猫咪之家</a>
        <a href="<%= response.encodeUrl("shop.jsp") %>">商城</a>
        <a href="<%= response.encodeUrl("contact.jsp") %>">联系我们</a>
</div>
<div class="background"></div> 
<div class="main-content">
    <h1>联系栏</h1>
    <h2>如果有什么疑问，可以通过邮箱联系我们！</h2>
    <h3>我们的邮箱是：2115668830@qq.com</h3>
    <h4>特此声明：本页面是由李先泽，吴宏臻，赵嘉铭同学制作，感谢您的使用！</h4>
</div>

</body>
</html>
