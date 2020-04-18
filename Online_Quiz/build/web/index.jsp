<%-- 
    Document   : index
    Created on : Mar 28, 2020, 5:00:23 PM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/index.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Online</title>
    </head>
    <body>
        <div class="main-panel">
            <div class="nav-bar">
                <ul class="list">
                    <li><a href='IndexServlet'>Home</a></li>
                    <li><a href='TakeQuizServlet'>Take Quiz</a></li>
                    <li><a href='MakeQuizServlet'>Make Quiz</a></li>
                    <li><a href='ManageQuizServlet'>Manage Quiz</a></li>
                    <c:if test ="${sessionScope.user != null}">
                        <li><a href='LogoutServlet'>Logout</a></li>
                    </c:if>

                </ul>
            </div>
            <div class="main-content">
                <jsp:include page="${page}" />
            </div>
        </div>
    </body>
</html>
