<%-- 
    Document   : Quỉzessult
    Created on : Mar 28, 2020, 7:22:25 PM
    Author     : DonOzOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/common.css">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Your score: 
            <span class="bold ${className}">
                ${result} (${percent}%) - ${status}
            </span>
        </p>
        <form action="TakeQuizServlet" method="post">
            <input type="hidden" name="req" value="quizReq">
            <input id="resultText" type="hidden" name="numOfQuiz" value="1">
            <br>Take another quiz 
            <input type="submit" value="Start">
        </form>
    </body>
</html>
