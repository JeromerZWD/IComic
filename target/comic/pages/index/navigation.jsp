<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/29
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>IComic漫画网</title>
    <link rel="shortcut icon"	href="/pic/userPath/1.png">
    <meta name="keywords" content="GFX, design" />
    <meta name="description" content="GFX Design" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lunbo/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lunbo/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lunbo/style.css">
    <!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/index/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/functions.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/my.js"></script>
    <script type="text/javascript">
        'use strict';

        window.addEventListener('load', function () {
            var carousels = document.querySelectorAll('.carousel');

            for (var i = 0; i < carousels.length; i++) {
                carousel(carousels[i]);
            }
        });

        function carousel(root) {
            var figure = root.querySelector('figure'),
                nav = root.querySelector('nav'),
                images = figure.children,
                n = images.length,
                gap = root.dataset.gap || 0,
                bfc = 'bfc' in root.dataset,
                theta = 2 * Math.PI / n,
                currImage = 0;

            setupCarousel(n, parseFloat(getComputedStyle(images[0]).width));
            window.addEventListener('resize', function () {
                setupCarousel(n, parseFloat(getComputedStyle(images[0]).width));
            });

            setupNavigation();

            function setupCarousel(n, s) {
                var apothem = s / (2 * Math.tan(Math.PI / n));

                figure.style.transformOrigin = '50% 50% ' + -apothem + 'px';

                for (var i = 0; i < n; i++) {
                    images[i].style.padding = gap + 'px';
                }for (i = 1; i < n; i++) {
                    images[i].style.transformOrigin = '50% 50% ' + -apothem + 'px';
                    images[i].style.transform = 'rotateY(' + i * theta + 'rad)';
                }
                if (bfc) for (i = 0; i < n; i++) {
                    images[i].style.backfaceVisibility = 'hidden';
                }rotateCarousel(currImage);
            }

            function setupNavigation() {
                nav.addEventListener('click', onClick, true);

                function onClick(e) {
                    e.stopPropagation();

                    var t = e.target;
                    if (t.tagName.toUpperCase() != 'BUTTON') return;

                    if (t.classList.contains('next')) {
                        currImage++;
                    } else {
                        currImage--;
                    }

                    rotateCarousel(currImage);
                }
            }

            function rotateCarousel(imageIndex) {
                figure.style.transform = 'rotateY(' + imageIndex * -theta + 'rad)';
            }
        }
    </script>
</head>
<body>
<div class="elastic">
    <!-- 头部 -->
    <div id="header" class="grid-clear">
        <div class="grid" id="logo"><a href="${pageContext.request.contextPath}/index" class="settings-text">IComic漫画网</a></div>
        <div class="grid main-menu-block">
            <ul id="main-menu">
                <li>
                    <form class="search" action="${pageContext.request.contextPath}/getComicByLikeName">
                        <div class="form-group">
                            <input type="text" name="comicname" class="form-control" placeholder="搜索漫画" >
                        </div>
                    </form>
                </li>
                <li><a href="${pageContext.request.contextPath}/index" class="settings-txt">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/protfolio" class="settings-txt">分类</a></li>
                <li><a href="${pageContext.request.contextPath}/getUpdateChapter" class="settings-txt">最近更新</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/index/about.jsp" class="settings-txt">说明</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/index/contact.jsp" class="settings-txt">联系我们</a></li>
            </ul>
            <%
                boolean flag=false;
                User user=(User) request.getSession().getAttribute("userSession");
                if (user!=null){
                    flag=true;
                }
                request.setAttribute("flag",flag);
            %>
        </div>
        <c:if test="${!requestScope.flag}" var="flag" scope="request">
        <div id="login_user"  ><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#login">注册/登录</button></div>
        </c:if>
        <c:if test="${!flag}" var="flag" scope="request">
        <div class="login_success" id="login_user1">
            <a href="${pageContext.request.contextPath}/pages/index/personal-info.jsp">
                <div style="float: left;"><img src="/pic/userPath/${userSession.photoPath}"  style="border-radius: 50%;width: 60px;height: 60px;"/></div>
                <div style="float: left;padding-top: 7px;padding-left: 5px;"><span class="leve">欢迎您，</span><p class="name">${userSession.username}</p></div>
            </a>
            <div style="padding-left:140px;padding-top:15px;font-size:20px;"><a onclick="fun2()">退出</a></div>
        </div>
        </c:if>
    </div>
</div>
<!-- 模态框 -->
<!-- 注册登录模块框 -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <div role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" aria-controls="login" role="tab" data-toggle="tab">登录</a>
                            </li>
                            <li role="presentation">
                                <a href="#tab" aria-controls="register" role="tab" data-toggle="tab">注册</a>
                            </li>
                        </ul>
                    </div>
                </h4>
            </div>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="modal-body">
                        <form class="form-horizontal" id="user_form" method="post"
                              action="${pageContext.request.contextPath}/userLogin">
                            <div class="form-group">
                                <label for="loginName" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="loginName" placeholder="账号"
                                           name="loginname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_pwd" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="login_pwd" placeholder="密码"
                                           name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_code" class="col-sm-2 control-label">验证码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="login_code" placeholder="验证码"
                                           name="codes">
                                    <div class="code" style="float: right">
                                       <img src="${pageContext.request.contextPath}/checkCode" onclick="changeCode()" id="checkCodeImg"/>
												<a href="javascript:changeCode()" >看不清换一张</a><br>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" value="" id="dologin" style="display: none">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="loginbtn" onclick="userLogin()">登录</button>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab">
                    <div class="modal-body">
                        <form class="form-horizontal" id="register_user_form" method="post"
                              action="register.user">
                            <div class="form-group">
                                <label for="register_loginName" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_loginName"
                                           placeholder="账号" name="loginname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_loginPwd" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="register_loginPwd"
                                           placeholder="密码" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_userName" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_userName" placeholder="用户名"
                                           name="username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_gender" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-8">
                                    <select id="register_gender" name="gender" style="width: 370px;border-radius: 34px;height: 34px;font-size: 14px;padding-left: 10px;color: #999999;">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_email" class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_email"
                                           placeholder="Email" name="email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_telephone" class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_telephone"
                                           placeholder="电话" name="telephone">
                                </div>
                            </div>
                            <input type="submit" value="" id="doRegister" style="display: none">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="registerBtn" onclick="register()">注册</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 注册登录模块框 -->
<!-- js 部分 -->
<div style="display:none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript'
            charset='gb2312'></script>
    <script>
        function register() {
            $.post("${pageContext.request.contextPath}/addUser",
                $("#register_user_form").serialize(),
                function (data) {
                    if(data =="ok"){
                        alert("用户注册成功！");
                        window.location.reload();
                    }else if (data=="reset"){
                        alert("该账号已存在，请重新输入！")
                    }else{
                        alert("用户注册失败！");
                    }
                });
        }
        function userLogin() {
            $.post("${pageContext.request.contextPath}/userLogin",
            $("#user_form").serialize(),
            function (data) {
                if(data =="ok"){
                    alert("用户登录成功！");
                    window.location.reload();
                }else if (data =="key") {
                    alert("验证码错误！");
                }else if(data =="close"){
                    alert("用户已被封号！");
                }else{
                    alert("用户登录失败！");
                }
            });
        }
        function fun2(){
            $.post("${pageContext.request.contextPath}/exitUser");
            window.location.reload();
        }
        function changeCode() {
            $.post("${pageContext.request.contextPath}/checkCode");
            $("#checkCodeImg").attr("src","${pageContext.request.contextPath}/checkCode");
        }
    </script>
</div>
</body>
</html>
