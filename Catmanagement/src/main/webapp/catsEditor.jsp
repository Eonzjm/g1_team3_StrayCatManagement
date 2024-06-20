<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>主页</title>
	<link rel="stylesheet" href="layout.css" type="text/css" />
	<style type="text/css">
		.tbcontainer {
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
	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			initState();
			setTotalPage(); //第12次课添加，设置总页数
		});
	    var curRow = null;
	    var state = 0; //0--init, 1--modi, 2--new
		function selerow(obj){
	    	state = 0;
			if(curRow != null){//恢复原来选中行的底色
				curRow.className="";
			}
			curRow = obj;
			obj.className="selecolor";//设置选中行为浅蓝色
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
			//document.getElementById("studentId").value = obj.childNodes[3].innerText;
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
			state = 0;
			$(":text").attr("disabled", "true");//使文本框只读
			$(":file").attr("disabled", "true");
			$("#btnSave").attr("disabled", "true");//使按钮失效
			$("#btnModify").attr("disabled", "true");
			$("#btnDelete").attr("disabled", "true");
		}
		function editState(){
			$(":text").removeAttr("disabled");//使按钮有效
			$(":file").removeAttr("disabled");
		}
		function modiRow(){
			state = 1;
			editState();
			$("#btnModify").attr("disabled", "true");
			$("#btnSave").removeAttr("disabled");
		}
		function newRow(){
			state = 2;
			if(curRow != null){
				curRow.className="";
				curRow = null;
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
			     url: "DeleteCatservlet",
			     type: "POST",
			     data: {"objId": objId, "curPage": curPage, "pageSize": pageSize},  //dataType: "json",
			     success: function(data) {
			        if(data=='n'){
			    	   alert("由于服务器原因，删除不成功。请稍后重试！");
			        }
			        else{
			           // 清空表格内容
			           window.location.href="GetCatsServlet?pageSize="+pageSize+"&&curPage="+curPage;
			       }
			   }
			});
		}
		//以下为第12次课新增，实现保存功能
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
				$("#gender").val() == tds[3].innerText &&
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
					        url: "ModiCatservlet",
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
					            	window.location.href="GetCatsServlet?pageSize="+pageSize+"&&curPage="+curPage;  //reload page
						           	$("#btnSave").attr("disabled", "true");
						           	$("#btnModify").removeAttr("disabled");
						           	$(":text").attr("disabled", "true");
								   	$(":file").attr("disabled", "true");
								   	state = 0;
					           }
					       }
					   });
			  }else {
					alert("无修改，不需要保存！");
			  }
			}
			else if(state==2){ //new
				//save and refresh
				var curPage = $("#curPage").val();
				var pageSize = $("#pageSize").val();
				var formData = new FormData();
				formData.append("catname", encodeURI($("#catname").val()));
				formData.append("gender", $("#gender").val()=='公'?1:2);
				formData.append("introduction", encodeURI($("#introduction").val()));
				formData.append("picFile", $("#picFile").get(0).files[0]);
				$.ajax({
				    url: "NewCatservlet",
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
				        	window.location.href="GetCatsServlet?pageSize="+pageSize+"&&curPage="+curPage;  //reload page
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
	</script>
</head>
<body>
	<header><jsp:include page="header.jsp"/></header>
    <nav><jsp:include page="nav.jsp"/></nav>
    <div class="container">
        <div class="left">left</div>
        <div class="mid">
        	<input type="hidden" id="curPage" value="${requestScope.pageInfo.pageNum}" />
        	<input type="hidden" id="pageSize" value="${requestScope.pageInfo.pageSize}" />
        	<input type="hidden" id="totalRows" value="${requestScope.pageInfo.totalRows}" />
	        <h3 align="center">猫咪列表</h3>
	        <div class="tbcontainer">
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
			        	<c:forEach var="s" items="${requestScope.cats}">
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
			        		<c:url var="url_pre" value="GetCatsServlet?pageSize=${requestScope.pageInfo.pageSize}&&curPage=${requestScope.pageInfo.pageNum - 1}">
				        		<!-- C:param name="pageSize" value="${requestScope.pageInfo.pageSize}" /-->
				        		<!--C:param name="curPage" value="${requestScope.pageInfo.pageNum - 1}" /--> 
			        		</c:url>
			        		<c:url var="url_next" value="GetCatsServlet?pageSize=${requestScope.pageInfo.pageSize}&&curPage=${requestScope.pageInfo.pageNum + 1}">
				        		<!-- C:param name="pageSize" value="${requestScope.pageInfo.pageSize}" /-->
				        		<!-- C:param name="curPage" value="${requestScope.pageInfo.pageNum + 1}" /-->
			        		</c:url>
			        		<!-- c:set var="pa" value="${requestScope.pageInfo.totalRows / requestScope.pageInfo.pageSize}" / -->
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
	        	<label for="gender">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：</label><input type="text" name="gender" id="gender" /><br />
	        	<label for="introduction">宿舍号：</label><input type="text" name="introduction" id="introduction" />
	        	<label for="picFile">上传照片：</label><input type="file" name="picFile" id="picFile" accept="image/*" /><br />
	        	<input type="button" id="btnModify" value="修改" onclick="modiRow()" />
	        	<input type="button" id="btnSave" value="保存" onclick="saveRow()" />
	        	<input type="button" id="btnNew" value="新增" onclick="newRow()" />
	        	<input type="button" id="btnDelete" value="删除" onclick="deleteRow()" />
	        </div>
        </div>
        <div class="right">right</div>
        <div class="clear"></div>
    </div>
    <footer><jsp:include page="footer.jsp"/></footer>
</body>
</html>

