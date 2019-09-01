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
        function fun1(){
            $.post("${pageContext.request.contextPath}/updatePwd",
            $("#update_pwd").serialize(),
            function (data) {
                if(data =="ok"){
                    alert("修改密码成功,请重新登录！");
                    location.href="${pageContext.request.contextPath}/index";
                    window.location.reload();
                }else if (data =="error1") {
                    alert("两次密码不一致，修改密码失败！");
                    window.location.reload();
                }else {
                    alert("原密码错误，修改密码失败！");
                    window.location.reload();
                }
            });
        }
        function fun3(){
            window.location.href="${pageContext.request.contextPath}/pages/index/personal-info.jsp";
        }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<jsp:include page="navigation.jsp"/>
<!-- main container .wide-content is used for this layout without sidebar :)  -->

<div class="content wide-content">
    <button class="btn btn-primary" onclick="fun3()">基本信息</button><button class="btn btn-primary">修改密码</button>
    <div class="container-fluid">
        <div class="settings-wrapper" id="pad-wrapper">
            <!-- avatar column -->
            <div class="span3 avatar-box"></div>

            <!-- edit form column -->
            <div class="span7 personal-info">
                <h5 class="personal-title">Change password</h5>
               <form style="display: none">
                   <input type="text" id="user_session" value="${userSession}"/>
               </form>
                <form method="post" id="update_pwd">
                    <input type="text" name="id" style="display: none;" value="${userSession.id}"/>
                    <div class="field-box">
                        <label>Old password:</label>
                        <input class="span5 inline-input" type="text" name="password" placeholder="请输入原密码"/>
                    </div>
                    <div class="field-box">
                        <label>New password:</label>
                        <input class="span5 inline-input" type="text" name="newPwd1" placeholder="请输入新密码"/>
                    </div>
                    <div class="field-box">
                        <label>Confirm password:</label>
                        <input class="span5 inline-input" type="text" name="newPwd2" placeholder="确认密码"/>
                    </div>
                    <div class="span6 field-box actions">
                        <input type="button" class="btn-glow primary" value="Save Changes" onclick="fun1()" />
                        <span>OR</span>
                        <input type="reset" value="Cancel" class="reset" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end main container -->


<!-- scripts -->
<script src="${pageContext.request.contextPath}/js/index/user/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/index/user/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index/user/theme.js"></script>

</body>
</html>