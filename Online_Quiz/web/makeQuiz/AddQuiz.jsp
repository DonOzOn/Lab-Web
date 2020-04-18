<%-- 
    Document   : AddQuiz
    Created on : Mar 28, 2020, 7:24:58 PM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="./css/makeQuiz.css">
        <link rel="stylesheet" href="./css/common.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Quiz Page</title>
    </head>
    <body>
        <c:if test="${message != null}">
            <span class="failed">${message}</span>
        </c:if>
        <form action="MakeQuizServlet" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>Question: </td>
                        <td><textarea id="content" name="content">${content}</textarea></td>
                    </tr>
                    <tr>
                        <td>Option 1</td>
                        <td><textarea name="opt1">${opt1}</textarea></td>
                    </tr>
                    <tr>
                        <td>Option 2</td>
                        <td><textarea name="opt2" >${opt2}</textarea></td>
                    </tr>
                    <tr>
                        <td>Option 3</td>
                        <td><textarea name="opt3" >${opt3}</textarea></td>
                    </tr>
                    <tr>
                        <td>Option 4</td>
                        <td><textarea name="opt4">${opt4}</textarea></td>
                    </tr>
                    <tr>
                        <td>Answer(s)</td>
                        <td>
                            <input type="checkbox" name="ans1" ${saveAnswer[0]}> Option 1
                            <input type="checkbox" name="ans2" ${saveAnswer[1]}> Option 2
                            <input type="checkbox" name="ans3" ${saveAnswer[2]}> Option 3
                            <input type="checkbox" name="ans4" ${saveAnswer[3]}> Option 4
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Save"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
