<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/12
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>消息列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin-item.css">
    <script type="text/javascript">
        function deleteMessage(id) {
            if(confirm('确实要删除该消息吗?')) {
                var url="${pageContext.request.contextPath}/deleteMessage";
                var args={"id":id};
                $.post(url,args,function(data){
                    if(data=='ok'){
                        alert("消息删除更新成功！");
                        //页面刷新
                        window.location.reload();
                    }
                    else{
                        alert("删除失败");
                    }

                });
            }
        }
    </script>

</head>
<body>
<h1>消息管理</h1><br>
<div class="panel panel-default">
    <!-- 搜索部分 -->
    <div class="panel-body">
        <form class="form-inline" method="get" action="${pageContext.request.contextPath}/getMessagesByName">
            <div class="form-group">
                <label for="">用户名称</label>
                <input type="text" class="form-control" id="" value="" name="name">
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
</div>
<table class="table table-striped">
    <thead class="thead-light">
    <tr>
        <th>#</th>
        <th>name</th>
        <th>email</th>
        <th>message</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${messageList.list}" var="message" varStatus="i">
        <tr>
            <td>${i.count+(messageList.pageNum-1)*5}</td>
            <td>${message.mname }</td>
            <td>${message.email}</td>
            <td>${message.message}</td>
            <td><a href="#" class="btn btn-danger btn-xs" onclick="deleteMessage(${message.id})">删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="col-md-12 text-right">
    <nav>
        <ul class="pagination">
            <li ><a href="${pageContext.request.contextPath}/messageList?pn=1">首页 </a></li>
            <li ><a href="${pageContext.request.contextPath}/messageList?pn=${messageList.pageNum-1}">上一页 </a></li>
            <li><a href="#">${messageList.pageNum}</a></li>
            <li ><a href="${pageContext.request.contextPath}/messageList?pn=${messageList.pageNum+1}">下一页</a></li>
            <li ><a href="${pageContext.request.contextPath}/messageList?pn=${messageList.pages}">尾页</a></li>
        </ul>
    </nav>
</div>
</body>
</html>

