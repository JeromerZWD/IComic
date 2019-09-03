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
<h1>章节管理</h1><br>
<div class="panel panel-default">
    <!-- 搜索部分 -->
    <div class="panel-body">
        <form class="form-inline" method="get" action="${pageContext.request.contextPath}/getChapterByNumber">
            <input type="hidden" name="comicid" value="${comicid}">
            <div class="form-group">
                <label for="comicName">章节数</label>
                <input type="text" class="form-control" id="comicName" name="cnumber">
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
</div>
<table class="table table-striped">
    <thead class="thead-light">
    <tr>
        <th>#</th>
        <th>章节数</th>
        <th>章节名</th>
        <th>上传时间</th>
        <th>章节内容</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${chapterList.list}" var="user" varStatus="i">
        <tr>
            <td>${i.count+(chapterList.pageNum-1)*5}</td>
            <td>${user.cnumber}</td>
            <td>${user.cname}</td>
            <td>${user.ctime}</td>
            <td>${user.content}</td>
            <td>
                <a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${user.id})">删除章节</a>
                <a href="${pageContext.request.contextPath}/pages/admin/addChapter.jsp?comicid=${user.comicid}" class="btn btn-primary btn-xs">添加章节</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="col-md-12 text-right">
    <nav>
        <ul class="pagination">
            <li ><a href="${pageContext.request.contextPath}/chapterList?pn=1&comicid=${comicid}">首页 </a></li>
            <li ><a href="${pageContext.request.contextPath}/chapterList?pn=${chapterList.pageNum-1}&comicid=${comicid}">上一页 </a></li>
            <li><a href="#">${chapterList.pageNum}</a></li>
            <li ><a href="${pageContext.request.contextPath}/chapterList?pn=${chapterList.pageNum+1}&comicid=${comicid}">下一页</a></li>
            <li ><a href="${pageContext.request.contextPath}/chapterList?pn=${chapterList.pages}&comicid=${comicid}">尾页</a></li>
        </ul>
    </nav>
</div>
<script type="text/javascript">
    //删除章节
    function deleteUser(id) {
        if(confirm('确实要删除该章节吗?')) {
            var url="${pageContext.request.contextPath}/deleteChapterById";
            var args={"id":id};
            $.post(url,args,function(data){
                if(data=='ok'){
                    alert("章节删除更新成功！");
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
