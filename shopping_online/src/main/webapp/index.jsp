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
        button:hover{
            background-color: #555555;
        }
        .aa{
            font-size: 12px; color: #000; text-decoration: none;
        }
        a:hover{
            color:  #00BFFF;
        }
        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<form action="login" method="post">
    <h2>Login</h2>
    <center><span id="login-error" class="error">${login_msg}</span></center>
    <label for="username">账号:</label>
    <input minlength="4" maxlength="16" type="text" id="username" name="username" placeholder="Enter your account" value="${account_temp}" required>
    <label for="password">密码:</label>
    <input minlength="4" maxlength="16" type="password" id="password" name="password" placeholder="Enter your password" required>
    <center>
        <input type="submit" value="用户登录">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="admin_login.jsp"><button type="button" class="bttn">管理员登录</button></a>
    </center>
    <br>
    <div style="width: 300px;">
        <a href="enroll.jsp" class="aa">没有账号？</a>
        <a href="admin_login.jsp" class="aa" style="float: right;">忘记密码？</a>
    </div>
</form>
</body>
</html>
