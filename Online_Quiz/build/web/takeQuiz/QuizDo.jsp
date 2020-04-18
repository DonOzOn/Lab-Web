<%-- 
    Document   : quizDo
    Created on : Mar 28, 2020, 7:22:11 PM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/common.css">
        <link rel="stylesheet" type="text/css" href="./css/takeQuiz.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/quizPage.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="quizContainer">
            <c:if test="${not empty quizData}">
                <p>Welcome <span class="userName">${sessionScope.userName}</span></p>
                <h4 id="TimeSpan">Time remaining: <span id="timeDisplay">00:00</span></h4>
                <h5 id="qustionPos">Question: 0/0</h5>
                <form id="quizForm" action="TakeQuizServlet" method="post" onsubmit="submitForm()">
                    <input type="hidden" name="req" value="quizResult">
                    <input type="hidden" name="numOfQuiz" value="${quizSize}">
                    <c:forEach var="i" items="${sessionScope.quizData}" varStatus="loop">
                        <div id="q${loop.index}" class="hidden">
                            <input type="hidden" name="q${loop.index}" value="${i.id}">
                            <input type="hidden" id="invalidTime" name="invalidTime" value="1">
                                   <p>${i.content}</p>
                            <ul>
                                <c:forEach var="j" items="${i.option}" varStatus="loopInner">
                                    <input type="checkbox" name="ans${loop.index}-${loopInner.index}">
                                    <li>${j}</li><br>
                                    </c:forEach>
                            </ul>
                            <c:if test="${loop.index + 1  == quizSize }">
                                <input type="submit" value="Finish"> 
                            </c:if>
                            <button id="next" type="button" onclick="nextQuestion()">Next</button>
                        </div>
                    </c:forEach>

                </form>
            </c:if>
            <c:if test="${empty quizData}">
                <h3>No quiz found</h3>
            </c:if>
        </div>
    </body>
    <script>
        setNumOfQuiz(${quizSize});
        quizStart();
    </script>
</html>
