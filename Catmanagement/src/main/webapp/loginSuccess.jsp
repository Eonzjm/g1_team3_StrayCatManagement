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
        cursor: pointer;
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
                <li><a id="cat" href="#">猫咪</a></li>
                <li><a id="shop" href="#">商城</a></li>
                <li><a id="notice" href="#">公告</a></li>
                <li><a id="contact" href="#">联系我们</a></li>
            </ul>
        </div>
        <div class="main-content" id="main-content">
            <%@ include file="cat.jsp" %>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const links = document.querySelectorAll(".sidebar ul li a");
            const contentDiv = document.getElementById("main-content");

            links.forEach(link => {
                link.addEventListener("click", function(e) {
                    e.preventDefault();
                    
                    // 获取链接 ID 以确定要加载的 JSP 文件
                    const page = this.id + ".jsp";
                    
                    // 通过 AJAX 请求加载内容
                    const xhr = new XMLHttpRequest();
                    xhr.open("GET", page, true);
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            contentDiv.innerHTML = xhr.responseText;
                        }
                    };
                    xhr.send();
                });
            });
        });
    </script>
</body>
</html>
