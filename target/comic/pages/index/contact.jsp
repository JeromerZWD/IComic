<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/28
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>IComic漫画网</title>
    <link rel="shortcut icon"	href="/pic/userPath/1.png">
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
    <script>
       function fun1() {
            $.post("${pageContext.request.contextPath}/addMessage",
                $("#contactForm").serialize(),
                function(data){
                    if(data =="ok"){
                        alert("发送成功！");
                        window.location.reload();
                    }else{
                        alert("发送失败！");
                        window.location.reload();
                    }
                });
       }
    </script>
</head>
<body class="contact">
<jsp:include page="navigation.jsp"/>

<!-- HERE START PAGE HEADER DESCRIPTION -->
<div id="all_page_header">
    <div class="bg_wood_page circle-inline-border"></div>
    <div class="elastic inline-border settings-clr no-second" id="page_header">
        <h1 class="over5">联系我们</h1>
        <div class="intro-description over5">
            <p>如果你有什么好的建议或者想法请及时联系我们</p>
            <p>该项目只做学习用，如发现有侵权，请通知我们删除。</p>
        </div>
    </div>
</div>
<!-- end of page header description -->

<!-- HERE START CONTENT -->
<div class="content elastic">
    <div class="grid-system">
        <!-- LEFT SIDE -->
        <div class="grid w670 mr40">
            <h1 class="title-line blue settings-text"><span class="current-bg pr5">给我们发送消息</span></h1>
            <div class="space50"></div>

            <div class="contact-form">
                <form method="post" id="contactForm">
                    <div class="block-form locked">
                        <input type="text" name="mname" id="name" placeholder="Name" />
                        <input type="email" name="email" id="email" placeholder="Email" />
                    </div>
                    <div class="block-form">
                        <textarea name="message" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                    </div>
                    <div class="block-form"><input type="button" value="现在发送" id="submit-form"
                                                   class="settings-clr" onclick="fun1()"/>
                        <p id="resultofsend"></p>
                    </div>
                </form>
            </div>
        </div><!-- end of left side -->

        <!-- RIGHT SIDE -->
        <div class="grid w250">
            <h1 class="title-line blue settings-text"><span class="current-bg pr5" style="font-size:20px">联系信息</span></h1>

            <div class="aside-contact">
                <div class="space10"></div>

                <div class="icons-contact">
                    <ul>
                        <li><a href="#" class="contact-sphere circle-inline-border settings-clr"
                               title="+86 139 7952 3361"><span data-icon="contacts-phone">&nbsp;</span></a></li>
                        <li><a href="#" class="contact-sphere circle-inline-border settings-clr"
                               title="1727032340@QQ.com"><span data-icon="contacts-letter">&nbsp;</span></a></li>
                        <li><a href="#" class="contact-sphere circle-inline-border settings-clr"
                               title="http://ss.Jeromer.zwd"><span data-icon="contacts-globus">&nbsp;</span></a></li>
                    </ul>
                </div>
                <div class="space30"></div>
                <p><a href="#" class="email-link">1727032340@QQ.com</a></p>
                <p><small>Contact Us </small></p>
                <div id="map"></div>
            </div>
        </div><!-- end of right side -->
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