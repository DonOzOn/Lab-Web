<%-- 
    Document   : Homepage
    Created on : Feb 11, 2020, 1:07:01 AM
    Author     : DonOzOn
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
        <title>Digital News</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>

            <div class="main">

                <div class="left">
                    <c:if test="${error != null}">
                        <h3>${error}</h3>
                    </c:if>
                    <c:if test="${error == null}">

                        <div class="title">
                            ${one.title}
                        </div>
                        <div class="image">
                            <img src="${one.image}"/>
                        </div>
                        <div class="description">
                            ${one.description}
                        </div>
                        <div class="information">
                            <div class="icon1"></div>
                            <div class="icon2"></div>
                            ${one.author} ${one.timePost}
                        </div>     
                    </c:if>

                </div>
                <div class="right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
            <jsp:include page="Footer.jsp"/>
        </div>
    </body>
</html>
