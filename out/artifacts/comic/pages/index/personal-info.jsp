<%--
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
            var form=document.getElementById("userform");
            var file=document.getElementById("userfile");
            file.click();
            file.onchange=function(){
                form.submit();
            }
        }
        function fun3(){
            window.location.href="${pageContext.request.contextPath}/pages/index/personal-info1.jsp";
        }
        function fun6(){
            window.location.href="${pageContext.request.contextPath}/getFavoritesByUserId?userId=${userSession.id}";
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            var key=$("#selectRefundReason").val();
            //根据值让option选中
            $("#user_time_zone option[value='"+key+"']").attr("selected","selected");
        });
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<jsp:include page="navigation.jsp"/>
<!-- main container .wide-content is used for this layout without sidebar :)  -->

<div class="content wide-content">
    <button class="btn btn-primary">基本信息</button><button class="btn btn-primary" onclick="fun3()">修改密码</button><button class="btn btn-primary" onclick="fun6()">我的收藏</button>
    <div class="container-fluid">
        <div class="settings-wrapper" id="pad-wrapper">
            <!-- avatar column -->
            <div class="span3 avatar-box">
                <div class="personal-image">
                    <img src="/pic/userPath/${userSession.photoPath}" class="avatar img-circle" onclick="fun1()"/>
                    <form  id="userform" style="display: none;" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/updatePath">
                        <input type="text" name="id" value="${userSession.id}"/>
                        <input type="file" id="userfile" name="file" />
                    </form>

                </div>
            </div>

            <!-- edit form column -->
            <div class="span7 personal-info">
                <h5 class="personal-title">Personal info</h5>
                <form style="display: none">
                    <input type="text" id="user_session1" value="${userSession}"/>
                </form>
                <form method="post" action="${pageContext.request.contextPath}/updateUser">
                    <input type="text" name="id" style="display: none;" value="${userSession.id}"/>
                    <input type="hidden" id ="selectRefundReason" value="${userSession.gender}"/>
                    <div class="field-box">
                        <label>User name:</label>
                        <input class="span5 inline-input" type="text" name="username" value="${userSession.username}" />
                    </div>
                    <div class="field-box">
                        <label>Telephone:</label>
                        <input class="span5 inline-input" type="text" name="telephone" value="${userSession.telephone}" />
                    </div>
                    <div class="field-box">
                        <label>Email:</label>
                        <input class="span5 inline-input" type="text" name="email" value="${userSession.email}" />
                    </div>
                    <div class="field-box">
                        <label for="user_time_zone">Gender:</label>
                        <div class="ui-select">
                            <select id="user_time_zone"  name="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="span6 field-box actions">
                        <input type="submit" class="btn-glow primary" value="Save Changes" />
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