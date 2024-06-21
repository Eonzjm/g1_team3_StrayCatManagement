<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>流浪猫管理系统</title>
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
            <% 
                String eUrl = response.encodeUrl("login.jsp");
                String regUrl = response.encodeUrl("register.jsp");
                String logoutUrl = response.encodeUrl("logout");
                if (session.getAttribute("curUser") == null) {
                    out.print("<li><a href='" + eUrl + "'>登录</a></li>");
                    out.print("<li><a href='" + regUrl + "'>注册</a></li>");
                } else {
                    out.print("<li>欢迎 " + session.getAttribute("curUser") + "！&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + logoutUrl + "'>退出登录</a></li>");
                }
            %>
        </ul>
    </div>

     <div class="sidebar">
        <a href="<%= response.encodeUrl("home.jsp") %>">主页</a>
        <a href="<%= response.encodeUrl("GetCatServlet") %>">猫咪之家</a>
        <a href="<%= response.encodeUrl("shop.jsp") %>">商城</a>
        <a href="<%= response.encodeUrl("contact.jsp") %>">联系我们</a>
    </div>
    <div class="background"></div> 

    <div class="main-content">
        <h1>流浪猫管理系统</h1>
        <h2>欢迎来到我们的流浪猫管理系统！</h2>
        <h3>你见过无家可归的流浪猫吗？你见过在寒冷的冬天，冻死在街头的小猫吗？你见过被野狗欺负伤痕累累的小猫咪吗？</h3>
        <h3>如果你想帮助他们，或者你没见过，想见一下，欢迎使用我们的流浪猫管理系统！</h3>
        <!-- 你可以在这里添加更多的主页面内容 -->
    </div>
</body>
</html>
