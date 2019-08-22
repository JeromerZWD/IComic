<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/21
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin-item.css">
    <script>
        function deleteComment(id) {
            if(confirm('确实要删除该评论吗?')) {
                var url="${pageContext.request.contextPath}/deleteComment";
                var args={"id":id};
                $.post(url,args,function(data){
                    if(data=='ok'){
                        alert("评论删除更新成功！");
                        //页面刷新
                        window.location.reload();
                    }
                    else{
                        alert("删除失败");
                        window.location.reload();
                    }

                });
            }
        }
    </script>
</head>
<body>
<h1>评论管理</h1><br>
<div class="panel panel-default">
    <!-- 搜索部分 -->
    <div class="panel-body">
        <form class="form-inline" method="get" action="${pageContext.request.contextPath}/commentListByComicId">
            <div class="form-group">
                <label for="">漫画id</label>
                <input type="text" class="form-control" id=""  name="comicid">
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
</div>
<table class="table table-striped">
    <thead class="thead-light">
    <tr>
        <th>#</th>
        <th>用户id</th>
        <th>漫画id</th>
        <th>评论内容</th>
        <th>评论时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${commentList}" var="user" varStatus="i">
        <tr>
            <td>${i.count}</td>
            <td>${user.userid }</td>
            <td>${user.comicid}</td>
            <td>${user.message }</td>
            <td>${user.time}</td>
            <td>
                <a href="#" class="btn btn-danger btn-xs" onclick="deleteComment(${user.id})">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="col-md-12 text-right">
    <nav>
        <ul class="pagination">
            <li ><a href="#">首页 </a></li>
            <li ><a href="#">上一页 </a></li>
            <li><a href="#">1</a></li>
            <li ><a href="#">下一页</a></li>
            <li ><a href="#">尾页</a></li>
        </ul>
    </nav>
</div>
</body>
</html>
