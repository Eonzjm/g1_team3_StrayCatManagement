<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h5 style="text-align: center">网页开发大作业</h5>    
<h1 style="text-align: center">宿舍管理系统</h1>
<%
   String eUrl = response.encodeUrl("login.jsp");  //重写URL，以防止浏览器关闭Cookie时Session ID依然可以获得
   String regUrl = response.encodeUrl("userReg.jsp");
   String logoutUrl = response.encodeUrl("logout");
   out.print("<ul style='justify-content: right; align-items: right;'>");
   if(null == session.getAttribute("curUser")){
	   out.print("<li style='margin-right: 30px'><a href='" + eUrl + "'>登录</a></li>");
	   out.print("<li style='margin-right: 30px'><a href='" + regUrl + "'>注册</a></li>");
   }
   else {
	   out.print("<li style='margin-right: 30px'>欢迎" + session.getAttribute("curUser") + "！&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + logoutUrl + "'>退出登录</a></li>");
   }
   out.print("</ul>");
%>

