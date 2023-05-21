<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 2023/5/13
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>注册账号</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        form {
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            margin-top: 0;
        }

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

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #3e8e41;
        }

        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<form onsubmit="return validateForm()" action="enroll" method="post">
    <h1>用户注册</h1>
    <label for="account">账号:</label>
    <input minlength="4" maxlength="16" type="text" id="account" name="account" required>
    <center><span id="login-error" class="error">${enroll_msg}</span></center>
    <label for="nickname">昵称:</label>
    <input maxlength="8" type="text" id="nickname" name="nickname" value="${nickname}" required>

    <label for="email">邮箱:</label>
    <input maxlength="32" type="email" id="email" name="email" value="${email}" required>
    <span id="email-error" class="error"></span>

    <label for="password">密码:</label>
    <input minlength="4" maxlength="16" type="password" id="password" name="password" value="${password}" required>

    <label for="confirm-password">确认密码:</label>
    <input minlength="4" maxlength="16" type="password" id="confirm-password" name="confirm-password" value="${password}" required>
    <span id="password-error" class="error"></span>

    <label for="address">送货地址:</label>
    <input maxlength="32" type="text" id="address" name="address" value="${address}" required>

    <label for="phone">手机号码:</label>
    <input maxlength="11" type="tel" id="phone" name="phone" value="${phone}" required>
    <span id="phone-error" class="error"></span>
    <center>
        <input type="submit" value="注册">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="index.jsp" style="color: black; font-size: 12px; text-decoration: none;">已有账号？登录</a>
    </center></form>


<script>
    function validateForm() {
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("confirm-password").value;
        let phone = document.getElementById("phone").value;

        // Validate email
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById("email-error").innerHTML = "邮箱格式不合法";
            return false;
        } else {
            document.getElementById("email-error").innerHTML = "";
        }

        // Validate password
        if (password !== confirmPassword) {
            document.getElementById("password-error").innerHTML = "两次密码输入不一致";
            return false;
        } else {
            document.getElementById("password-error").innerHTML = "";
        }

        // Validate phone number
        let phoneRegex = /^[1][3-9][0-9]{9}$/;
        if (!phoneRegex.test(phone)) {
            document.getElementById("phone-error").innerHTML = "请输入可用手机号码";
            return false;
        } else {
            document.getElementById("phone-error").innerHTML = "";
        }
        return true;
    }
</script>
</body>
</html>
