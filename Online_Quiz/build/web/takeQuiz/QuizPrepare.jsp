<%-- 
    Document   : quizPrepare
    Created on : Mar 28, 2020, 7:21:53 PM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="./css/common.css">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Welcome <span class="userName">${sessionScope.userName}</span></p>
            <c:if test="${message != null}">
            <span class="failed">${message}</span>
        </c:if>

        <form action="TakeQuizServlet" method="post">
            <input type="hidden" name="req" value="quizDo">
            <br>Enter number of question: <br>
            <input type="number" value="${message!=null ? savedNumOfQuiz  : ""}" name="numOfQuiz">
            <input type="submit" value="Start">
        </form>
    </body>
</html>
