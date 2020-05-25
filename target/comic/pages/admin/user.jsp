<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/21
  Time: 19:24
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
    <link rel="shortcut icon"	href="/pic/userPath/1.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin-item.css">
</head>
<body>
<h1>用户管理</h1><br>
<div class="panel panel-default">
    <!-- 搜索部分 -->
    <div class="panel-body">
        <form class="form-inline" method="get" action="${pageContext.request.contextPath}/getUserByOther">
            <div class="form-group">
                <label for="loginName">用户名</label>
                <input type="text" class="form-control" id="loginName" name="username">
            </div>
            <div class="form-group">
                <label for="">用户账号</label>
                <input type="text" class="form-control" id="" value="" name="loginname">
            </div>
            <div class="form-group">
                <label for="playgender">性别</label>
                <select class="form-control" id="playgender" name="gender">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
</div>
<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#newUserDialog" onclick="clearstudent()">新建</a>
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
    <c:forEach items="${list.list}" var="user" varStatus="i">
        <tr>
            <td>${i.count+(list.pageNum-1)*5}</td>
            <td>${user.username }</td>
            <td>${user.loginname}</td>
            <td>${user.password }</td>
            <td>${user.telephone}</td>
            <td>${user.email}</td>
            <td>${user.gender}</td>
            <td>${user.registerTime}</td>
            <td><a href="#" class="btn btn-primary btn-xs"  onclick="editUser(${user.id})">封号</a>
                <a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${user.id})">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="col-md-12 text-right">
    <nav>
        <ul class="pagination">
            <li ><a href="${pageContext.request.contextPath}/userList?pn=1">首页 </a></li>
            <li ><a href="${pageContext.request.contextPath}/userList?pn=${list.pageNum-1}">上一页 </a></li>
            <li><a href="#">${list.pageNum}</a></li>
            <li ><a href="${pageContext.request.contextPath}/userList?pn=${list.pageNum+1}">下一页</a></li>
            <li ><a href="${pageContext.request.contextPath}/userList?pn=${list.pages}">尾页</a></li>
        </ul>
    </nav>
</div>
<!-- /.panel-body -->
<!-- 创建用户模态框 -->
<div class="modal fade" id="newUserDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_user_form">
                    <div class="form-group">
                        <label for="new_Name" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_Name" placeholder="用户名" name="username">
                        </div>
                        <label for="new_loginName" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_loginName" placeholder="账号" name="loginname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_loginPwd" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" id="new_loginPwd" placeholder="密码" name="password">
                        </div>
                        <label for="new_telephone" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_telephone" placeholder="电话号码" name="telephone">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="new_email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-4">
                            <input type="email" class="form-control" id="new_email" placeholder="Email" name="email">
                        </div>
                        <label for="new_gender" class="col-sm-2 control-label">
                            性别</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="new_gender" name="gender">
                                <option value="女">女</option>
                                <option value="男">男</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createUser()">创建用户</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //清空新建用户窗口中的数据
    function clearstudent() {
        $("#new_loginName").val("");
        $("#new_loginPwd").val("");
        $("#new_Name").val("");
        $("#new_gender").val("");
        $("#new_telephone").val("");
        $("#new_email").val("");
    }
    // 创建用户
    function createUser() {
        $.post("${pageContext.request.contextPath}/addUser",
            $("#new_user_form").serialize(),
            function(data){
                if(data =="ok"){
                    alert("用户创建成功！");
                    window.location.reload();
                }else if(data =="reset"){
                        alert("该账号已存在！");
                }else {
                    alert("用户创建失败！");
                }
            });
    }
    //封号
    function editUser(id) {
        if(confirm('确实要封号吗?')) {
            var url="${pageContext.request.contextPath}/closeUser";
            var args={"id":id};
            $.post(url,args,function(data){
                if(data=='ok'){
                    alert("封号成功！");
                    //页面刷新
                    window.location.reload();
                }
                else{
                    alert("封号失败");
                    window.location.reload();
                }
            });
        }
    }
    //删除
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
                    window.location.reload();
                }

            });
        }
    }
</script>
</body>
</html>
