<%--
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
    <title>封号列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin-item.css">
    <script type="text/javascript">
        function editUser(id) {
            if(confirm('确实要解封吗?')) {
                var url="${pageContext.request.contextPath}/openUser";
                var args={"id":id};
                $.post(url,args,function(data){
                    if(data=='ok'){
                        alert("解封成功！");
                        //页面刷新
                        window.location.reload();
                    }
                    else{
                        alert("解封失败");
                    }
                });
            }
        }
        function deleteUser(id) {
            if(confirm('确实要删除该客户吗?')) {
                var url="${pageContext.request.contextPath}/deleteUser";
                var args={"id":id};
                $.post(url,args,function(data){
                    if(data=='ok'){
                        alert("客户删除更新成功！");
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
<h1>封号管理</h1><br>
<div class="panel panel-default">
    <!-- 搜索部分 -->
    <div class="panel-body">
        <form class="form-inline" method="get" action="${pageContext.request.contextPath}/getCloseUserByLoginName">
            <div class="form-group">
                <label for="">用户账号</label>
                <input type="text" class="form-control" id="" value="" name="loginname">
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
</div>
<table class="table table-striped">
    <thead class="thead-light">
    <tr>
        <th>#</th>
        <th>用户名</th>
        <th>账号</th>
        <th>密码</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>性别</th>
        <th>注册时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${closeList}" var="user" varStatus="i">
        <tr>
            <td>${i.count}</td>
            <td>${user.username }</td>
            <td>${user.loginname}</td>
            <td>${user.password }</td>
            <td>${user.telephone}</td>
            <td>${user.email}</td>
            <td>${user.gender}</td>
            <td>${user.registerTime}</td>
            <td><a href="#" class="btn btn-primary btn-xs"  onclick="editUser(${user.id})">解封</a>
                <a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${user.id})">删除</a>
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
