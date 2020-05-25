<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/21
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon"	href="/pic/userPath/1.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin-item.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/home.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-8 col-md-4 item">
            <a href="${pageContext.request.contextPath}/userList" class="thumbnail">
                <h2 class="title">${countUser}
                    <span class="glyphicon glyphicon-user right" aria-hidden="true"></span>
                </h2>
                <h4 class="discription">总用户</h4>
            </a>
        </div>
        <div class="col-xs-8 col-md-4 item">
            <a href="#" class="thumbnail">
                <h2 class="title">${countAdmin}
                    <span class="glyphicon glyphicon-star right" aria-hidden="true"></span>
                </h2>
                <h4 class="discription">管理员数</h4>
            </a>
        </div>
        <div class="col-xs-8 col-md-4 item">
            <a href="${pageContext.request.contextPath}/getComics" class="thumbnail">
                <h2 class="title">${countComic}
                    <span class="glyphicon glyphicon-star-empty right" aria-hidden="true"></span>
                </h2>
                <p>
                <h4 class="discription">漫画数</h4>
                </p>
            </a>
        </div>

        <div class="col-xs-8 col-md-4 item">
            <a href="${pageContext.request.contextPath}/commentList" class="thumbnail">
                <h2 class="title">${countComment}
                    <span class="glyphicon glyphicon-hd-video right" aria-hidden="true"></span>
                </h2>
                <p>
                <h4 class="discription">评论总数</h4>
                </p>
            </a>
        </div>
        <div class="col-xs-8 col-md-4 item">
            <a href="${pageContext.request.contextPath}/messageList" class="thumbnail">
                <h2 class="title">${countMessage}
                    <span class="glyphicon glyphicon-check right" aria-hidden="true"></span>
                </h2>
                <p>
                <h4 class="discription">留言总数</h4>
                </p>
            </a>
        </div>
        <div class="col-xs-8 col-md-4 item">
            <a href="${pageContext.request.contextPath}/closeList" class="thumbnail">
                <h2 class="title">${countClose}
                    <span class="glyphicon glyphicon-remove-sign right" aria-hidden="true"></span>
                </h2>
                <p>
                <h4 class="discription">封号总数</h4>
                </p>
            </a>
        </div>
        <div class="col-xs-8 col-md-4 item">
            <a href="#" class="thumbnail">
                <h2 class="title">100
                    <span class="glyphicon glyphicon-ok-sign right" aria-hidden="true"></span>
                </h2>
                <p>
                <h4 class="discription">作家数</h4>
                </p>
            </a>
        </div>
<div class="col-xs-8 col-md-4 item">
    <a href="#" class="thumbnail">
        <h2 class="title">${countHeat}
            <span class="glyphicon glyphicon-th-list right" aria-hidden="true"></span>
        </h2>
        <p>
        <h4 class="discription">热度总数</h4>
        </p>
    </a>
</div>

</div>
</div>
</body>
</html>
