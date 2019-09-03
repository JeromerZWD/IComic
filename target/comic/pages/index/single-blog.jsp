<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/9/2
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <title>I❤Manb 爱漫吧</title>
    <meta name="keywords" content="GFX, design" />
    <meta name="description" content="GFX Design" />
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/style.css" />`
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/mycss.css">
    <!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/functions.js"></script>
    <script type="text/javascript" src="js/my.js"></script>
    <script>
        function fun5() {
            var user=$("#userSession_comment1").val();
            if (user==null||user==undefined||user==""){
                alert("请先登录!")
            }else{
                $.post("${pageContext.request.contextPath}/addComment",
                    $("#comment_user").serialize(),
                    function (data) {
                        if(data =="ok"){
                            alert("评论成功！");
                            window.location.reload();
                        }else{
                            alert("评论失败！");
                            window.location.reload();
                        }
                    });
            }
        }
    </script>
</head>
<jsp:include page="navigation.jsp"/>
<body class="blog">
<!-- HERE START PAGE HEADER DESCRIPTION -->
<div id="all_page_header">
    <div class="bg_wood_page circle-inline-border"></div>
    <div class="elastic inline-border settings-clr no-second" id="page_header">
        <!--漫画名-->
        <h1 class="over5">${chapter.comic.comicname}</h1>
        <div class="intro-description over5">
            <!--章节-->
            <p class="mytext-title">第${chapter.cnumber}话:${chapter.cname}</p>
            <!--简述-->
            <p>更新时间:${chapter.ctime}</p>
        </div>
    </div>
</div>
<!-- end of page header description -->

<!-- HERE START CONTENT -->
<div class="content elastic">
    <div class="grid-system">
        <div class="grid w870 mr60 blog-content">
            <div class="article-blog grid-system new-pic">
                <div class="grid comment-date w95">
                    <!--更新日期-->
                    <div class="circle-area circle-inline-border settings-clr no-second">

                    </div>
                    <div class="com-data">

                    </div>
                </div>
                <div class="grid article-content w775 pic-items" style="margin-bottom:0">
                    <ul class="pic-items">
                        <li class="item"><img src="/pic/chapter/${chapter.content}" alt=""></li>
                    </ul>
                </div>
            </div>

            <!--分享-->
            <div class="share-this">
                <span class="dotted-line">&nbsp;</span>
                <div class="inside-share">
                    <div class="social-info left">
                        <p class="blue settings-text">分享这章</p>
                    </div>
                    <!--判断是否关注-->
                    <div class="focus right">
                        <button type="button" class="btn btn-danger">关注漫画</button>
                    </div>
                    <div class="social-media right">
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/fb.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/twitter.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/youtube.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/deviant.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/flickr.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/delicious.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/linkedin.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/googlebuzz.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/stumbleupon.png" alt="" /></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/images/social-media/digg.png" alt="" /></a>
                    </div>
                    <div class="clear"></div>
                </div>
                <span class="dotted-line">&nbsp;</span>
            </div>

            <!--评论内容-->
            <!-- HERE START COMMENTS AREA -->

            <h1 class="title-line blue"><span class="current-bg pr5 settings-text">发送评论</span></h1>
            <div class="space30"></div>
            <form style="display: none">
                <input type="hidden" id="userSession_comment1" value="${userSession}"/>
            </form>
            <div class="contact-form">
                <form  method="post">
                    <input type="hidden" name="userid" value="${userSession.id}">
                    <input type="hidden" name="comicid" value="${chapter.comic.id}">
                    <div class="block-form">
								<textarea name="message" id="message" cols="30" rows="10"
                                          placeholder="评论..."></textarea>
                    </div>
                    <div class="block-form"><input type="button" value="发送" id="submit-form"
                                                   class="settings-clr" onclick="fun5()"/></div>
                </form>

            </div>
        </div> <!-- .comments-area end of comment area block -->
    </div>


</div>
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