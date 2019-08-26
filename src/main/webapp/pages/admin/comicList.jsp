<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/22
  Time: 20:48
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
</head>
<body>
<h1>漫画管理</h1><br>
<div class="panel panel-default">
    <!-- 搜索部分 -->
    <div class="panel-body">
        <form class="form-inline" method="get" action="${pageContext.request.contextPath}/getComicSByOther">
            <div class="form-group">
                <label for="comicName">漫画名</label>
                <input type="text" class="form-control" id="comicName" name="comicname">
            </div>
            <div class="form-group">
                <label for="comicAuthor">漫画作者</label>
                <input type="text" class="form-control" id="comicAuthor" value="" name="author">
            </div>
            <div class="form-group">
                <label for="comicCode">漫画状态</label>
                <select class="form-control" id="comicCode" name="code">
                    <option value="连载">连载</option>
                    <option value="完结">完结</option>
                </select>
            </div>
            <div class="form-group">
                <label for="comicArea">漫画地区</label>
                <select class="form-control" id="comicArea" name="area">
                    <option value="国漫">国漫</option>
                    <option value="日漫">日漫</option>
                    <option value="欧美">欧美</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
</div>
<a href="${pageContext.request.contextPath}/pages/admin/addComic.jsp" class="btn btn-primary">新建</a>
<table class="table table-striped">
    <thead class="thead-light">
    <tr>
        <th>#</th>
        <th>漫画名</th>
        <th>作者</th>
        <th>状态</th>
        <th>地区</th>
        <th>更新时间</th>
        <th>评分</th>
        <th>浏览量</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${comicList}" var="user" varStatus="i">
        <tr>
            <td>${i.count}</td>
            <td>${user.comicname }</td>
            <td>${user.author}</td>
            <td>${user.code}</td>
            <td>${user.area}</td>
            <td>${user.updatetime}</td>
            <td>${user.score}</td>
            <td>${user.heat}</td>
            <td>
                <a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${user.id})">删除漫画</a>
                <a href="${pageContext.request.contextPath}/chapterList?comicid=${user.id}" class="btn btn-primary btn-xs">章节管理</a>
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
    // 创建漫画
    function createUser() {
        $.post("${pageContext.request.contextPath}/addUser",
            $("#new_user_form").serialize(),
            function(data){
                if(data =="ok"){
                    alert("用户创建成功！");
                    window.location.reload();
                }else{
                    alert("用户创建失败！");
                    window.location.reload();
                }
            });
    }
   //删除漫画
    function deleteUser(id) {
        if(confirm('确实要删除该漫画吗?')) {
            var url="${pageContext.request.contextPath}/deleteComicById";
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
