<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>猫咪介绍</title>
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
    /* 新增的文本区域样式 */
    .cat-intro {
        width: 60%;
        height: 500px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        resize: none; /* 禁止调整大小 */
        margin-bottom: 20px;
    }
</style>
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
