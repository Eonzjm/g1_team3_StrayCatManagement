<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<style>
    .cat-container {
        display: flex;
        padding: 20px;
        height: calc(100vh - 100px); 
    }
    .cat-image-container {
        width: 50%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }
    .cat-image {
        width: 300px;
        height: 300px;
        object-fit: cover;
        border: 1px solid #ccc;
        border-radius: 10px;
        margin-bottom: 20px;
    }
    .cat-details {
        width: 50%;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    .cat-name {
        font-size: 24px;
        margin-bottom: 20px;
    }
    .feed-btn {
        padding: 10px 20px;
        border: none;
        background-color: #4CAF50;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        margin-bottom: 20px;
    }
    .feed-btn:hover {
        background-color: #45a049;
    }
    .navigation {
        display: flex;
        justify-content: space-between;
        width: 60%;
    }
    .nav-btn {
        padding: 10px 20px;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
        border-radius: 4px;
        cursor: pointer;
    }
    .nav-btn:hover {
        background-color: #ddd;
    }
    .page-number {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 50px;
        text-align: center;
    }
    .cat-intro {
        width: 60%;
        height: 500px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        resize: none;
        margin-bottom: 20px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			initState();
			setTotalPage(); 
		});

	    var curRow = null;
	    var state = 0; //0--init, 1--modi, 2--new
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
			$("#catName").val(tds[1].innerText);
			$("#introduction").val(tds[2].innerText);
			$("#picFile").attr("filename", tds[3].innerText);
		}
		function blankRow(){
			$(":text").val("");
			$(":file").val("");
		}
		function initState(){
			state = 0;
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
			     url: "DeleteStudentServlet",
			     type: "POST",
			     data: {"objId": objId, "curPage": curPage, "pageSize": pageSize},  //dataType: "json",
			     success: function(data) {
			        if(data=='n'){
			    	   alert("由于服务器原因，删除不成功。请稍后重试！");
			        }
			        else{

			           window.location.href="GetStudentsServlet?pageSize="+pageSize+"&&curPage="+curPage;
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
				$("#catName").val() == tds[1].innerText &&
				$("#introduction").val() == tds[2].innerText &&
				$("#picFile").val() == tds[3].innerText &&

			)
				return true;
			else
				return false;
		}
		function isValid(){
			var result = true;
			var msg = "";
			
			if ($("#catname").val().trim() == ""){
				msg += "名字不能为空！\n";
				result = false;
			}
			if ($("#introduction").val().trim() == ""){
				msg += "介绍不能为空！\n";
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
					formData.append("studentId", $("#studentId").val());
					formData.append("citizenId", $("#citizenId").val());
					formData.append("name", encodeURI($("#name").val()));
					formData.append("gender", $("#gender").val()=='男'?1:2);
					formData.append("dormitory", encodeURI($("#dormitory").val()));
					formData.append("enrollDate", $("#enrollDate").val());
					formData.append("picFile", $("#picFile").get(0).files[0]);
					$.ajax({
					        url: "ModiStudentServlet",
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
					            	window.location.href="GetStudentsServlet?pageSize="+pageSize+"&&curPage="+curPage;  //reload page
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
			else if(state==2){ 
				var curPage = $("#curPage").val();
				var pageSize = $("#pageSize").val();
				var formData = new FormData();
				formData.append("studentId", $("#studentId").val());
				formData.append("citizenId", $("#citizenId").val());
				formData.append("name", encodeURI($("#name").val()));
				formData.append("gender", $("#gender").val()=='男'?1:2);
				formData.append("dormitory", encodeURI($("#dormitory").val()));
				formData.append("enrollDate", $("#enrollDate").val());
				formData.append("picFile", $("#picFile").get(0).files[0]);
				$.ajax({
				    url: "NewStudentServlet",
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
				        	window.location.href="GetStudentsServlet?pageSize="+pageSize+"&&curPage="+curPage;  //reload page
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
    <div class="cat-container">
        <div class="cat-image-container">
            <img src="image/cat1.jpg" alt="猫咪图片" class="cat-image">
            <div class="cat-name">流浪猫</div>
            <button class="feed-btn">投喂</button>
        </div>
        <div class="cat-details">
            <h2>流浪猫介绍</h2>
            <textarea class="cat-intro">这里是流浪猫的详细介绍...</textarea>
            <div class="navigation">
                <button class="nav-btn">上一页</button>
                <input type="text" class="page-number" value="1" readonly>
                <button class="nav-btn">下一页</button>

            </div>
        </div>
    </div>
</body>
</html>
