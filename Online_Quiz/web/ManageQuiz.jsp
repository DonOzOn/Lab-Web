<%-- 
    Document   : ManageQuiz
    Created on : Mar 28, 2020, 4:56:22 PM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/manageQuiz.css">
        <link rel="stylesheet" href="./css/common.css">
        <script src="./js/quizPage.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${totalRecord > 0}">
            <p class="num">Number of question: <span class="userName">${totalRecord}</span></p>
                <c:if test="${error != null}">
                <h3> ${error}</h3>
            </c:if>
            <c:if test="${error == null}">
                <table>
                    <colgroup>
                        <col class="labelCol">
                        <col class="fieldCol">
                        <col class="fieldAction">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>Question</th>
                            <th>Date Created</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listQuestion}" var="i" >
                            <tr >
                                <td>${i.content}</td>
                                <td style="padding-left: 1px">${i.created}</td>
                                <td><a onclick="deleteQuiz(${i.id})" >Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <ul id="pageList">
                    <c:if test="${maxPage > 1}">
                        <c:forEach begin="1" end="${maxPage}" var="i">
                            <a class="${i==index?"active":""}" href="ManageQuizServlet?index=${i}">${i}</a>
                        </c:forEach>
                    </c:if>
                </ul>
            </c:if>
        </c:if>
        <c:if test="${totalRecord <= 0}">
            <h5>No question!!</h5>
        </c:if>
    </body>
</html>
