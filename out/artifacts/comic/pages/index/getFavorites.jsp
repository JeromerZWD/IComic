<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/29
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Admin - My Info</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin-item.css">
    <!-- bootstrap -->
    <link href="${pageContext.request.contextPath}/css/user/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/user/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/user/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/layout.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/elements.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/font-awesome.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/personal-info.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/jquery-3.4.1.js"></script>
    <script>
        function fun3(){
            window.location.href="${pageContext.request.contextPath}/pages/index/personal-info.jsp";
        }
        function fun4(){
            window.location.href="${pageContext.request.contextPath}/pages/index/personal-info1.jsp";
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<jsp:include page="navigation.jsp"/>
<!-- main container .wide-content is used for this layout without sidebar :)  -->

<div class="content wide-content">
    <button class="btn btn-primary" onclick="fun3()">基本信息</button><button class="btn btn-primary" onclick="fun4()">修改密码</button><button class="btn btn-primary">我的收藏</button>
    <div style="width: 1500px;padding-left: 200px;padding-top: 50px">
    <table class="table table-striped">
        <thead class="thead-light">
        <tr>
            <th>漫画封面</th>
            <th>漫画名</th>
            <th>作者</th>
            <th>状态</th>
            <th>地区</th>
            <th>更新时间</th>
            <th>评分</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${favoriteList.list}" var="favorite" varStatus="i">
            <tr>
                <td> <img src="/pic/${favorite.comic.photopath}" alt="" width="100" height="112" /></td>
                <td>${favorite.comic.comicname }</td>
                <td>${favorite.comic.author}</td>
                <td>${favorite.comic.ccode}</td>
                <td>${favorite.comic.area}</td>
                <td>${favorite.comic.updatetime}</td>
                <td>${favorite.comic.score}</td>
                <td>
                    <a href="#" class="btn btn-danger btn-xs" onclick="deleteFavorite(${favorite.id})">取消收藏</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="col-md-12 text-right">
        <nav>
            <ul class="pagination">
                <li ><a href="${pageContext.request.contextPath}/getFavoritesByUserId?userId=${userSession.id}">首页 </a></li>
                <li ><a href="${pageContext.request.contextPath}/getFavoritesByUserId?pn=${favoriteList.pageNum-1}&userId=${userSession.id}">上一页 </a></li>
                <li><a href="#">${favoriteList.pageNum}</a></li>
                <li ><a href="${pageContext.request.contextPath}/getFavoritesByUserId?pn=${favoriteList.pageNum+1}&userId=${userSession.id}">下一页</a></li>
                <li ><a href="${pageContext.request.contextPath}/getFavoritesByUserId?pn=${favoriteList.pages}&userId=${userSession.id}">尾页</a></li>
            </ul>
        </nav>
    </div>
    </div>
</div>
<!-- end main container -->


<!-- scripts -->
<script src="${pageContext.request.contextPath}/js/index/user/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/index/user/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index/user/theme.js"></script>
<script>
    //删除漫画
    function deleteFavorite(id) {
        if(confirm('确实要取消收藏该漫画吗?')) {
            var url="${pageContext.request.contextPath}/removeFavorite";
            var args={"id":id};
            $.post(url,args,function(data){
                if(data=='ok'){
                    alert("取消收藏更新成功！");
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
