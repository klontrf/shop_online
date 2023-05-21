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
        <a href="cart">
        <li><img src="${pageContext.request.contextPath}/html/ico/cart.png" width="18">&nbsp;购物车</li>
        </a>

            <li class="active"><img src="${pageContext.request.contextPath}/html/ico/order.png" width="18">&nbsp;历史订单</li>

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

<!-- 历史 -->
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
                        <td width=30%>花费(元)</td>
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
                            <td width=30% name="sum"></td>

                        </tr>
                    </table>
                </div>
                <br>
            </c:forEach>



        </div>
    </main>
</div>

<script>

    let price_lis = document.getElementsByName('price');
    let count_lis = document.getElementsByName('count');
    let sum_lis = document.getElementsByName('sum');

    for (let i = 0; i < price_lis.length; i++) {
        let t=price_lis[i].innerText*count_lis[i].innerText
        t=t.toFixed(2)
        sum_lis[i].innerText=t

    }

</script>

</body>
</html>
