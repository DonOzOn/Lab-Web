<%-- 
    Document   : Homepage
    Created on : Feb 11, 2020, 1:07:01 AM
    Author     : DonOzOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
        <link type="text/css" href="./css/right.css" rel="stylesheet">
        <title>Digital News</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="title">
                        ${top1.title}
                    </div>
                    <div class="image">
                        <img src="${top1.image}"/>
                    </div>
                    <div class="description">
                        ${top1.description}
                    </div>
                    <div class="information">
                        <div class="icon1"></div>
                        <div class="icon2"></div>
                         ${top1.author} ${top1.timePost}
                    </div>     
                </div>

                <div class="right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
            <jsp:include page="Footer.jsp"/>
        </div>
    </body>
</html>
