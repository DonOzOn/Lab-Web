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
        <title>My Front Page</title>
    </head>
    <body>
        <div class="container">
            <!--Header-->
            <jsp:include page="Header.jsp"/>
            <!--Main-->
            <div class="main">
                <!--left element-->
                <div class="left">
                    <div class="image">
                        <img src="${contact.image_main}" alt="First">
                    </div>
                    <div class="description">
                        ${contact.description}
                    </div>
                    <div class="content">
                        <!--show error here-->
                        <c:if test="${error != null}">
                            <h3> ${error}</h3>
                        </c:if>
                        <c:if test="${error == null}">
                            <ul >
                                <!--list gallery with paging-->
                                <c:if test="${index <= maxPage}">
                                    <c:forEach items="${listGalery}" var="i" >
                                        <li class="span4">
                                            <div class="image" >
                                                <img src="${i.image}">
                                            </div>
                                            <h4>
                                                <a href="GaLeryServlet?galeryID=${i.ID}">${i.title}</a>
                                            </h4>
                                            <p>${i.description}</p>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </c:if>
                        <!--paging gallery-->
                        <div class="paging">
                            <c:if test="${maxPage > 1}">
                                <c:forEach begin="1" end="${maxPage}" var="i">
                                    <a class="${i==index?"active":""}" href="HomeServlet?index=${i}">${i}</a>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="about">
                        <h3>About me</h3>
                    </div>
                    <div class="about-detail">
                        ${contact.about}
                    </div>
                </div>
                <!--right elenment-->
                <div class="right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
        </div>
        <!--footer page-->
        <jsp:include page="Footer.jsp"/>

    </body>
</html>
