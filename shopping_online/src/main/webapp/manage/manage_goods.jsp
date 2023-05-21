<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/5/18
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>商品管理</title>
  <style>
    body {
      background-color: #f1f1f1;
      font-family: Arial, sans-serif;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 10px;
      text-align: center;
    }

    h1 {
      margin: 0;
      font-size: 24px;
      font-weight: normal;
    }

    main {
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.3);
      margin: 20px auto;
      max-width: 1100px;
      padding: 20px;
    }

    table {

      border-collapse: collapse;
      /* text-align: center; */
      width: 100%;
    }

    th, td {
      padding: 10px;
      text-align: center;
    }

    th {
      background-color: #333;
      color: #fff;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    a {
      color: #333;
      text-decoration: none;
    }

    .b1{
      background-color: #4CAF50;
      border: none;
      border-radius: 5px;
      color: #fff;
      cursor: pointer;
      font-size: 14px;
      padding: 10px 20px;

    }

    button:hover {
      background-color: #812de9;
    }
    /* 导航栏样式 */
    nav {
      background-color: #333;
      height: 100%;
      position: fixed;
      left: 0;
      top: 8px;
      width: 100px;
    }
    nav ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }
    nav li {
      padding: 10px;
      color: #fff;
      text-align: center;
      cursor: pointer;
    }
    nav li:hover {
      background-color: #555;
    }

    /* 内容区域样式 */
    .content {
      margin-left: 100px;
      padding: 0px;
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
      width: 340px;
      height: 595px;
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

    /* 编辑信息 */

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="number"] {
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
      margin-bottom: 20px;
      box-sizing: border-box;
    }
  </style>
</head>
<body>
<!-- 弹窗 -->
<div class="modal" id="myModal1">
  <form action="update_good" method="post">
    <div class="modal-content1">
      <div class="modal-header">编辑信息</div>
      <div class="modal-body">

        <label for="idnum">编号:(不可修改)</label>
        <input type="number" id="idnum" name="idnum" readonly value="" required>

        <label for="name">商品名:</label>
        <input type="text" id="name" name="name" value="" required>

        <!-- <label for="sales">售出件数:(不可修改)</label> -->
        <input type="hidden" id="sales" name="sales" value="" readonly required>

        <label for="price">价格（元）:</label>
        <input type="number" id="price" name="price" value="" required>

        <label for="stock">库存件数:</label>
        <input type="number" id="stock" name="stock" value="" required>

        <label for="brief">商品简介:</label>
        <input type="text" id="brief" name="brief" value="" required>

        <label>
          <input type="radio" name="state" id="open" value="启用" required>
          启用
        </label>
        <label>
          <input type="radio" name="state" id="close" value="禁用" required>
          禁用
        </label>
      </div>
      <div class="modal-buttons">
        <button type="submit" class="modal-button">确认修改</button>
        <button type="button" class="modal-button" id="btnClose1">取消修改</button>
      </div>
    </div>
  </form>
</div>


<header>
  <h1>后台管理<span style="float: right; font-size: 15px;">欢迎您~&nbsp;&nbsp;&nbsp;${admin_online.getNickName()}</span></h1>

</header>
<nav>
  <ul>
    <br><br><br>

    <a href="manage_users"><li>用户管理</li></a>
    <li style="color: #007bff;">商品管理</li>
  </ul>
</nav>
<div class="content">
  <!-- 内容区域 -->
  <main>
    <table >
      <tr>
        <th>编号</th>
        <th>商品名</th>
        <th>价格（元）</th>
        <th>简介</th>
        <th>库存（件）</th>
        <th>售出（件）</th>
        <th>状态</th>
        <th>操作</th>
      </tr>

<%--      <tr>--%>
<%--        <td>1</td>--%>
<%--        <td>Redmi Note 11</td>--%>
<%--        <td>9991</td>--%>
<%--        <td>Redmi Note 11 5G 天玑810 33W Pro快充 5000mAh大电池 6GB +128GB 神秘黑境 智能手机 小米 红米</td>--%>
<%--        <td>2000</td>--%>
<%--        <td>0</td>--%>
<%--        <td>启用</td>--%>
<%--        <td><button class="b1" name="edit">编辑</button></td>--%>
<%--      </tr>--%>

      <c:forEach items="${goods}" var="good">
        <tr>
          <td>${good.id}</td>
          <td>${good.name}</td>
          <td>${good.price}</td>
          <td>${good.introduce}</td>
          <td>${good.inventory}</td>
          <td>${good.sales}</td>
          <td>${good.state}</td>
          <td><button class="b1" name="edit">编辑</button></td>
        </tr>
      </c:forEach>


    </table>
  </main>

</div>
<script type="text/javascript">
  // 控制按钮控件
  let modal1 = document.getElementById("myModal1");
  let buttons = document.getElementsByTagName("button");
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", function () {
      if(buttons[i].name==='edit'){
        let tr=this.parentNode.parentNode;
        let tds=tr.getElementsByTagName('td');

        let idnum=tds[0].innerHTML;
        let name=tds[1].innerHTML;
        let sales=tds[5].innerHTML;
        let price=tds[2].innerHTML;
        let stock=tds[4].innerHTML;
        let brief=tds[3].innerHTML;
        let state=tds[6].innerHTML;
        document.getElementById('idnum').value=idnum
        document.getElementById('name').value=name
        document.getElementById('sales').value=sales
        document.getElementById('price').value=price
        document.getElementById('stock').value=stock
        document.getElementById('brief').value=brief
        if(state==='启用'){
          document.getElementById('open').checked=true;
        }else if(state==='禁用'){
          document.getElementById('close').checked=true;
        }
        modal1.style.display = "block";
      }

    });
  }



  let btnClose1 = document.getElementById("btnClose1");

  btnClose1.onclick = function () {
    modal1.style.display = "none";
  }

</script>
</body>
</html>
