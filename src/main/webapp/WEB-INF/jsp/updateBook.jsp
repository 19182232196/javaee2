<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更新图书</title>
    <!-- 引入 Bootstrap -->
    <link href="../../js/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义样式 -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            padding-top: 40px;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px;
            margin: 0 auto;
        }

        .page-header h1 {
            font-size: 24px;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        .form-group label {
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .btn-primary {
            border-radius: 20px;
            margin-top: 20px;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="page-header">
                <h1>修改信息 <small>请更新书籍信息</small></h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post" class="form-horizontal">
        <input type="hidden" name="bookID" value="${QBook.bookID}">

        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">书籍名称：</label>
            <div class="col-sm-10">
                <input type="text" name="bookName" class="form-control" id="inputName" value="${QBook.bookName}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputCounts" class="col-sm-2 control-label">书籍数量：</label>
            <div class="col-sm-10">
                <input type="number" name="bookCounts" class="form-control" id="inputCounts" value="${QBook.bookCounts}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputDetail" class="col-sm-2 control-label">书籍详情：</label>
            <div class="col-sm-10">
                <textarea name="detail" class="form-control" id="inputDetail" rows="5">${QBook.detail}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">修改</button>
            </div>
        </div>
    </form>
</div>

<!-- 引入 jQuery 和 Bootstrap 的 JavaScript -->
<script src="../../js/jquery/jquery-3.6.0.min.js"></script>
<script src="../../js/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
