<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>目录界面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .search-container, .jump-container {
            margin-bottom: 20px;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            margin-right: 10px;
            width: 70%;
        }
        button {
            padding: 10px;
        }
        .result {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>目录界面</h1>
        <div class="search-container">
            <h2>搜索关键字</h2>
            <input type="text" id="searchKeyword" placeholder="输入关键字">
            <button onclick="searchKeyword()">搜索</button>
        </div>
        <div class="jump-container">
            <h2>跳转到页数</h2>
            <input type="number" id="pageNumber" placeholder="输入页码">
            <button onclick="jumpToPage()">跳转</button>
        </div>
        <div id="result" class="result"></div>
    </div>

    <script>
        function searchKeyword() {
            const keyword = document.getElementById('searchKeyword').value;
            if (keyword) {
                document.getElementById('result').innerText = '搜索结果：' + keyword;
                // 这里可以添加实际的搜索功能，例如过滤显示的目录项
            } else {
                document.getElementById('result').innerText = '请输入关键字进行搜索。';
            }
        }

        function jumpToPage() {
            const pageNumber = document.getElementById('pageNumber').value;
            if (pageNumber) {
                document.getElementById('result').innerText = '跳转到第 ' + pageNumber + ' 页';
                // 这里可以添加实际的跳转功能，例如滚动到特定页码的内容
            } else {
                document.getElementById('result').innerText = '请输入有效的页码。';
            }
        }
    </script>
</body>
</html>