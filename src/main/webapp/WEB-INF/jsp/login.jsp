<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <style>
        #box {
            width: 400px;
            height: auto;
            border: 1px solid #E2E3E5;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8f9fa;
        }
        #logo {
            text-align: center;
            font-size: 30px;
            color: #343a40;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 20px;
        }
        .form-control {
            width: 100%;
            height: 40px;
            border-radius: 4px;
            border: 1px solid #ced4da;
            padding: 10px;
            box-sizing: border-box;
            margin-top: 5px;
        }
        .error {
            color: red;
            font-size: 14px;
        }
        #remember {
            margin-top: 10px;
            color: #343a40;
        }
        #btn-login {
            width: 100%;
            height: 40px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <!-- 引入 Bootstrap -->
    <link href="../../js/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">

        window.onload = function () {
            //给表单绑定onsubmit事件
            document.getElementById("registerFrom").onsubmit = function () {
                return checkUsername() && checkPassword() && checkCode();
            }

            //给用户名和密码框、Email、姓名、手机号分别绑定离焦事件
            document.getElementById("username").onblur = checkUsername;
            document.getElementById("password").onblur = checkPassword;
            document.getElementById("validateCode").onblur = checkCode;
        }

        //校验用户名
        function checkUsername() {
            //获取用户名的值
            var username = document.getElementById("username").value;
            //定义正则表达式
            var reg_username = /^([a-zA-Z0-9_-])/;
            //判断值是否符合正则表达式的规则
            var flag = reg_username.test(username);
            //提示信息
            var s_username = document.getElementById("s_username");
            if (flag) {
                //提示绿色对勾
                s_username.innerHTML = "<img src='${pageContext.request.contextPath}/img/gou.png' width='15' height='15'>";
            } else {
                //提示红色错误信息
                s_username.innerHTML = "用户名格式有误";
            }
            return flag;
        }

        //校验密码
        function checkPassword() {
            //1.获取密码的值
            var password = document.getElementById("password").value;
            //2.定义正则表达式
            var reg_password = /^\w{6,12}$/;
            //3.判断值是否符合正则的规则
            var flag = reg_password.test(password);
            //4.提示信息
            var s_password = document.getElementById("s_password");
            if (flag) {
                //提示绿色对勾
                s_password.innerHTML = "<img width='15' height='15' src='${pageContext.request.contextPath}/img/gou.png'/>";
            } else {
                //提示红色错误信息
                s_password.innerHTML = "密码格式有误";
            }
            return flag;
        }
    </script>
</head>
<body>
<canvas class="particle"></canvas>
<div id="box">
    <div id="logo">欢迎登录！</div>
    <div id="info">
        <form method="post" action="${pageContext.request.contextPath}/user/loginUser" id="registerFrom">
            <div style="color: red;"><span id="s_username" class="error"></span></div>
            <input type="text" class="form-control" id="username" name="username" placeholder="账号:">

            <div style="color: red;"><span id="s_password" class="error"></span></div>
            <input type="password" class="form-control" id="password" name="password" placeholder="密码:">

            <button class="btn btn-info" id="btn-login" onclick="VerifyLogin()">登录</button>
        </form>

        <a href="/user/toRegister">没有账号？立即注册</a>
    </div>
</div>
</body>
</html>
