<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
ul {
display: flex; 
justify-content: left; 
align-items: left;  
list-style: none;
margin: 0;
padding: 0;
}
li {
display: inline-block;
padding: 0;
margin-right: 30px;
background-color: #f2f2f2;
border: 0;
}
</style>
<%
   String mainUrl = response.encodeUrl("index.jsp");  //重写URL以防止浏览器关闭Cookie
   String stuUrl = response.encodeUrl("GetStudentsServlet?curPage=1&&pageSize=3");
   out.print("<ul>");
   out.print("<li><a href='" + mainUrl + "'>主页</a></li>");
   if(null != session.getAttribute("curUser")){
	   out.print("<li><a href='" + stuUrl + "'>宿舍管理</a></li>");
   }
   out.print("</ul>");
%>
