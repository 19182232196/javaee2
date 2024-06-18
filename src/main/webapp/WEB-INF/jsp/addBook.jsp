<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加图书</title>
    <!-- 引入 Bootstrap -->
    <link href="../../js/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义样式 -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        .page-header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h1 small {
            color: #fff;
        }

        .form-horizontal .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            height: 45px;
            border-radius: 8px;
            padding: 10px;
            font-size: 16px;
        }

        .btn-primary {
            width: 100%;
            height: 45px;
            border-radius: 8px;
            font-size: 18px;
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
        }

        label {
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/addBook" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="inputName" class="control-label">书籍名称：</label>
            <input type="text" name="bookName" class="form-control" id="inputName" required>
        </div>
        <div class="form-group">
            <label for="inputCounts" class="control-label">书籍数量：</label>
            <input type="text" name="bookCounts" class="form-control" id="inputCounts" required>
        </div>
        <div class="form-group">
            <label for="inputDetail" class="control-label">书籍详情：</label>
            <input type="text" name="detail" class="form-control" id="inputDetail" required>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">添加</button>
        </div>
    </form>
</div>
</body>
</html>
