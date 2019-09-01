<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/28
  Time: 23:01
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

<body class="about">
<jsp:include page="navigation.jsp"/>

<!-- HERE START PAGE HEADER DESCRIPTION -->
<div id="all_page_header">
    <div class="bg_wood_page circle-inline-border"></div>
    <div class="elastic inline-border settings-clr no-second" id="page_header">
        <h1 class="over5">关于我们</h1>
        <div class="intro-description over5">
            <p>我们是在校大学生团队此网站只做项目训练用</p>
            <p>为了使项目实用，可提供给用户做漫画上传阅读使用</p>
        </div>
    </div>
</div> <!-- end of page header description -->


<!-- HERE START CONTENT -->
<div class="content elastic">
    <div class="column-grid">
        <div class="threecol">
            <h1 class="title-line blue settings-text"><span class="current-bg pr5">我的初衷</span></h1>
            <div class="space"></div>
            <p class="mytext-p3">该网站模板来自于@GfxPartner，首先感谢GfxPartner公司所有参与此网站模板开发的工作人员的贡献。
                我在此网站模板的基础上做了一些修改，用于我学习SSM框架整合的前台页面。我打算使用这个网站模板来搭建一个
                用于漫画阅读浏览的网站社区。
            </p>
            <p class="mytext-p3">
                该网站全部设计完成后，我不会把它作为商用，仅供学习和娱乐浏览使用。由于本人技术有限，网站只能做成现在这个样子，如果你有什么
                更好的想法或者创意可以在联系页面和我联系。
            </p>
        </div>
        <div class="threecol">
            <h1 class="title-line blue settings-text"><span class="current-bg pr5">我的期望</span></h1>
            <div class="space"></div>
            <p class="mytext-p3">
                我一开始只是打算用这个网站模板作为学习使用，后面看看设计的还挺顺眼，如果可以我会在整个项目设计完成后，把网站发布到Github上
                欢迎大家参与讨论设计。
            </p>
            <p class="mytext-p3">由于本人还是在校大学生，个人的能力优先，项目经验不足，此网站目前只能做到现在这个规模。希望在后面的工作学习
                中慢慢的把项目完善，把该有的功能都补齐全。欢迎大家参与此网站的设计与讨论。最后再次感谢网站基础模板设计公司GfxPartner所有参与
                该模板基础设计的设计人员。
            </p>
        </div>
    </div>

    <!-- HERE START TEAM ROLL BAND -->
    <div id="team">
        <h1 class="title-line blue"><span class="current-bg pr5 settings-text">主要模块</span></h1>

        <div class="projects-band-nohidden">
            <ul class="newitem">
                    <li><a href="detail.html" class="inline-border"><img src="${pageContext.request.contextPath}/images/slider/project_1.jpg" alt="" width="200" height="225"></a>
                        <div class="info">
                            <a href="#" class="description center">
                                <h4 class="title mytext-title">漫画模块</h4>
                            </a>
                        </div>
                    </li>
                <li><a href="detail.html" class="inline-border"><img src="${pageContext.request.contextPath}/images/slider/project_2.jpg" alt="" width="200" height="225"></a>
                    <div class="info">
                        <a href="#" class="description center">
                            <h4 class="title mytext-title">用户模块</h4>
                        </a>
                    </div>
                </li>
                <li><a href="detail.html" class="inline-border"><img src="${pageContext.request.contextPath}/images/slider/project_3.jpg" alt="" width="200" height="225"></a>
                    <div class="info">
                        <a href="#" class="description center">
                            <h4 class="title mytext-title">管理模块</h4>
                        </a>
                    </div>
                </li>
                <li><a href="detail.html" class="inline-border"><img src="${pageContext.request.contextPath}/images/slider/project_4.jpg" alt="" width="200" height="225"></a>
                    <div class="info">
                        <a href="#" class="description center">
                            <h4 class="title mytext-title">评论模块</h4>
                        </a>
                    </div>
                </li>
                <li><a href="detail.html" class="inline-border"><img src="${pageContext.request.contextPath}/images/slider/project_1.jpg" alt="" width="200" height="225"></a>
                    <div class="info">
                        <a href="#" class="description center">
                            <h4 class="title mytext-title">信息模块</h4>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div><!-- end of team roll band -->

    <h1 class="title-line blue"><span class="current-bg pr5 settings-text">资源统计</span></h1>
    <div class="space30"></div>
    <div class="column-grid">
        <div class="threecol">
            <p>Comic net, mainly provides the latest hot anime such as One Piece, Naruto, Death, Fairy Tail,
                and the Japanese anime recommendation list, mainly to provide anime fans with the latest popular Japanese anime.
                For example, the content of the idler animation encyclopedia website mainly involves the most professional
                animation portals such as Xinfan Animation, Anime News, Anime Gallery, Online Manga, Manga Daquan, etc.,
                aiming to disseminate the latest animation information, and daily update the online animation service platform. </p>
            <p>So far, the Comics Network has launched a variety of different sections.
                At the same time, it provides a more diversified choice for all animation enthusiasts
                from different levels and different angles.
                In addition, the idler animation network also brings unlimited joy to the anime fans.
                The comics are deeply loved by teenagers.</p>
        </div>
        <div class="threecol">
            <div class="project-complete-rate">
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">武侠</span> <span class="right">39%</span></a></p>
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">玄幻</span> <span class="right">56%</span></a></p>
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">都市</span> <span class="right">47%</span></a></p>
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">热血</span> <span class="right">86%</span></a></p>
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">冒险</span> <span class="right">78%</span></a></p>
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">恋爱</span> <span class="right">36%</span></a></p>
                <p><a href="#" class="inline-border standart-button-style mln settings-clr"><span
                        class="left">穿越</span> <span class="right">45%</span></a></p>

            </div>
        </div>
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