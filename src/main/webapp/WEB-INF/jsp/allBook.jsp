<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍展示</title>

    <!-- 引入 Bootstrap -->
    <link href="../../js/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 自定义样式 -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        .header-title {
            color: #333;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-primary, .btn-info, .btn-success, .btn-danger {
            border-radius: 20px;
            margin-bottom: 10px;
        }

        .btn-primary:hover, .btn-info:hover, .btn-success:hover, .btn-danger:hover {
            transform: translateY(-2px);
        }

        .logout-btn {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .logout-btn a {
            color: #fff;
        }

        .logout-btn a:hover {
            color: #fff;
            text-decoration: none;
        }

        .welcome-text {
            font-size: 18px;
            color: #666;
            margin-top: 10px;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group .form-control {
            border-radius: 4px;
        }

        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .table thead {
            background-color: #007bff;
            color: #fff;
        }

        .table thead th {
            border: none;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .pagination {
            margin: 20px 0;
        }

        .pagination .page-item .page-link {
            color: #007bff;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
        }

        .pagination .page-item .page-link:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="row text-center">
    <div class="col-md-12">
        <h2>欢迎来到简易图书管理系统</h2>
        <p class="welcome-text">欢迎 ${user.username} 登录后台</p>
    </div>
</div>

<div class="container">
    <div class="row">

        <div class="col-md-4">
            <a class="btn btn-info btn-block" href="${pageContext.request.contextPath}/book/allBooks">查询全部书籍</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/book/toAddBook">新增</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-danger btn-block" href="${pageContext.request.contextPath}/user/toLogin">退出</a>
        </div>
    </div>

    <div class="row text-right">
        <div class="col-md-12">
            <form action="${pageContext.request.contextPath}/book/queryBook" method="post" class="form-inline">
                <span style="color: red; font-weight: bold;">${error}</span>
                <div class="input-group">
                    <input type="text" name="queryBookName" class="form-control" placeholder="请输入要查询的书名"
                           onblur="this.value=this.value.trim()">
                    <span class="input-group-btn">
                        <button class="btn btn-info" type="submit">查询</button>
                    </span>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${pageInfo.list}">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.bookID}"
                               class="btn btn-success btn-sm">修改</a>
                            <a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('确定要删除该书籍吗？')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6">
            当前 【${pageInfo.pageNum }】 页,总 【${pageInfo.pages }】 页,总 【${pageInfo.total }】 条记录
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-end">
                    <!--首页-->
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/book/allBooks?pn=1"
                           aria-label="首页">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <!--前一页-->
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/book/allBooks?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        </li>
                    </c:if>

                    <!--中间显示的页码-->
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/book/allBooks?pn=${page_Num }">${page_Num }</a>
                        </li>
                    </c:forEach>

                    <!--后一页-->
                    <c:if test="${pageInfo.hasNextPage }">
                        <li class="page-item">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/book/allBooks?pn=${pageInfo.pageNum+1 }"
                               aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
                    </c:if>

                    <!--末页-->
                    <li class="page-item">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/book/allBooks?pn=${pageInfo.pages}"
                           aria-label="末页">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
