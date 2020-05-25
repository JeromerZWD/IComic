<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/20
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理登录页面</title>
    <link rel="shortcut icon"	href="/pic/userPath/1.png">
    <link href="${pageContext.request.contextPath}/css/admin/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <%--  <script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
    <script>$(document).ready(function(c) {
        $('.alert-close').on('click', function(c){
            $('.message').fadeOut('slow', function(c){
                $('.message').remove();
            });
        });
    });
    </script>--%>
</head>
<body>
<!-- contact-form -->
<span class="adminSpan">后台管理页面</span>
<div class="message warning">
    <div class="inset">
        <div class="login-head">
            <h1>Login Form</h1>
            <div class="alert-close"> </div>
        </div>
        <form action="${pageContext.request.contextPath}/adminLogin" method="get">
            <p style="color: red;margin-bottom: 10px">${msg}</p>
            <li>
                <input type="text" class="text" value="username" name="username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}"><a href="#" class=" icon user"></a>
            </li>

            <li>
                <input type="password" value="password"  name="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
            </li>

            <div class="submit">
                <input type="submit"  value="Sign in" >
                <h4><a href="#">Lost your Password ?</a></h4>
                <div class="clear">  </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
