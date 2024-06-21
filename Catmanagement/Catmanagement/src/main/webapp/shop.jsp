<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商店</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .background {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: url('bg.jpg');
        background-size: cover;
        background-position: center;
        z-index: -1;
        filter: brightness(0.5) blur(5px);
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
    .shop {
        margin-left: 220px;
        margin-top: 70px;
        padding: 20px;
        position: relative;
        z-index: 1;
        padding: 20px;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 10px;
    }
    .shop-items {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }
    .shop-item {
        background-color: white;
        padding: 15px;
        border-radius: 10px;
        width: 200px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .shop-item img {
        width: 100%;
        border-radius: 10px;
    }
    .shop-item h3 {
        margin: 10px 0 5px;
    }
    .shop-item p {
        margin: 5px 0;
    }
    .shop-item form {
        margin-top: 10px;
    }
    .shop-item button {
        padding: 10px 20px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .shop-item button:hover {
        background-color: #575757;
    }
    .modal {
        display: none; /* 初始隐藏 */
        position: fixed;
        z-index: 1001;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.5);
        justify-content: center;
        align-items: center;
    }
    .modal-content {
        height: 700px;
        width: 400px;
        background-color: white;
        padding: 10px;
        border-radius: 10px;
        text-align: center;
        position: relative;
        z-index: 1002;
    }
    .modal-content img {
        max-width: 100%;
        height: auto;
    }
    .modal-content .close {
        position: absolute;
        top: 10px;
        right: 10px;
        color: black;
        font-size: 24px;
        cursor: pointer;
    }
</style>
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
<div class="shop">
    <h1>商城</h1>
    <div class="shop-items">
        <div class="shop-item">
            <img src="food1.jpg">
            <h3>三鹿猫粮</h3>
            <p>价格：￥50</p>
            <form>
                <input type="hidden" name="product" value="猫粮">
                <input type="hidden" name="price" value="50">
                <button type="button" onclick="showPayment()">购买</button>
            </form>
        </div>
        <div class="shop-item">
            <img src="food2.jpg">
            <h3>精品猫粮</h3>
            <p>价格：￥100</p>
            <form>
                <input type="hidden" name="product" value="猫粮">
                <input type="hidden" name="price" value="80">
                <button type="button" onclick="showPayment()">购买</button>
            </form>
        </div>
        <div class="shop-item">
            <img src="food3.jpg">
            <h3>御用猫粮</h3>
            <p>价格：￥500</p>
            <form>
                <input type="hidden" name="product" value="猫粮">
                <input type="hidden" name="price" value="200">
                <button type="button" onclick="showPayment()">购买</button>
            </form>
        </div>

    </div>
</div>

<div id="paymentModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closePayment()">&times;</span>
        <img src="pay.jpg" alt="Payment Methods">
        <p>请扫描二维码以完成付款。</p>
    </div>
</div>

<script>
    function showPayment() {
        var modal = document.getElementById('paymentModal');
        modal.style.display = 'flex';
    }

    function closePayment() {
        var modal = document.getElementById('paymentModal');
        modal.style.display = 'none';
    }

    window.onclick = function(event) {
        var modal = document.getElementById('paymentModal');
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }
</script>

</body>
</html>

