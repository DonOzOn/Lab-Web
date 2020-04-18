<%-- 
    Document   : header
    Created on : Mar 13, 2020, 9:18:13 PM
    Author     : DonOzOn
--%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/header.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="nav">
            <!--menu nav-->
            <div class= "nav-inner">
                <ul>
                    <li> <a class="${activeHome}" href="HomeServlet">My front page</a></li>
                       <c:forEach items="${top3}" var="i" varStatus="myIndex">
                       <li> <a class="${galeryID == i.ID ? activeGalery : ""}" href="GaLeryServlet?galeryID=${i.ID}">${i.name}</a> </li>
                      </c:forEach>
                    <li> <a class="${activeContact}" href="ContactServlet">Contact</a> </li>
                </ul>
            </div>
        </div>
        <div class="header">
            <div class="header-inner">
                <div class="img"> </div>
                <div class="title ">
                    PHOTOGRAPHER
                </div>
                <div class="subtitle">
                    Welcome to this website
                </div>
            </div>
        </div>
    </body>
</html>
