<%--
  Created by IntelliJ IDEA.
  User: 17270
  Date: 2019/8/24
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .pg_header{
            position: fixed;
            height: 48px;
            top: 0;
            left: 0;
            right: 0;
            background-color: #2459a2;
            line-height: 48px;
        }
        .pg_header .logo{
            margin: 0 auto;
            float: left;
            width: 200px;
            text-align: center;
            line-height: 48px;
            font-size: 28px;
            color: white;
        }
        .pg_dl{
            left: 400px;
            display: inline-block;
            padding: 0 40px;
            color: white;
        }
        .pg_header .pg_dl:hover{
            background-color: #2459fb;
            cursor: pointer;
        }
        .left{
            margin-top: 20px;
            width: 400px;
            display: inline-block;
            float: left;
        }
        .pg_body{
            margin-top: 50px;
            font-size: 18px;
            display: inline-block;
            width: 200px;
        }
        .pg_body .menu{
            width: 800px;
            padding: 15px;
            float: left;
            font-weight: bold;
        }
        input[type="text"]{
            width: 200px;
            height: 25px;
            border-radius: 6px;
        }
        input[type="password"]{
            width: 200px;
            height: 25px;
            border-radius: 6px;
        }
        input[type="button"]{
            background-color: #555555;
            border: none;
            color: white;
            padding: 12px 29px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 17px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]{
            background-color: #555555;
            border: none;
            color: white;
            padding: 12px 29px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 17px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="reset"]{
            background-color: #555555;
            border: none;
            color: white;
            padding: 12px 29px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 17px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
            margin-right: 80px;
        }
        .kong{
            margin-top: -54px;
            margin-left: 200px;
            float:left;
            padding: 15px;
        }
        .img{
            width: 50px;
            height: 40px;
        }
        .can{
            width: 100%;
            height: 50px;
            line-height: 40px;
            margin: 0 auto;
            text-align: center;
            display: inline-block;
        }
        .tian{
            color: red;
            float: right;
            font-size: 12px;
            margin-right: -120px;
            margin-top: -25px;
        }
    </style>
</head>
<body id="i88" style="margin: 0">
<form name="tijiao" method="post" action="${pageContext.request.contextPath}/addComic" enctype="multipart/form-data">
    <div class="left"></div>
    <div class="pg_body">
        <div class="menu">漫画名:</div>
        <div class="kong">
            <input id="text1" type="text" name="comicname" placeholder="请输入漫画名">
        </div>
        <div class="menu">作者:</div>
        <div class="kong">
            <input id="i2" type="text" name="author" placeholder="请输入作者">
        </div>
        <div class="menu">状态:</div>
        <div class="kong" style="width:200px;">
            连载<input type="radio" name="code" value="连载" checked="checked">
            完结<input type="radio" name="code" value="完结">
        </div>
        <div class="menu">地区:</div>
        <div class="kong">
            <select style="width: 200px;height: 30px" name="area">
                <option  value="国漫">国漫</option>
                <option  value="日漫">日漫</option>
                <option  value="欧美">欧美</option>
            </select>
        </div>
        <div class="menu">评分:</div>
        <div class="kong">
            <input id="text4" type="text" name="score" placeholder="请输入漫画评分">
        </div>
        <div class="menu">封面上传:    </div>
        <div class="kong">
            <input type="file" name="file" value="选择封面" accept="image/*">
        </div>
        <div class="menu">类型:</div>
        <div class="kong" style="width: 300px;">
            总裁 <input type="checkbox" name="clids" value="1">
            玄幻 <input type="checkbox" name="clids" value="2">
            都市 <input type="checkbox" name="clids" value="3">
            冒险 <input type="checkbox" name="clids" value="4"><br>
            仙侠 <input type="checkbox" name="clids" value="5">
            热血 <input type="checkbox" name="clids" value="6">
            恋爱 <input type="checkbox" name="clids" value="7">
            校园 <input type="checkbox" name="clids" value="8"><br>
            武侠 <input type="checkbox" name="clids" value="9">
            悬疑 <input type="checkbox" name="clids" value="10">
            推理 <input type="checkbox" name="clids" value="11">
            治愈 <input type="checkbox" name="clids" value="12"><br>
            穿越 <input type="checkbox" name="clids" value="13">
            搞笑 <input type="checkbox" name="clids" value="14">
            古风 <input type="checkbox" name="clids" value="15">
            后宫 <input type="checkbox" name="clids" value="16">
        </div>
        <div class="menu">简介:</div>
        <div class="kong">
            <textarea name="introduction" style="width: 280px;height: 40px;" placeholder="请输入漫画简介"></textarea>
        </div>
    </div>
    <div class="can">
        <input id="i111" type="submit" value="添  加">
        <input id="i222" type="reset" value="取  消">
    </div>
</form>
</body>
</html>
