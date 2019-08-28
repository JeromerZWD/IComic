<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/27
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>I❤Manb 爱漫吧</title>
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
<body class="home">
<div class="elastic">
    <!-- 头部 -->
    <div id="header" class="grid-clear">
        <div class="grid" id="logo"><a href="index.html" class="settings-text">I❤Man 爱漫吧</a></div>
        <div class="grid main-menu-block">
            <ul id="main-menu">
                <li>
                    <form class="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="搜索漫画">
                        </div>
                    </form>
                </li>
                <li><a href="index.html" class="settings-txt">首页</a></li>
                <li><a href="portfolio.html" class="settings-txt">分类</a></li>
                <li><a href="blog.html" class="settings-txt">最近更新</a></li>
                <li><a href="services.html" class="settings-txt">连载ing~</a>
                    <ul>
                        <li><span class="top_area">&nbsp;</span></li>
                        <li><a href="columns.html" class="settings-txt">Columns</a></li>
                        <li><a href="404.html" class="settings-txt">404 Error</a></li>
                        <li><a href="user.html" class="settings-txt">Home 2</a></li>
                        <li><a href="#" class="settings-txt">More</a></li>
                        <li><span class="bottom_area">&nbsp;</span></li>
                    </ul>
                </li>
                <li><a href="about.html" class="settings-txt">说明</a></li>
                <li><a href="contact.html" class="settings-txt">联系我们</a></li>
                <li><button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#login">注册/登录</button>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="htmleaf-container">
    <div class="carousel" data-gap="80">
        <figure>

            <img src="${pageContext.request.contextPath}/images/slider/1.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/2.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/3.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/4.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/5.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/6.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/7.jpg" alt="">
            <img src="${pageContext.request.contextPath}/images/slider/8.jpg" alt="">
        </figure>
        <nav>
            <button class="nav prev">←</button>
            <button class="nav next">→</button>
        </nav>
    </div>
</div>

<!-- HERE START SLIDER -->
<div id="allslider">


    <!-- #allslider end -->

    <div class="elastic">

        <!-- HERE START PROJECTS BLOCK -->
        <div id="projects">

            <!-- 人气漫画 -->
            <h1 class="title-line blue settings-text"><span class="current-bg pr5">热门人气</span>
                <small class="current-bg right" style="float:right;margin-top:5px"><a class="arrow-left"
                                                                                      data-arrows="left">&nbsp;</a><a class="arrow-right" data-arrows="right">&nbsp;</a></small>
            </h1>
            <div class="projects-band">
                <ul class="scroll-band">
                    <c:forEach items="${heatList}" varStatus="i" var="comic" begin="0" end="10">
                    <li>
                        <a href="detail.html" class="inline-border">
                            <img src="/pic/${comic.photopath}" alt="" width="200" height="225" /></a>
                        <div class="info">
                            <a href="#" class="description center">
                                <h4 class="title mytext-title">${comic.comicname}</h4>
                            </a>
                            <p class="author center mytext-p">【${comic.author}】</p>
                            <p class="type center mytext-p">${comic.comicListsString}</p>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>

            <!-- 新品漫画 -->
            <h1 class="title-line blue settings-text"><span class="current-bg pr5">新品上架</span></h1>
            <div class="projects-band-nohidden">
                <ul class="newitem">
                    <c:forEach items="${timeList}" var="comic" end="9" begin="0">
                    <li><a href="detail.html" class="inline-border"><img src="/pic/${comic.photopath}" alt="" width="200" height="225"></a>
                        <div class="info">
                            <a href="#" class="description center">
                                <h4 class="title mytext-title">${comic.comicname}</h4>
                            </a>
                            <p class="author center mytext-p">【${comic.author}】</p>
                            <p class="type center mytext-p">${comic.comicListsString}</p>
                        </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <!-- 排行榜 -->
            <span class="dotted-line">&nbsp;</span>
            <div id="rank">
                <div class="rank1">
                    <h1 class="title-line blue f14 settings-text">
                        <span class="current-bg pr5">国漫热门排行</span></h1>
                    <ul class="nav nav-stacked">
                        <c:forEach items="${guo}" var="comic" begin="0" end="2" varStatus="i">
                        <li class="rank-items"><a href="#">
                            <img src="/pic/${comic.photopath}" alt="" class="rank-ican left">
                            <div class="rank-info left">
                                <span class="rank-num left">${i.count}</span>
                                <div class="left">
                                    <h4 class="title mytext-title">${comic.comicname}</h4>
                                    <p class="mytext-p">${comic.introduction}</p>
                                </div>
                            </div>
                        </a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="rank2">
                    <h1 class="title-line blue f14 settings-text">
                        <span class="current-bg pr5">日漫热门排行</span>
                    </h1>
                    <ul class="nav nav-stacked">
                        <c:forEach items="${ri}" varStatus="i" end="2" begin="0" var="comic">
                        <li class="rank-items"><a href="#">
                            <img src="/pic/${comic.photopath}" alt="" class="rank-ican left">
                            <div class="rank-info left">
                                <span class="rank-num left">${i.count}</span>
                                <div class="left">
                                    <h4 class="title mytext-title">${comic.comicname}</h4>
                                    <p class="mytext-p">${comic.introduction}</p>
                                </div>
                            </div>
                        </a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="rank3">
                    <h1 class="title-line blue f14 settings-text">
                        <span class="current-bg pr5">欧美热门排行</span></h1>
                    <ul class="nav nav-stacked">
                        <c:forEach items="${ou}" var="comic" begin="0" end="2" varStatus="i">
                        <li class="rank-items"><a href="#">
                            <img src="/pic/${comic.photopath}" alt="" class="rank-ican left">
                            <div class="rank-info left">
                                <span class="rank-num left">${i.count}</span>
                                <div class="left">
                                    <h4 class="title mytext-title">${comic.comicname}</h4>
                                    <p class="mytext-p">${comic.introduction}</p>
                                </div>
                            </div>
                        </a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <span class="dotted-line">&nbsp;</span>
            <!-- 排行榜 -->


            <!-- 日志信息列 -->
            <div class="column-grid team-blog">
                <!-- 左边介绍 -->
                <!-- HERE START OUR TEAM -->
                <div class="threecol">
                    <h1 class="title-line blue"><span class="current-bg pr5 settings-text">我们的团队</span></h1>
                    <div class="team-build">
                        <ul>
                            <li><a href="#" class="inline-border" title="Tyl"><img
                                    src="${pageContext.request.contextPath}/images/slider/project_1.jpg" width="90" height="90" alt="" /></a></li>
                            <li><a href="#" class="inline-border" title="Zwd"><img
                                    src="${pageContext.request.contextPath}/images/slider/project_2.jpg" width="90" height="90" alt="" /></a></li>
                            <li><a href="#" class="inline-border" title="Czq"><img
                                    src="${pageContext.request.contextPath}/images/slider/project_3.jpg" width="90" height="90" alt="" /></a></li>
                            <li><a href="#" class="inline-border" title="Wx"><img
                                    src="${pageContext.request.contextPath}/images/slider/project_4.jpg" width="90" height="90" alt="" /></a></li>
                            <li><a href="#" class="inline-border" title="Lf"><img
                                    src="${pageContext.request.contextPath}/images/slider/project_1.jpg" width="90" height="90" alt="" /></a></li>
                        </ul>
                        </ul>
                    </div>
                    <p class="mytext-title">声明：Imanb爱漫吧为纯属个人学习项目，仅作为学习网站部署搭建学习所用，并不具备版权，广大读者老爷们如果喜欢，且有支付能力，请您一定支持正版。</p>
                    <div class="more-proj">
                        <a href="#" class="inline-border standart-button-style mln settings-clr"><span
                                class="over5">关于我们</span></a>
                        <a href="#" class="inline-border standart-button-style settings-clr"><span
                                class="over5">联系我们</span></a>
                    </div>
                </div> <!-- end of our team -->

                <!-- 日志类信息 -->
                <!-- HERE START RECENT BLOG -->
                <div class="threecol">
                    <h1 class="title-line blue"><span class="current-bg pr5 settings-text">更新日志</span></h1>
                    <div class="blog-entry">
                        <div class="circle-area circle-inline-border settings-clr no-second">
                            <div class="date-blog">
                                <p class="day">11</p>
                                <p class="month">FEB</p>
                                <p class="year">2012</p>
                            </div>
                        </div>
                        <div class="blog-excerpt">
                            <h2><a href="#">海贼王第972话：索隆的暴走！！！</a></h2>
                            <p class="mytext-p2">索隆霸气鬼刀全开，对战大蛇将军，路飞正在赶来路上，他们能否战胜敌人帮助小桃拿回属于他的和之国呢 </p>
                            <p class="blog-excerpt-bottom"><a href="#" class="comments">113</a><a href="#"
                                                                                                  class="likes">206</a></p>
                        </div>
                    </div>
                    <span class="dotted-line">&nbsp;</span>
                    <div class="blog-entry">
                        <div class="circle-area circle-inline-border settings-clr no-second">
                            <div class="date-blog">
                                <p class="day">11</p>
                                <p class="month">FEB</p>
                                <p class="year">2012</p>
                            </div>
                        </div>
                        <div class="blog-excerpt">
                            <h2><a href="#">火影忍者第872话：鸣人VS佐助！！！</a></h2>
                            <p class="mytext-p2">友谊？羁绊?仇恨? 昔日最好的朋友展开了决斗，鸣人能否唤回佐助把他带回木叶村，还是历史重演，仇恨的战斗又开始了 </p>
                            <p class="blog-excerpt-bottom"><a href="#" class="comments">113</a><a href="#"
                                                                                                  class="likes">206</a></p>
                        </div>
                    </div>
                    <span class="dotted-line">&nbsp;</span>
                    <div class="blog-entry">
                        <div class="circle-area circle-inline-border settings-clr no-second">
                            <div class="date-blog">
                                <p class="day">11</p>
                                <p class="month">FEB</p>
                                <p class="year">2012</p>
                            </div>
                        </div>
                        <div class="blog-excerpt">
                            <h2><a href="#">斗破苍穹第680话：萧炎XO美杜莎</a></h2>
                            <p class="mytext-p2">大军来袭，陨落心炎彻底爆发，萧炎掉入焚气塔底层，当面列异火的攻击时，美杜莎女王突然苏醒了，在和异火斗争后他们居然。。。。</p>
                            <p class="blog-excerpt-bottom"><a href="#" class="comments">113</a><a href="#"
                                                                                                  class="likes">206</a></p>
                        </div>
                    </div>
                </div> <!-- end of recent blog -->
            </div>
        </div> <!-- .elastic -->

        <!-- 页脚 -->
        <!-- HERE START FOOTER -->
        <div id="footer" class="circle-inline-border">
            <div class="elastic">
                <div class="top_footer">
                    <div class="footer_widget">
                        <h3 class="general-font">Pages</h3>
                        <ul>
                            <li><a href="#">Home Page</a></li>
                            <li><a href="about.html">About Page</a></li>
                            <li><a href="services.html">Services Page</a></li>
                            <li><a href="portfolio.html">Portfolio Page</a></li>
                            <li><a href="blog.html">Blog Page</a></li>
                            <li><a href="contact.html">Contact Page</a></li>
                        </ul>
                    </div><!-- .footer_widget_1 -->

                    <div class="footer_widget">
                        <h3 class="general-font">Services</h3>
                        <ul>
                            <li><a href="#">Website Design</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Optimization</a></li>
                            <li><a href="#">Ecommerce</a></li>
                            <li><a href="#">Photography</a></li>
                            <li><a href="#">Branding</a></li>
                        </ul>
                    </div><!-- .footer_widget_2 -->

                    <div class="footer_widget">
                        <h3 class="general-font">Why Us?</h3>
                        <ul>
                            <li><a href="#">Easy to Customize</a></li>
                            <li><a href="#">Userfriendly</a></li>
                            <li><a href="#">Pixel Perfect</a></li>
                            <li><a href="#">Clean & Modern</a></li>
                            <li><a href="#">Complete Pages</a></li>
                            <li><a href="#">Add Color You Like</a></li>
                        </ul>
                    </div><!-- .footer_widget_3 -->
                    <div class="clear"></div>

                    <div class="footer_image">
                        <img class="inline-border active" src="${pageContext.request.contextPath}/images/slider/footer_home.jpg" alt="" width="450"
                             height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_2.jpg" alt="" width="450" height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_3.jpg" alt="" width="450" height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_4.jpg" alt="" width="450" height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_5.jpg" alt="" width="450" height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_6.jpg" alt="" width="450" height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_7.jpg" alt="" width="450" height="250" />
                        <img class="inline-border" src="${pageContext.request.contextPath}/images/slider/footer_8.jpg" alt="" width="450" height="250" />

                        <ul class="social-icons">
                            <li class="vimeo-social"><a href="#">&nbsp;</a></li>
                            <li class="twitter-social"><a href="#">&nbsp;</a></li>
                            <li class="flickr-social"><a href="#">&nbsp;</a></li>
                            <li class="facebook-social"><a href="#">&nbsp;</a></li>
                            <li class="dribbble-social"><a href="#">&nbsp;</a></li>
                        </ul>
                    </div>
                </div>

                <div class="bottom_footer">
                    <div class="left">
                        <p>&copy; Copyright &copy; 2013.Company name All rights reserved.</p>
                    </div>
                    <div class="right area2">

                    </div>
                    <div class="clear"></div>
                </div>
            </div> <!-- end of elastic -->
        </div><!-- #footer -->
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
                                      action="${pageContext.request.contextPath}/login.user">
                                    <div class="form-group">
                                        <label for="new_loginName" class="col-sm-2 control-label">账号</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="new_loginName" placeholder="账号"
                                                   name="loginName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="new_loginPwd" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="new_loginPwd" placeholder="密码"
                                                   name="loginPwd">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="login_code" class="col-sm-2 control-label">验证码</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="login_code" placeholder="验证码"
                                                   name="code">
                                            <div class="code" style="float: right">
                                                <img src="${pageContext.request.contextPath}/images/ia_10281.jpg" />
                                                <a href="javascript:changeCode()">看不清换一张</a><br>
                                                <!-- <img src="${pageContext.request.contextPath}/code" onclick="changeCode()" id="checkCodeImg"/>
												<a href="javascript:changeCode()" >看不清换一张</a><br> -->
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" value="" id="dologin" style="display: none">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="loginbtn">登录</button>
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
                                                   placeholder="账号" name="loginName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="register_loginPwd" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="register_loginPwd"
                                                   placeholder="密码" name="loginPwd">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="register_gender" class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="register_gender"
                                                   placeholder="性别" name="gender">
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
                                    <div class="form-group">
                                        <label for="register_QQ" class="col-sm-2 control-label">QQ</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="register_QQ" placeholder="QQ账号"
                                                   name="QQ">
                                        </div>
                                    </div>
                                    <input type="submit" value="" id="doRegister" style="display: none">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" id="registerBtn">注册</button>
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
        </div>
    </div>
</div>
</body>
</html>