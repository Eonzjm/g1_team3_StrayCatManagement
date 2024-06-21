<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
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
	.tablecontainer {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	table{
		text-align: center;
 		border: 1px solid; 
  		border-collapse: collapse;
		margin: 0 auto;
	}
	.bgcolor{
		  background-color: #F08080;
	}
	.selecolor{
		  background-color: lightblue;
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
     }
     .container {
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		initState();
		setTotalPage(); 
	});
	var curRow = null;
	var state = 0; 
	function selerow(obj){
	    state = 0;
		if(curRow != null){
			curRow.className="";
		}
		curRow = obj;
		obj.className="selecolor";
		disprow(obj);
		$("#btnModify").removeAttr("disabled");
		$("#btnDelete").removeAttr("disabled");
		$("#btnNew").removeAttr("disabled");
		$("#btnSave").attr("disabled", "true");
		$(":text").attr("disabled", "true");
		$(":file").attr("disabled", "true");
	}
	function disprow(obj){
		var tds = obj.getElementsByTagName("td");
		$("#catname").val(tds[1].innerText);
		$("#introduction").val(tds[2].innerText);
		$("#gender").val(tds[3].innerText);
		$("#picFile").attr("filename", tds[4].innerText);
	}
	function blankRow(){
		$(":text").val("");
		$(":file").val("");
	}
	function initState(){
		state = 0;//初始状态
		$(":text").attr("disabled", "true");
		$(":file").attr("disabled", "true");
		$("#btnSave").attr("disabled", "true");
		$("#btnModify").attr("disabled", "true");
		$("#btnDelete").attr("disabled", "true");
	}
	function editState(){
		$(":text").removeAttr("disabled");
		$(":file").removeAttr("disabled");
	}
	function modiRow(){
		state = 1;//修改状态
		editState();
		$("#btnModify").attr("disabled", "true");
		$("#btnSave").removeAttr("disabled");
	}
	function newRow(){
		state = 2;//添加状态
		if(curRow != null){
			curRow.className="";
			curRow = null;//清楚当前行的选中状态
		}
		$("#btnNew").attr("disabled", "true");
		$("#btnDelete").attr("disabled", "true");
		$("#btnModify").attr("disabled", "true");
		$("#btnSave").removeAttr("disabled");
		blankRow();
		editState();
	}
	function deleteRow(){
		state = 0;
		var tds = curRow.getElementsByTagName("td");
		var objId = tds[0].innerText;
		var curPage = $("#curPage").val();
		var pageSize = $("#pageSize").val();
		var totalRows = $("#totalRows").val();
		$.ajax({
			    url: "DeleteCatServlet",
			    type: "POST",
			    data: {"objId": objId, "curPage": curPage, "pageSize": pageSize},  
			    success: function(data) {
			       if(data=='n'){
			    	  alert("由于服务器原因，删除不成功。请稍后重试！");
			       }
			       else{
			          window.location.href="GetCatServlet?pageSize="+pageSize+"&&curPage="+curPage;
			       }
			   }
	   });
    }
	function setTotalPage(){
		var curPage = $("#curPage").val();
		var pageSize = $("#pageSize").val();
		var totalRows = $("#totalRows").val();
		var pages = Math.ceil(Number(totalRows)/pageSize);
		$("#pages").html(pages);
	}	
	function isClean(){
		var tds = curRow.getElementsByTagName("td");
		if (
			$("#catname").val() == tds[1].innerText &&
			$("#introduction").val() == tds[2].innerText &&
			$("#gender").val() == tds[3].innerText
		)
			return true;
		else
			return false;
	}
	function isValid(){
		var result = true;
		var msg = "";
		if ($("#catname").val().trim() == ""){
			msg += "小猫名字不能为空！\n";
			result = false;
		}
		if ($("#introduction").val().trim() == ""){
			msg += "小猫基本信息不能为空！\n";
			result = false;
		}
		if(result==false)
			alert(msg);
		return result;
	}
	function saveRow(){
		if(isValid() == false){
			return;
		}
		if(state==1){
			if(false == isClean() ||$("#picFile").get(0).files.length != 0){
				var curPage = $("#curPage").val();
				var pageSize = $("#pageSize").val();
				var tds = curRow.getElementsByTagName("td");
				var objId = tds[0].innerText;
				var formData = new FormData();
				formData.append("objId", objId);
				formData.append("catname", encodeURI($("#catname").val()));
				formData.append("gender", $("#gender").val()=='公'?1:2);
				formData.append("introduction", encodeURI($("#introduction").val()));
				formData.append("picFile", $("#picFile").get(0).files[0]);
				$.ajax({
					url: "ModiCatServlet",
				       type: "POST",
					   data: formData,
					   datatype: "text",
					   cache: false,//禁用缓存
			           async: true,//异步请求
			           processData: false,
			           contentType: false,//不改变传给服务器的数据
			           success: function(data){
					       if(data=='n'){
					    	   alert("由于服务器原因，保存不成功。请稍后重试！");
					       }
				           else{
				               window.location.href="GetCatServlet?pageSize="+pageSize+"&&curPage="+curPage;  //刷新界面了相当于是
					           $("#btnSave").attr("disabled", "true");
					           $("#btnModify").removeAttr("disabled");
					           $(":text").attr("disabled", "true");
							   $(":file").attr("disabled", "true");//禁用那些按钮
							   state = 0;
				          }
				       }
				   });
		 }else {
			alert("无修改，不需要保存！");
		 }
   }
	else if(state==2){ 
		   var curPage = $("#curPage").val();
		   var pageSize = $("#pageSize").val();
		   var formData = new FormData();
		   formData.append("catname", encodeURI($("#catname").val()));
		   formData.append("gender", $("#gender").val()=='公'?1:2);
		   formData.append("introduction", encodeURI($("#introduction").val()));
		   formData.append("picFile", $("#picFile").get(0).files[0]);
		   $.ajax({
			    url: "NewCatServlet",
			    type: "POST",
			    data: formData,
			    datatype: "text",
			    cache: false,
	            async: true,
	            processData: false,
	            contentType: false,
	            success: function(data){
			       if(data=='n'){
			    	   alert("由于服务器原因，保存不成功。请稍后重试！");
			       }
			       else{
			           window.location.href="GetCatServlet?pageSize="+pageSize+"&&curPage="+curPage;  //reload page
			           $("#btnSave").attr("disabled", "true");
			           $("#btnNew").removeAttr("disabled");
					   $("#btnModify").attr("disabled", "true");
					   blankRow();
					   $(":text").attr("disabled", "true");
					   $(":file").attr("disabled", "true");
			           state = 0;
			      }    
				}
		   });
	}
}
    var adminPassword = "214603103267";
    
    function adminModify() {
        var inputPassword = prompt("请输入管理员密码:");
        if (inputPassword === adminPassword) {
        	modiRow(); 
        } else {
            alert("管理员密码错误，操作被取消。");
        }
    }
    
    function adminSave() {
        var inputPassword = prompt("请输入管理员密码:");
        if (inputPassword === adminPassword) {
            saveRow(); 
        } else {
            alert("管理员密码错误，操作被取消。");
        }
    }
    
    function adminDelete() {
        var inputPassword = prompt("请输入管理员密码:");
        if (inputPassword === adminPassword) {
        	deleteRow(); 
        } else {
            alert("管理员密码错误，操作被取消。");
        }
    }

</script>
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
    
    <div class="container">
        <div class="mid">
        	<input type="hidden" id="curPage" value="${requestScope.pageInfo.pageNum}" />
        	<input type="hidden" id="pageSize" value="${requestScope.pageInfo.pageSize}" />
        	<input type="hidden" id="totalRows" value="${requestScope.pageInfo.totalRows}" />
	        <h1>猫咪之家</h1>
	        <div class="tablecontainer">
		        <table id="stTable"  border="1" style="border-color: PaleGreen" >
		            <thead>
			        	<tr>
			        		<th width="50px">序号</th>
			        		<th width="100px">猫咪名字</th>
			        		<th width="50px">性别</th>
			        		<th width="200px">介绍</th>
			        		<th width="250px">照片</th>
			        	</tr>
		        	</thead>
		        	<tbody>
			        	<c:forEach var="s" items="${cats}">
				        	<tr onclick="selerow(this)">
				        		<td>${s.id}</td>
				        		<td>${s.catname}</td>
				        		<td>${s.gender==1?'公':'母'}</td>
				        		<td>${s.introduction}</td>
				        		<td><img src="picFiles/${s.picFile}" alt="相片" width="60px" height="80px"></td>
				        	</tr>
			        	</c:forEach>
		        	</tbody>
		        	<tfoot>
			        	<tr>
			        		<c:url var="url_pre" value="GetCatServlet?pageSize=${requestScope.pageInfo.pageSize}&&curPage=${requestScope.pageInfo.pageNum - 1}">
			        		</c:url>
			        		<c:url var="url_next" value="GetCatServlet?pageSize=${requestScope.pageInfo.pageSize}&&curPage=${requestScope.pageInfo.pageNum + 1}">
			        		</c:url>
			        		<td colspan="8" align="right">
				        	    共<span id="pages"></span>页&nbsp;&nbsp;第${requestScope.pageInfo.pageNum}页&nbsp;&nbsp;
				        	    <c:if test="${requestScope.pageInfo.pageNum!=1}">
				        	    	<a href="${url_pre}">上一页</a>&nbsp;&nbsp;
				        	    </c:if>
				        	    <c:if test="${requestScope.pageInfo.pageNum * requestScope.pageInfo.pageSize < requestScope.pageInfo.totalRows}">
				        	    	<a href="${url_next}">下一页</a>
				        	    </c:if>
			        	    </td>
			        	</tr>
		        	</tfoot>
		        </table>
	        </div>
	        <h3 align="center">猫咪信息编辑</h3>
	        <div class="edit" align="center">
	        	<label for="catname">猫咪名字：</label><input type="text" name="catname" id="catname" />
	        	<label for="gender">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：</label><input type="text" name="gender" id="gender" />
	        	<label for="introduction">介绍：</label><input type="text" name="introduction" id="introduction" /><br />
	        	<label for="picFile">上传照片：</label><input type="file" name="picFile" id="picFile" accept="image/*" /><br />
	        	<input type="button" id="btnModify" value="修改" onclick="adminModify()" />
	        	<input type="button" id="btnSave" value="保存" onclick="adminSave()" />
	        	<input type="button" id="btnNew" value="新增" onclick="newRow()" />
	        	<input type="button" id="btnDelete" value="删除" onclick="adminDelete()" />
	        </div>
        </div>
    </div>
</body>
</html>

