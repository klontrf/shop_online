<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/5/20
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>淘乐在线商城</title>
    <style>
        body {
            overflow-x: hidden;
            text-align: center;

        }

        .car {
            /*overflow: auto;*/
            width: 100%;
            border: 1px solid #F88020;
            border-radius: 18px;
        }

        .car .good {
            background-color: #F88020;
            height: 55px;
            font-size: 22px;
            color: white;
            line-height: 55px;
            font-weight: 200;
            border-radius: 18px 18px 0 0;
            margin-bottom: 20px;
padding-top: 10px;
        }

        .car .good table {
            width: 100%;
            padding-top: 10px;
        }

        .car .goods {
            height: 45px;
            line-height: 45px;
            font-size: 20px;
            font-weight: 200;
        }

        .car .goods table {
            width: 100%;
        }

        .car .goods table .btn1 {
            width: 70px;
            height: 28px;
            border: 2px solid #46B3E6;
            background-color: white;
            color: #46B3E6;
            border-radius: 4px;
            font-weight: 600;
        }

        .car .goods1 .btn2 {
            width: 80px;
            height: 30px;
            border: 2px solid #21BF73;
            background-color: white;
            color: #21BF73;
            border-radius: 4px;
            font-weight: 600;
        }

        .car .goods1 .btn3 {
            width: 80px;
            height: 30px;
            border: 2px solid #FF0000;
            background-color: white;
            color: #FF0000;
            border-radius: 4px;
            font-weight: 600;
        }

        .car .goods table button:hover {
            background-color: #46B3E6;
            color: white;
        }

        .car .goods1 {
            margin-top: 10px;
padding-top: 15px;
            background-color: rgb(255, 196, 0);
            height: 50px;
            font-size: 19px;
            color: white;
            line-height: 50px;
            font-weight: 200;
            border-radius: 0 0 10px 10px;
        }

        .car .goods2 {
            border-top: 1px solid #F88020;
            margin-top: 10px;
            height: 50px;
            font-size: 19px;
            line-height: 50px;
            font-weight: 200;
            border-radius: 0 0 10px 10px;
            padding-top: 10px;
        }

        .car .goods1 table {

            width: 100%;
        }



        .car .goods1 .btn2:hover {
            color: white;
            background-color: #21BF73;
        }



        .car .goods1 .btn3:hover {
            color: white;
            background-color: #FF0000;
        }

        /* 弹窗样式 */
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            width: 400px;
            height: 200px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
        }

        .modal-header {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .modal-body {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .modal-buttons {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }

        .modal-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 20px;
        }

        /* 导航栏样式 */
        body {
            background-color: #f1f1f1;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            padding: 20px;
        }

        h1 {
            margin: 0;
            font-size: 24px;
            font-weight: normal;
        }

        main {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
        }

        b {
            font-size: 25px;
            color: red;
        }

        /* 导航栏 */
        body {
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #333;
            color: #fff;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            width: 200px;
            overflow-y: auto;
            /* margin-left: 300px; */
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            text-align: left;
            padding: 10px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        nav li:hover {
            background-color: #555;
        }

        nav a {
            color: #fff;
            text-decoration: none;
        }

        nav a:hover {
            color: #ccc;
        }

        /* 内容区域样式 */
        .content {
            margin-left: 220px;
            padding: 0px;
        }

        .active {
            background-color: #555;
        }
        tr,td{
            text-align: center;
        }
    </style>
</head>
<body>
<!-- 导航栏 -->
<header>
    <h1 style="text-align: center; padding-left: 90px; color: #ff9500;">淘乐在线商城</h1>
    <div style="float: right; font-size: 13px; color: blue;">欢迎您~&nbsp;&nbsp;&nbsp;${user_online.getNickName()}&nbsp;&nbsp;&nbsp;<a href="user_exit">退出登录</a></div>
</header>
<nav>
    <ul>
        <br><br><br><br>
        <a href="home">
        <li><img src="${pageContext.request.contextPath}/html/ico/home.png" width="18">&nbsp;首页</li>
        </a>
        <li class="active"><img src="${pageContext.request.contextPath}/html/ico/cart.png" width="18">&nbsp;购物车</li>

        <a href="history">
            <li><img src="${pageContext.request.contextPath}/html/ico/order.png" width="18">&nbsp;历史订单</li>
        </a>
        <li>
            <center>商品分类</center>
        </li>
        <a href="foods">
            <li><img src="${pageContext.request.contextPath}/html/ico/food.png" width="18">&nbsp;零食</li>
        </a>
        <a href="electronics">
            <li><img src="${pageContext.request.contextPath}/html/ico/electronics.png" width="18">&nbsp;电子产品</li>
        </a>
        <a href="clothes">
            <li><img src="${pageContext.request.contextPath}/html/ico/clothes.png" width="18">&nbsp;服饰</li>
        </a>

    </ul>
</nav>
<!-- 弹窗样式 -->
<div class="modal" id="myModal">
    <div class="modal-content1">
        <div class="modal-header">提示</div>
        <div class="modal-body">是否清空购物车?</div>
        <div class="modal-buttons">
            <form action="del_all_cart" method="post">
                <button class="modal-button" type="submit">确认</button>
                <button class="modal-button" type="button" id="btnClose">取消</button>
            </form>
        </div>
    </div>
</div>

<!-- 购物车 -->
<div class="content">
    <main>
        <div class="car">

            <div class="good">
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td width=30%>商品名称</td>
                        <td width=20%>单价(元)</td>
                        <td width=20%>数量</td>
                        <td width=30%>操作</td>
                    </tr>
                </table>
            </div>

            <c:forEach items="${goods}" var="good">
            <div class="goods">
                <table>
                    <tr>
                        <td style="display: none" name="good_id">${good.id}</td>
                        <td><img src="${pageContext.request.contextPath}/${good.path}" width="60px"></td>
                        <td width=30%>${good.name}</td>
                        <td width=20% name="price">${good.price}</td>
                        <td width=20% name="count">${good.count}</td>
                        <td width=30%><button name="del" class="btn1">删除</button></td>
                    </tr>
                </table>
            </div>
            <br>
            </c:forEach>

            <div class="goods2">
                <div style="float: left; padding-left: 25px;"><b><span>总数：</span><span id="count_sum"></span></b></div>
                <div style="padding-right: 250px;"> <b><span>小计：</span> <span id="price_sum"></span></b></div>
            </div>
            <div class="goods1">

                <table>
                    <tr>
                        <form action="buy_all" method="post">
                            <center>
                            <td><input readonly name="goods_id" id="goods_id" type="text" style="display: none;" value=""></td>
                            <td><input readonly name="counts" id="counts" type="text" style="display: none;" value=""></td>
                            <td><button class="btn2" id="buy" onclick="tan()">确认购买</button></td>
                            <td><button id="btnOpen" class="btn3" type="button">全部清空</button></td></center>
                        </form>
                    </tr>
                </table>


            </div>

        </div>
    </main>
</div>
<form method="post" action="del_one_cart" style="display: none">
    <input type="text" id="bbc" name="del_id" value="" readonly>
    <button type="submit" id="tijiao"></button>
</form>
<script>
    // 弹窗js
    let modal = document.getElementById("myModal");
    let btnOpen = document.getElementById("btnOpen");
    let btnClose = document.getElementById("btnClose");
    let buy = document.getElementById('buy');
    btnOpen.onclick = function () {
        modal.style.display = "block";
    }
    btnClose.onclick = function () {
        modal.style.display = "none";
    }

    //计算商品数和总价
    //整理购物车中商品信息，商品id，购买数量
    let price_lis = document.getElementsByName('price');
    let count_lis = document.getElementsByName('count');
    let id_lis = document.getElementsByName('good_id');
    let str_id = '';
    let str_count = '';
    let count_sum = 0;
    let price_sum = 0;
    for (let i = 0; i < price_lis.length; i++) {
        count_sum += parseInt(count_lis[i].innerText);
        price_sum += count_lis[i].innerText * price_lis[i].innerText;
        //整理商品信息
        str_id += id_lis[i].innerText
        str_id += ' '
        str_count += count_lis[i].innerText
        str_count += ' '
    }
    price_sum=price_sum.toFixed(2)
    document.getElementById('count_sum').innerHTML = count_sum
    document.getElementById('price_sum').innerHTML = '￥ '
    document.getElementById('price_sum').innerHTML += price_sum
    if (count_sum === 0) {
        buy.disabled = 'true'
        btnOpen.disabled = 'true'
    }
    str_count = str_count.trim()
    str_id = str_id.trim()
    document.getElementById('goods_id').value = str_id
    document.getElementById('counts').value = str_count
    let dels=document.getElementsByName('del')
    for(let i=0;i<dels.length;i++){
        dels[i].addEventListener("click",function () {
            let tr=this.parentNode.parentNode
            let tds=tr.getElementsByTagName('td')
            console.log(tds[0].innerHTML)
            document.getElementById('bbc').value=tds[0].innerHTML
            document.getElementById('tijiao').click()
        })
    }
    function tan(){
        alert('购买成功，可在历史订单查看')
    }

</script>

</body>
</html>
