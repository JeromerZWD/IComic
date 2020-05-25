<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/27
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>IComic 漫画网</title>
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

<body class="404">
<jsp:include page="navigation.jsp"/>
<div id="all_page_header">
    <div class="bg_wood_page circle-inline-border"></div>
    <div class="elastic inline-border settings-clr no-second" id="page_header">
        <h1 class="over5">俺找不到了</h1>
        <div class="intro-description over5">
            <p>抱歉！o(╥﹏╥)o 读者老爷您要找的内容不存在或者已删除。</p>
            <p>我们将尽快更新您所需要的内容。满足各位读者老爷的需求</p>
        </div>
    </div>
</div>

<div class="content elastic">
    <div class="error_404"></div>
    <div class="error_text">Page not found! <span class="blue japan s_404 settings-text">404</span></div>
    <div class="space"></div>
    <p class="s20 center" style="font-family: AlexonBoldRegular;">非常抱歉，读者老爷，这个页面小漫没有找到哦。</p>
    <p class="center mt30"><a href="javascript:window.history.go(-1)"
                              class="standart-button-style inline-border settings-clr"><span class="over5">返回上一页</span></a></p>
</div> <!-- #content -->

<!-- HERE START FOOTER -->
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
                <p>&copy; Copyright &copy; 2013.Company name All rights reserved. </p>
                <ul class="footer_menu">
                    <li><a href="#">Term of service</a>|</li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="right area2">
                <p>Website designed by: <a href="#">GfxPartner</a></p>
                <p>888-888-888 | <a href="#">info@gfxpartner.com</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </div> <!-- end of elastic -->
</div><!-- #footer -->


</body>

</html>
