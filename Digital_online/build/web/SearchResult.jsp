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
        <title>Search</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <c:if test="${error != null}">
                        <h3> ${error}</h3>
                    </c:if>
                    <c:if test="${error == null}">

                        <c:if test="${index > maxPage}">
                            <h3> Not found this page!!!</h3>
                        </c:if>
                        <c:if test="${index <= maxPage}">
                            <c:if test="${totalRecord > 1}">
                                <div class="numResult"> Có ${totalRecord} kết quả được tìm thấy</div>
                            </c:if>
                            <c:forEach items="${listSearch}" var="i" >
                                <div class="content">
                                    <div class="title">
                                        <a href="DetailServlet?id=${i.id}">${i.title}</a>
                                    </div>
                                    <img src="${i.image}"/>
                                    <div class="shortDes">
                                        ${i.shortDes}
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="paging">
                                <c:if test="${maxPage < 1}">
                                    <h3>Not Found "${txtSearch}" !!</h3>
                                </c:if>
                                <c:if test="${maxPage > 1}">
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                        <a class="${i==index?"active":""}" href="SearchServler?index=${i}&txtSearch=${txtSearch}">${i}</a>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </c:if>
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
