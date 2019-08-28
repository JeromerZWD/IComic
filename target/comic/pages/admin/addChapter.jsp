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
            margin-right: 140px;
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
<%
    int comicid=Integer.parseInt(request.getParameter("comicid"));
%>
<form name="tijiao" method="post" action="${pageContext.request.contextPath}/addChapter" enctype="multipart/form-data">
    <div class="left"></div>
    <div class="pg_body">
        <div class="menu">漫画id:</div>
        <div class="kong">
            <input id="text1" type="text" name="comicid" value="<%=comicid%>" readonly="readonly">
        </div>
        <div class="menu">章节数:</div>
        <div class="kong">
            <input id="i2" type="text" name="cnumber" placeholder="请输入章节数">
        </div>
        <div class="menu">章节名:</div>
        <div class="kong" style="width:200px;">
            <input id="i4" type="text" name="cname" placeholder="请输入章节名">
        </div>
        <div class="menu">章节内容:</div>
        <div class="kong">
            <input type="file" name="file" value="选择内容" accept="image/*">
        </div>
        </div>
    <br>
    <div class="can">
        <input id="i111" type="submit" value="添  加">
        <input id="i222" type="reset" value="取  消">
    </div>
</form>
</body>
</html>
