<%-- 
    Document   : HomePage
    Created on : Mar 13, 2020, 8:25:40 AM
    Author     : DonOzOn
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/home.css" rel="stylesheet" type="text/css">
        <title>Galery</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <h3>${galery.name}</h3>
                    </div>
                    <!--show error here-->
                    <c:if test="${error != null}">
                        <h3 style="margin-bottom: 700px"> ${error}</h3>
                    </c:if>
                    <!--show gallery-->
                    <c:if test="${error == null}">
                        <!--top 1 image of gallery-->
                        <c:if test="${top1Galery.image_url != null && totalRecord > 0 }">
                            <div class="imageGaler">
                                <img src="${top1Galery.image_url}" alt="First">
                            </div>
                        </c:if>
                        <!--other picture of gallery with paging-->
                        <div class="contentGalery">
                            <c:if test="${error == null}">
                                <ul >
                                    <c:if test="${index <= maxPage}">
                                        <c:forEach items="${listImage}" var="i" varStatus="loop">
                                            <li class="span4">
                                                <a href="GaLeryServlet?galeryID=${galeryID}&index=${index}&imgID=${i.id}"><img src="${i.image_url}"></a>
                                                <div class="bottom"></div>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </c:if>   
                            <!--paging gallery-->
                            <div class="paging">
                                <c:if test="${maxPage > 1}">
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                        <a class="${i==index?"active":""}" href="GaLeryServlet?galeryID=${galeryID}&index=${i}">${i}</a>
                                        <c:set var="index" value="${index}" />
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>

    </body>
</html>
