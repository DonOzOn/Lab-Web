<%-- 
    Document   : Error
    Created on : Feb 26, 2020, 8:32:41 AM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="content">
                <div class="main">
                    <h1>Error</h1>
                    <p>${error}</p>
                </div>
            </div>
            <jsp:include page="Right.jsp"/> 
            <jsp:include page="Footer.jsp"/>
        </div>
    </body>
</html>