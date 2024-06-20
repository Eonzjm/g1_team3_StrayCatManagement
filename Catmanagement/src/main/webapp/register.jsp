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
<script type="text/javascript">
    function formVerify() {
        var pass = true;
        var message = "";

        // 验证用户名是否为空
        if (document.forms[0].username.value.trim() == "") {
            pass = false;
            message += "用户名不能为空！\n";
        }

        // 验证密码是否为空
        if (document.forms[0].pwd.value.trim() == "") {
            pass = false;
            message += "密码不能为空！\n";
        }

        // 验证密码和确认密码是否匹配
        if (document.forms[0].pwd.value.trim() != document.forms[0].pwdconfirm.value.trim()) {
            pass = false;
            message += "密码与确认密码不一致！\n";
        }

        // 验证邮箱格式
        if (document.forms[0].email.value.trim() != "") {
        	var exp=/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
            if (exp.test(document.forms[0].email.value.trim()) == false) {
                pass = false;
                message += "邮箱地址格式不正确！\n";
            }
        }

        if (pass)
            // 验证用户名是否存在
            if (testUserName(document.forms[0].username.value.trim()) == 'y') 
                document.forms[0].submit();
            else 
                alert("用户名已经存在。请更换用户名！");
        else
            alert(message);
    }

    function testUserName(userName) {
        var result;
        var xmlhttp = new XMLHttpRequest();
        var url = "TestUserNameServlet?uname=" + userName;
        xmlhttp.open("GET", url, false);
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                result = xmlhttp.responseText;
            }
        }
        xmlhttp.send();
        return result;
    }

    function redirectToLogin() {
        if (confirm("确认要返回登录页面吗？")) {
            window.location.href = 'login.jsp';
        }
    }
</script>
</head>
<body>
    <div class="bg">
        <div class="register-container">
            <h2>注册</h2>
            <form action="registerServlet" method="post">
                <label for="username"><b>用户名</b></label>
                <input type="text" id="username" name="username" placeholder="输入用户名" value="${currUser.username}"/>
                
                <label for="pwd"><b>密码</b></label>
                <input type="password" id="pwd" name="pwd" placeholder="输入密码" value="${currUser.pwd}"/>
                
                <label for="pwdconfirm"><b>确认密码</b></label>
                <input type="password" id="pwdconfirm" name="pwdconfirm" placeholder="确认密码" value="${currUser.pwd}"/>
                
                <label for="email"><b>邮箱</b></label>
                <input type="text" id="email" name="email" placeholder="输入邮箱" value="${currUser.email}"/>
                
                <div class="button-container">
                    <button type="button" onclick="formVerify()">注册</button>
                    <button type="button" onclick="redirectToLogin()">返回登录</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
