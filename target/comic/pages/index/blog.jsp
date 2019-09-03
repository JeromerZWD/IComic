<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/9/1
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>I❤Manb 爱漫吧</title>
    <meta name="keywords" content="GFX, design" />
    <meta name="description" content="GFX Design" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />`
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
    <!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/index/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/functions.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/my.js"></script>
</head>

<body class="blog">
<jsp:include page="navigation.jsp"/>
<!-- HERE START PAGE HEADER DESCRIPTION -->
<!-- 页面 头部描述 -->
<div id="all_page_header">
    <div class="bg_wood_page circle-inline-border"></div>
    <div class="elastic inline-border settings-clr no-second" id="page_header">
        <h1 class="over5">更新日志</h1>
        <div class="intro-description over5">
            <p>最新、最全、最快的漫画更新，尽在爱漫吧。</p>
            <p>献给每一位爱看漫画的读者老爷 &nbsp; *(੭*ˊᵕˋ)੭*ଘ</p>
        </div>
    </div>
</div>
<!-- end of page header description -->


<!-- HERE START CONTENT -->
<div class="content elastic">
    <div class="grid-system">
        <!--左边更新日志部分-->
        <!-- HERE START LEFT SIDE BLOG -->
        <div class="grid w870 mr60 blog-content">
            <!-- 更新项 -->
            <c:forEach items="${chapterList}" var="chapter" begin="0" end="2" >
            <div class="article-blog grid-system log-item">
                <div class="grid comment-date w95">
                    <div class="circle-area circle-inline-border settings-clr no-second"></div>
                    <div class="com-data"></div>
                </div>
                <div class="grid article-content w775">
                    <p><a class="thumb-blog" href="${pageContext.request.contextPath}/getSingle?comicid=${chapter.comicid}&cnumber=${chapter.cnumber}"><span>&nbsp;</span><img class="inline-border" src="/pic/${chapter.comic.photopath}" style="width: 575px;height: 310px;"/></a></p>
                    <h2 class="blog-title">${chapter.comic.comicname}第${chapter.cnumber}话:${chapter.cname}</h2>
                    <h2 class="blog-title">更新时间:${chapter.ctime}</h2>
                    <p class="blog-more"><a href="${pageContext.request.contextPath}/getDetail?id=${chapter.comicid}" class="standart-button-style inline-border mln settings-clr"><span class="over5">查看更多</span></a></p>
                </div>
                <div class="clear"></div>
                <span class="dotted-line">&nbsp;</span>
            </div>
            </c:forEach>
            <!--******************-->
            <!--页码控件-->
            <div class="navigation">
                <a href="#" class="previous-page circle-inline-border settings-clr"><span
                        class="title-portfolio">PREV</span></a>
                <a href="#" class="next-page circle-inline-border settings-clr"><span
                        class="title-portfolio">NEXT</span></a>
            </div>
            <div class="space"></div>

        </div> <!-- end of left side blog -->

        <!--右边部分-->
        <!-- HERE START RIGHT SIDE BLOG -->
        <div class="grid w330 blog-aside">
            <div class="search-field">
                <form action="/" method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="查找更新...">
                    </div>
                    <input type="submit" class="loop-search" value=""   />
                </form>
            </div>

            <div class="widget-block">
                <h1 class="title-line blue settings-text"><span class="current-bg pr5" style="font-size:20px">关于我们</span></h1>
                <p>爱漫吧为纯属个人学习项目，仅作为学习网站部署搭建学习所用，并不具备版权。本站的所有内容均来自网友分享和上传，本站禁止任何形式的下载，
                    在线漫画的相关版权归原作者及发行商所有！本站欢迎与各大公司进行内容及模式上的合作，如有侵犯到您的权益，请联系我们确认及删除。
                </p>
            </div>

            <div class="widget-block">
                <h1 class="title-line blue settings-text"><span class="current-bg pr5"
                                                                style="font-size:20px">分类</span></h1>
                <ul class="circle-bullet-list">
                    <li><a href="#">全部</a></li>
                    <li><a href="#">言情</a></li>
                    <li><a href="#">玄幻</a></li>
                    <li><a href="#">都市</a></li>
                    <li><a href="#">冒险</a></li>
                    <li><a href="#">校园</a></li>
                    <li><a href="#">仙侠</a></li>
                    <li><a href="#">搞笑</a></li>
                </ul>
            </div>

            <div class="widget-block">
                <h1 class="title-line blue settings-text"><span class="current-bg pr5"
                                                                style="font-size:20px">每月更新</span></h1>
                <ul class="circle-bullet-list">
                    <li><a href="#">January（一月）</a></li>
                    <li><a href="#">February（二月）</a></li>
                    <li><a href="#">March（三月）</a></li>
                    <li><a href="#">April（四月）</a></li>
                    <li><a href="#">May（五月）</a></li>
                    <li><a href="#">June（六月）</a></li>
                    <li><a href="#">July（七月）</a></li>
                    <li><a href="#">August（八月）</a></li>
                    <li><a href="#">September（九月）</a></li>
                    <li><a href="#">October（十月）</a></li>
                    <li><a href="#">November（十一月）</a></li>
                    <li><a href="#">December（十二月）</a></li>
                </ul>
            </div>

            <div class="widget-block">
                <h1 class="title-line blue settings-text"><span class="current-bg pr5"
                                                                    style="font-size:20px">最新评论</span></h1>
                <c:forEach items="${commentList}" var="comment" begin="0" end="4" varStatus="i">
                <div class="tweet">
                    <p><a href="#">@用户${i.count}:</a> ${comment.message}</p>
                    <p class="tweet-hour blue">${comment.ctime}</p>
                </div>
                </c:forEach>
            </div>
        </div> <!-- end of right side blog -->
    </div>
</div> <!-- #content -->

<div id="footer" class="circle-inline-border">
    <div class="elastic">
        <div class="top_footer">
            <div class="footer_widget">
                <h3 class="general-font">Pages</h3>
                <ul>
                    <li><a href="index.html">Home Page</a></li>
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
                <img class="inline-border active" src="images/slider/footer_home.jpg" alt="" width="450"
                     height="250" />
                <img class="inline-border" src="images/slider/footer_2.jpg" alt="" width="450" height="250" />
                <img class="inline-border" src="images/slider/footer_3.jpg" alt="" width="450" height="250" />
                <img class="inline-border" src="images/slider/footer_4.jpg" alt="" width="450" height="250" />
                <img class="inline-border" src="images/slider/footer_5.jpg" alt="" width="450" height="250" />
                <img class="inline-border" src="images/slider/footer_6.jpg" alt="" width="450" height="250" />
                <img class="inline-border" src="images/slider/footer_7.jpg" alt="" width="450" height="250" />
                <img class="inline-border" src="images/slider/footer_8.jpg" alt="" width="450" height="250" />

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
                <p>&copy; Copyright &copy; 2019.Company name All rights reserved. </p>
                <ul class="footer_menu">
                    <li><a href="#">Term of service</a>|</li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="right area2">
                <p>Website designed by: <a href="#">@Larimar</a></p>
                <p>888-888-888 | <a href="#">info@ss.larimar.xyz</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </div> <!-- end of elastic -->
</div><!-- #footer -->

</body>

</html>