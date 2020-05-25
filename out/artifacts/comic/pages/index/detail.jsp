<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/9/2
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        function fun4() {
            var user=$("#userSession_comment").val();
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
        function cancel() {
                $.post("${pageContext.request.contextPath}/removeFavorite",
                    $("#add_favorite").serialize(),
                    function (data) {
                        if(data =="ok"){
                            alert("取消成功！");
                            window.location.reload();
                        }else{
                            alert("取消失败！");
                            window.location.reload();
                        }
                    });
            }
        function favorite() {
            var user=$("#userSession_comment").val();
            if (user==null||user==undefined||user==""){
                alert("请先登录!")
            }else{
                $.post("${pageContext.request.contextPath}/addFavorite",
                    $("#add_favorite").serialize(),
                    function (data) {
                        if(data =="ok"){
                            alert("收藏成功！");
                            window.location.reload();
                        }else{
                            alert("收藏失败！");
                            window.location.reload();
                        }
                    });
            }
        }
    </script>
</head>
<body class="detail">
<jsp:include page="navigation.jsp"/>
<!-- 漫画目录头部标题 -->
<div id="detail">
    <div class="bg-wood circle-inline-border"></div>
    <div class="elastic">
        <div id="item-info">
            <!-- 漫画图片 -->
            <div class="icon">
                <img  src="/pic/${comic.photopath}" alt="">
            </div>
            <div class="more-info">
                <h1 class="mytext-title2">${comic.comicname}</h1>
                <div class="focus right">
                    <c:if test="${isFavorite}" var="isFavorite" scope="request">
                        <button type="button" class="btn btn-danger" onclick="cancel()">取消收藏</button>
                    </c:if>
                    <c:if test="${!isFavorite}" var="isFavorite" scope="request">
                        <button type="button" class="btn btn-primary" onclick="favorite()">收藏漫画</button>
                    </c:if>
                    <button type="button" class="btn btn-success">分享漫画</button>
                </div>
                <h4 class="mytext-p3">作者：${comic.author}</h4>
                <span class="mytext-p2 left f2">状态：${comic.ccode}</span>
                <span class="mytext-p2 left f2">更新时间：${comic.updatetime}</span>
                <br><br>
                <h4 class="mytext-p3">简介：</h4>
                <p class="synopsis mytext-p3">
                    ${comic.introduction}
                </p>
            </div>
        </div>
    </div>
</div>

<div id="catalog">
    <div class="elastic">

        <!-- 左边章节信息 -->
        <div class="w870 left catalog-info">
            <div class="catalog-info-contant">
                <c:forEach items="${chapterList}" var="chapter">
                <a href="${pageContext.request.contextPath}/getSingle?comicid=${chapter.comicid}&cnumber=${chapter.cnumber}"><span class="catalog-item mytext-p3-indent left f4">第${chapter.cnumber}话：${chapter.cname}</span></a>
                </c:forEach>
                <div class="clearfix"></div>
                <a href="#"><p class="center"><span class="show-all mytext-title2">显示全部</span></p></a>
            </div>
            <div class="clearfix"></div>
            <h1 class="title-line blue settings-text"><span class="current-bg pr5">相似推荐</span>
                <a class="reset" href="${pageContext.request.contextPath}/getDetail?pn=${like.pageNum+1}&id=${comic.id}"><small class="current-bg right">换一批 </small></a>
            </h1>
            <div class="projects-band-nohidden">
                <ul class="likes">
                    <c:forEach items="${like.list}" var="comic">
                    <li><a href="${pageContext.request.contextPath}/getDetail?id=${comic.id}" class="inline-border"><img src="/pic/${comic.photopath}" alt=""/></a>
                        <div class="info">
                            <a href="${pageContext.request.contextPath}/getDetail?id=${comic.id}" class="description center">
                                <h4 class="title mytext-title" style="font-size: 15px">${comic.comicname}</h4>
                            </a>
                            <p class="author center mytext-p">【${comic.author}】</p>
                            <p class="type center mytext-p">${comic.comicListsString}</p>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- new item新作推送 -->

            <h1 class="title-line blue"><span class="current-bg pr5 settings-text">漫画评论</span></h1>
            <div class="comments-area">
                <c:forEach items="${commentList}" var="coment" end="4" begin="0" varStatus="i">
                <div class="comments-block">
                    <!--用户名-->
                    <h3 class="com-author">@by:${coment.user.username}</h3>
                    <!--评论时间-->
                    <p class="com-text mytext-p3">
                        ${coment.message}
                    </p>
                    <small>${coment.ctime} - <a href="#" class="blue reply-button">回复</a></small>
                </div>
                </c:forEach>
                <div class="space30"></div>
                <h1 class="title-line blue"><span class="current-bg pr5 settings-text">发送评论</span></h1>
                <div class="space30"></div>
                <form style="display: none">
                    <input type="hidden" id="userSession_comment" value="${userSession}"/>
                </form>
                <div class="contact-form">
                    <form  method="post" id="comment_user">
                        <input type="hidden" name="userid" value="${userSession.id}">
                        <input type="hidden" name="comicid" value="${comic.id}">
                        <div class="block-form">
									<textarea name="message" id="message" cols="30" rows="10"
                                              placeholder="评论..."></textarea>
                        </div>
                        <div class="block-form"><input type="button" value="发送" id="submit-form"
                                                       class="settings-clr" onclick="fun4()"/></div>
                    </form>
                </div>
            </div> <!-- .comments-area end of comment area block -->
        </div>
        <!-- 右边排行信息 -->
        <div class="w350 right ranks">
            <div class="rank1">
                <ul class="nav nav-stacked">
                    <span class="mytext-title2-ml">国漫热门排行</span>
                    <c:forEach items="${guo}" var="comic" begin="0" end="4">
                    <li class="rank-items"><a href="${pageContext.request.contextPath}/getDetail?id=${comic.id}">
                        <img src="/pic/${comic.photopath}" style="height:118px;width: 100px"  class="rank-ican left">
                        <div class="rank-info right">
                            <div class="left">
                                <h4 class="title mytext-title">${comic.comicname}</h4>
                                <p class="mytext-p">${comic.introduction}</p>
                                <h4 class="mytext-p3">评分：${comic.score}</h4>
                            </div>
                        </div>
                    </a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="rank2">
                <ul class="nav nav-stacked">
                    <span class="mytext-title2-ml">日漫热门排行</span>
                    <c:forEach items="${ri}" var="comic" begin="0" end="4">
                    <li class="rank-items"><a href="${pageContext.request.contextPath}/getDetail?id=${comic.id}">
                        <img src="/pic/${comic.photopath}" style="height:118px;width: 100px"  class="rank-ican left">
                        <div class="rank-info right">
                            <div class="left">
                                <h4 class="title mytext-title">${comic.comicname}</h4>
                                <p class="mytext-p">${comic.introduction}</p>
                                <h4 class="mytext-p3">评分：${comic.score}</h4>
                            </div>
                        </div>
                    </a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="rank3">
                <ul class="nav nav-stacked">
                    <span class="mytext-title2-ml">欧美热门排行</span>
                    <c:forEach items="${ou}" var="comic" begin="0" end="4">
                    <li class="rank-items"><a href="${pageContext.request.contextPath}/getDetail?id=${comic.id}">
                        <img src="/pic/${comic.photopath}" style="height:118px;width: 100px"  class="rank-ican left">
                        <div class="rank-info right">
                            <div class="left">
                                <h4 class="title mytext-title">${comic.comicname}</h4>
                                <p class="mytext-p">${comic.introduction}</p>
                                <h4 class="mytext-p3">评分：${comic.score}</h4>
                            </div>
                        </div>
                    </a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<form  method="post" id="add_favorite">
    <input type="hidden" name="userId" value="${userSession.id}">
    <input type="hidden" name="comicId" value="${comic.id}">
</form>
<div class="clear"></div>
<!-- 页脚 -->
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
                <p>&copy; Copyright &copy; 2013.Company name All rights reserved.</p>
            </div>
            <div class="right area2">

            </div>
            <div class="clear"></div>
        </div>
    </div> <!-- end of elastic -->
</div><!-- #footer -->

</body>
</html>