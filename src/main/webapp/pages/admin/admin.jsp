<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/21
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台管理页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin.css">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script>
    $(function () {
        $(".left_navbar .nav_item").on("click", function () {
            $(this).addClass("left_active").siblings(".nav_item").removeClass("left_active");
        });
        $(".left_navbar .nav-item").mouseenter(function () {
            $(this).find("a").css("background-color", "#F2F6F9").siblings().css("background-color", "").parent().siblings().css("background-color", "")
        }).mouseleave(function () {
            $(this).find("a").css("background-color", "");
        });
        $(".btn").click(function () {
            //    console.log($(".nav_item .font").toggle().parents(".left_navbar"))
            $(".nav_item .font").toggle().parents(".left_navbar").toggleClass("short");
            $(".main .item").toggleClass("long")
        })
    });
</script>
<body>

<!-- 顶部导航 -->
<nav class="navbar navbar-default navbar-top" role="navigation">
    <span><a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/images/admin/2.png" width="200px" height="90px"/></a></span>
    <div class="button"><button class="btn" type="button"><span class="glyphicon glyphicon-align-justify"
                                                                aria-hidden="true"></span> </button></div>
    <ul class="nav navbar-nav navbar-right">
        <li>
            <a href="#"><span style="display: inline-block;line-height: 70px; color: #ABAFC1"> ${adminUser}</span>
                <!--<div class="img" style="float: right;margin: 10px;">
                    <img src="../../img/user/user.JPEG" width="50px" style="border-radius:50%"></div>-->
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/pages/admin/login.jsp" style="padding-top: 40px;margin-right: 40px;"><span>退出</span></a>
        </li>
    </ul>
</nav>
<!-- 主体内容 -->
<div class="main">
    <div class="row ">
        <div class="left_navbar  col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <div class="nav_list" id="left_navbar">
                <ul class="nav  nav-stacked">
                    <li class="nav_item active"><a href="${pageContext.request.contextPath}/adminIndex" target="item-page">
                            <span class="glyphicon glyphicon-home" aria-hidden="true">
                            </span><span class="font">&emsp;管理中心</span></a>
                    </li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/userList" target="item-page">
                            <span class="glyphicon glyphicon-user" aria-hidden="true">
                            </span><span class="font">&emsp;用户管理</span></a></li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/getComics" target="item-page">
                            <span class="glyphicon glyphicon-log-in" aria-hidden="true">
                            </span><span class="font">&emsp;漫画管理</span></a></li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/commentList" target="item-page">
                            <span class="glyphicon glyphicon-list-alt" aria-hidden="true">
                            </span><span class="font">&emsp;评论管理</span></a></li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/messageList" target="item-page">
                        </span><span class="glyphicon glyphicon-comment" aria-hidden="true">
                            </span><span class="font">&emsp;消息管理</span></a></li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/closeList" target="item-page">
                            <span class="glyphicon glyphicon-equalizer" aria-hidden="true">
                            </span><span class="font">&emsp;封号管理</span></a></li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/pages/admin/404.jsp" target="item-page">
                            <span class="glyphicon glyphicon-flag" aria-hidden="true">
                            </span><span class="font">&emsp;作家管理</span></a></li>
                    <li class="nav_item"><a href="${pageContext.request.contextPath}/pages/admin/404.jsp" target="item-page">
                            <span class="glyphicon glyphicon-send" aria-hidden="true">
                            </span><span class="font">&emsp;广告管理</span></a></li>
                </ul>
            </div>
        </div>

        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 item">
            <div class= "iframe">
                <iframe src="${pageContext.request.contextPath}/adminIndex" frameborder="0" name="item-page">

                </iframe>
            </div>
        </div>


    </div>
</div>
</body>
</html>
