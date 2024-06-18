<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>流浪猫管理系统</title>
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
    }
    .header {
        background-color: #009ad6;
        color: white;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .header h1 {
        margin: 0;
    }
    .logout-btn {
        background-color: #d3d7d4;
        border: none;
        color: #130c0e;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 14px;
        border-radius: 5px;
    }
    .logout-btn:hover {
        background-color: #999d9c;
    }
    .content {
        flex: 1;
        display: flex;
    }
    .sidebar {
        background-color: #90d7ec;
        width: 200px;
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }
    .sidebar ul {
        list-style-type: none;
        padding: 0;
    }
    .sidebar ul li {
        margin: 15px 0;
    }
    .sidebar ul li a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }
    .sidebar ul li a:hover {
        color: #4CAF50;
    }
    .main-content {
        flex: 1;
        padding: 20px;
    }
</style>
</head>
<body>
    <div class="header">
        <h1>流浪猫管理系统</h1>
        <button class="logout-btn" onclick="location.href='login.jsp'">退出登录</button>
    </div>
    <div class="content">
        <div class="sidebar">
            <ul>
                <li><a href="#">猫咪介绍</a></li>
                <li><a href="#">商城</a></li>
                <li><a href="#">公告</a></li>
                <li><a href="#">联系我们</a></li>
            </ul>
        </div>
        <div class="main-content">
            <!-- 添加个图片 -->
        </div>
    </div>
</body>
</html>
