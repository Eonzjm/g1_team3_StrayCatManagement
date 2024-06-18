<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册界面</title>
	<link rel="stylesheet" href="layout.css" type="text/css" />
	<link rel="stylesheet" href="form.css" type="text/css" />
	<script type="text/javascript">
		function formVerify(){
			pass = true;
			message = "";
			if(document.forms[0].name.value.trim() == ""){
				pass = false;
				message += "姓名不能为空！\n";
			}
			if(document.forms[0].pwd.value.trim() == ""){
				pass = false;
				message += "密码不能为空！\n";
			}
			if(document.forms[0].pwd.value.trim() != document.forms[0].pwdconfirm.value.trim()){
				pass = false;
				message += "密码与确认密码不一致！\n";
			}
			if(document.forms[0].phone.value.trim() != ""){
				var reg = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-9])|(18[0-9])|166|198|199|191)\\d{8}$";
				var regExp = new RegExp(reg);
				if(regExp.test(document.forms[0].phone.value.trim())==false){
					pass = false;
					message += "手机号码格式不正确！\n"
				}
			}
			if(document.forms[0].email.value.trim() != ""){
				var exp=/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
				if(exp.test(document.forms[0].email.value.trim())==false){
					pass = false;
					message += "邮箱地址格式不正确！"
				}
			}
			if(pass)
				if(testUserName(document.forms[0].name.value.trim())=='y')
			        document.forms[0].submit();
				else
					alert("用户名已经存在。请更换用户名！")
			else
				alert(message);
		}
		function testUserName(userName){
			var result;
			xmlhttp = new XMLHttpRequest();
			url = "TestUserNameServlet?uname=" + userName;
			xmlhttp.open("GET", url, false);  //同步调用
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					result = xmlhttp.responseText;
				}
			}
			xmlhttp.send();
			return result;
		}
	</script>
</head>
<body>
 	<header><jsp:include page="header.jsp"/></header>
    <nav><jsp:include page="nav.jsp"/></nav>
    <div class="container">
        <div class="left"></div>
        <div class="mid">
    		<br/><h3 align="center">用户注册</h3>
    		<h5 align="center"><span style="color: red">${requestScope.postError}</span></h5><br/>
	        <form action="UserRegServlet" method="post">
				  <p>请输入用户名、密码、电话和邮箱，然后点击“提交”按钮注册。</p>
				  <div>
				    <label for="name">用户名:</label>
				    <input type="text" id="name" name="name" value="${currUser.name}"/>
				  </div>
				  <div>
				    <label for="pwd">密码:</label>
				    <input type="text" id="pwd" name="pwd" value="${currUser.pwd}" />
				  </div>
				   <div>
				    <label for="pwdconfirm">确认密码:</label>
				    <input type="text" id="pwdconfirm" name="pwdconfirm" value="${currUser.pwd}" />
				  </div>
				   <div>
				    <label for="phone">电话:</label>
				    <input type="text" id="phone" name="phone" value="${currUser.phone}" />
				  </div>
				   <div>
				    <label for="email">邮箱:</label>
				    <input type="text" id="email" name="email" value="${currUser.email}" />
				  </div>
				  <div>
				    <div class="column"></div>
				    <div class="column"><button type="button" onclick="formVerify()" >提交</button>&nbsp;&nbsp;<button type="reset">重置</button></div>
				  </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
			</form>
        </div>
        <div class="right"></div>
        <div class="clear"></div>
    </div>
    <footer><jsp:include page="footer.jsp"/></footer>
</body>
</html>