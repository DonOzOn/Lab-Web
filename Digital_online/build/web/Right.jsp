<%-- 
    Document   : Right
    Created on : Feb 17, 2020, 10:29:35 PM
    Author     : DonOzOn
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="./css/right.css" rel="stylesheet">
    </head>
    <body>
        <div class="title">
            Digital News
        </div>
        <div class="shortDes">
            ${top1.shortDes}
        </div>
        <div class="search">
            <div class="title">
                Search
            </div>
            <form action="SearchServler" method="post">
                <input class="inputTxT" type="text"  name="txtSearch" value="${txtSearch}" required>
                <input class="submitTxT" type="submit" value="Go">
            </form>
        </div>

        <div class="title">
            Last Articles
        </div>
        <c:forEach items="${top5}" var="i">
            <div class="top5">
                <a href="DetailServlet?id=${i.id}"> ${i.title}</a>
            </div>
        </c:forEach>
    </body>
</html>
