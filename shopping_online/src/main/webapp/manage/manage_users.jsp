<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/5/16
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>用户管理</title>
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

    .b2 {
      background-color: rgba(255, 0, 0, 0.594);
      border: none;
      border-radius: 5px;
      color: #fff;
      cursor: pointer;
      font-size: 14px;
      padding: 10px 20px;
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

    .modal-content2 {
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
    input[type="email"],
    input[type="password"],
    input[type="tel"] {
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
      margin-bottom: 20px;
      box-sizing: border-box;
    }


    .error {
      color: red;
      font-size: 12px;
      margin-top: 5px;
    }
  </style>
</head>
<body>
<!-- 弹窗 -->
<div class="modal" id="myModal1">
  <form onsubmit="return validateForm()" action="update_user" method="post">
    <div class="modal-content1">
      <div class="modal-header">编辑信息</div>
      <div class="modal-body">

        <label for="account">账号:(不可修改)</label>
        <input minlength="4" maxlength="16" type="text" id="account" name="account" readonly value="" required>

        <label for="nickname">昵称:</label>
        <input maxlength="8" type="text" id="nickname" name="nickname" value="" required>

        <label for="email">邮箱:</label>
        <input maxlength="32" type="email" id="email" name="email" value="" required>
        <span id="email-error" class="error"></span>

        <label for="password">密码:</label>
        <input minlength="4" maxlength="16" type="text" id="password" name="password" value="" required>

        <label for="address">送货地址:</label>
        <input maxlength="32" type="text" id="address" name="address" value="" required>

        <label for="phone">手机号码:</label>
        <input maxlength="11" type="tel" id="phone" name="phone" value="" required>
        <span id="phone-error" class="error"></span>

      </div>
      <div class="modal-buttons">
        <button type="submit" class="modal-button">确认修改</button>
        <button type="button" class="modal-button" id="btnClose1">取消修改</button>
      </div>
    </div>
  </form>
</div>
<!-- 删除弹窗 -->
<div class="modal" id="myModal2">
  <div class="modal-content2">
    <div class="modal-header">提示</div>
    <div class="modal-body">是否删除该用户?</div>
    <div class="modal-buttons">

      <form action="delete_user" method="post">
        <input type="hidden" value="" name="hidden_account" id="hidden_account">
        <button type="submit" class="modal-button">确认</button>
        <button type="button" class="modal-button" id="btnClose2">取消</button>
      </form>


    </div>
  </div>
</div>

<header>
  <h1>后台管理<span style="float: right; font-size: 15px;">欢迎您~&nbsp;&nbsp;&nbsp;${admin_online.getNickName()}&nbsp;&nbsp;&nbsp;<a href="admin_exit" style="color: cyan">退出登录</a></span></h1>
</header>
<nav>
  <ul>
    <br><br><br>

    <li style="color: #007bff">用户管理</li>
    <a href="manage_goods"> <li>商品管理</li></a>
  </ul>
</nav>
<div class="content">
  <!-- 内容区域 -->
  <main>
    <table >
      <tr>
        <th>账号</th>
        <th>昵称</th>
        <th>密码</th>
        <th>电话</th>
        <th>地址</th>
        <th>Email</th>
        <th>操作</th>
      </tr>

<%--      <tr>--%>
<%--        <td>00111111111</td>--%>
<%--        <td>你好1111111</td>--%>
<%--        <td>123456789</td>--%>
<%--        <td>13232323231</td>--%>
<%--        <td>赫纳省安阳市1111111屯粮村</td>--%>
<%--        <td>jansse@example.com</td>--%>
<%--        <td><button class="b1" name="edit">编辑</button> <button class="b2" name="del">删除</button></td>--%>
<%--      </tr>--%>
      <c:forEach items="${users}" var="user">
        <tr>
          <td>${user.account}</td>
          <td>${user.nickName}</td>
          <td>${user.password}</td>
          <td>${user.tel}</td>
          <td>${user.address}</td>
          <td>${user.mail}</td>
          <td><button class="b1" name="edit">编辑</button> <button class="b2" name="del">删除</button></td>
        </tr>
      </c:forEach>

    </table>
  </main>

</div>
<script type="text/javascript">
  // 控制按钮控件
  let modal1 = document.getElementById("myModal1");
  let modal2 = document.getElementById("myModal2");
  let buttons = document.getElementsByTagName("button");
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", function () {
      if(buttons[i].name==='edit'){
        let tr=this.parentNode.parentNode;
        let tds=tr.getElementsByTagName('td');

        let account=tds[0].innerHTML;
        let nickname=tds[1].innerHTML;
        let email=tds[5].innerHTML;
        let password=tds[2].innerHTML;
        let address=tds[4].innerHTML;
        let phone=tds[3].innerHTML;
        document.getElementById('account').value=account
        document.getElementById('nickname').value=nickname
        document.getElementById('email').value=email
        document.getElementById('password').value=password
        document.getElementById('address').value=address
        document.getElementById('phone').value=phone
        modal1.style.display = "block";
      }else if(buttons[i].name==='del'){
        let tr=this.parentNode.parentNode;
        let tds=tr.getElementsByTagName('td');

        let account=tds[0].innerHTML;
        document.getElementById('hidden_account').value=account
        modal2.style.display = "block";
      }

    });
  }



  let btnClose1 = document.getElementById("btnClose1");

  btnClose1.onclick = function () {
    modal1.style.display = "none";
  }


  let btnClose2 = document.getElementById("btnClose2");

  btnClose2.onclick = function () {
    modal2.style.display = "none";
  }



  // 验证表单信息
  function validateForm() {
    let phone = document.getElementById("phone").value;
    let email = document.getElementById("email").value;
    // Validate email
    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      document.getElementById("email-error").innerHTML = "邮箱格式不合法";
      return false;
    } else {
      document.getElementById("email-error").innerHTML = "";
    }
    // Validate phone number
    let phoneRegex = /^[1][3-9][0-9]{9}$/;
    if (!phoneRegex.test(phone)) {
      document.getElementById("phone-error").innerHTML = "请输入可用手机号码!";
      return false;
    } else {
      document.getElementById("phone-error").innerHTML = "";
    }

    return true;
  }
</script>
</body>
</html>
