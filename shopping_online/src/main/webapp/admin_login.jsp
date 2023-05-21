<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            background-color: #F5F5F5;
            font-family: Arial, sans-serif;
        }

        form {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #D3D3D3;
            width: 300px;
            margin: 50px auto;
        }

        h2 {
            text-align: center;
            color: #333333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333333;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
        }

        input[type="submit"] {
            background-color: #333333;
            color: #FFFFFF;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .bttn{
            background-color: #333333;
            color: #FFFFFF;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #555555;
        }
        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<form action="admin_login" method="post">
    <h2>管理员登录</h2>
    <center><span id="login-error" class="error">${admin_msg}</span></center>
    <label for="username">账号:</label>
    <input minlength="4" maxlength="16" type="text" id="username" name="username" placeholder="Enter your account" value="admin1" required>
    <label for="password">密码:</label>
    <input minlength="4" maxlength="16" type="password" id="password" name="password" placeholder="Enter your password" value="123456" required>
    <center>
        <input type="submit" value="登录">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="index.jsp"><button type="button" class="bttn">返回用户登录</button></a>
    </center>
    <br>
</form>
</body>
</html>
