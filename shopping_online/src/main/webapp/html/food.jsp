<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/5/15
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>淘乐在线商城</title>
  <style>
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

    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      grid-gap: 20px;
      margin-top: 20px;
    }

    .product {
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
      padding: 10px;
    }

    .product img {
      width: 100%;
      height: auto;
    }

    .product h2 {
      font-size: 18px;
      margin: 10px 0;
      text-align: center;
    }

    .product p {
      margin: 0;
      line-height: 1.4;
    }

    .product button {
      background-color: #4CAF50;
      border: none;
      border-radius: 5px;
      color: #fff;
      cursor: pointer;
      font-size: 14px;
      margin-top: 0px;
      padding: 10px 20px;
      align-self: flex-start;
      float: right;
    }

    .product button:hover {
      background-color: #3e8e41;
    }

    b {
      font-size: 25px;
      color: red;
    }

    /* 导航栏 */
    /* body {
        margin: 0;
        padding: 0;
    } */

    nav {
      background-color: #333;
      color: #fff;
      height: 100%;
      position: fixed;
      left: 0;
      top: 0;
      width: 200px;
      overflow-y: auto;
    }

    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }

    nav li {
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
  </style>
</head>
<body>
<header>
  <h1 style="text-align: center; padding-left: 90px; color: #ff9500;">淘乐在线商城</h1>
  <div style="float: right; font-size: 13px; color: blue;">欢迎您~&nbsp;&nbsp;&nbsp;${user_online.getNickName()}</div>
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
    <a href="history">
      <li><img src="${pageContext.request.contextPath}/html/ico/order.png" width="18">&nbsp;历史订单</li>
    </a>
    <li>
      <center>商品分类</center>
    </li>

      <li class="active"><img src="${pageContext.request.contextPath}/html/ico/food.png" width="18">&nbsp;零食</li>

    <a href="electronics">
      <li><img src="${pageContext.request.contextPath}/html/ico/electronics.png" width="18">&nbsp;电子产品</li>
    </a>
    <a href="clothes">
      <li><img src="${pageContext.request.contextPath}/html/ico/clothes.png" width="18">&nbsp;服饰</li>
    </a>

  </ul>
</nav>
<div class="content">

  <main>
    <div class="product-grid">

      <c:forEach items="${goods}" var="good">

        <div class="product">

          <img src="${pageContext.request.contextPath}/${good.path}" alt="Product Image">
          <h2>${good.name}</h2>

          <form method="post" action="add_into_cart">
            <div><b>￥${good.price}</b>
              <input readonly type="number" name="want" style="display: none" value="${good.id}">
              <button>加入购物车</button>
            </div>
          </form>

          <br>
          <p>${good.introduce}</p>
        </div>

      </c:forEach>
      <%--                  <div class="product">--%>
      <%--                    <img src="../pictures/9.jpg">--%>
      <%--                    <h2>酱牛肉</h2>--%>
      <%--                    <div><b>￥34.3</b> <button>加入购物车</button></div><br>--%>
      <%--                    <p>康新牧场内蒙草原酱牛肉150g×3袋五香味熟食腊味 卤牛肉</p>--%>
      <%--                  </div>--%>

      <%--                  <div class="product">--%>
      <%--                    <img src="../pictures/8.jpg">--%>
      <%--                    <h2>鸡蛋卷</h2>--%>
      <%--                    <div><b>￥34.3</b> <button>加入购物车</button></div><br>--%>
      <%--                    <p>麦酥园饼干蛋糕鸡蛋卷蛋酥休闲零食糕点甜点心面包</p>--%>
      <%--                  </div>--%>

      <%--                  <div class="product">--%>
      <%--                    <img src="../pictures/1.jpg" alt="Product Image">--%>
      <%--                    <h2>产品名称</h2>--%>
      <%--                    <p>产品描述，可以分多行显示。</p>--%>
      <%--                    <button>加入购物车</button>--%>
      <%--                  </div>--%>

      <%--      <div class="product">--%>
      <%--        <img src="https://via.placeholder.com/350x200.png?text=Product+Image" alt="Product Image">--%>
      <%--        <h2>产品名称</h2>--%>
      <%--        <p>产品描述，可以分多行显示。</p>--%>
      <%--        <button>加入购物车</button>--%>
      <%--      </div>--%>

      <%--      <div class="product">--%>
      <%--        <img src="https://via.placeholder.com/350x200.png?text=Product+Image" alt="Product Image">--%>
      <%--        <h2>产品名称</h2>--%>
      <%--        <p>产品描述，可以分多行显示。</p>--%>
      <%--        <button>加入购物车</button>--%>
      <%--      </div>--%>
    </div>
  </main>
</div>
</body>
</html>
