<%-- 
    Document   : LoginForm
    Created on : Mar 28, 2020, 4:54:08 PM
    Author     : DonOzOn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/common.css">
        <link rel="stylesheet" href="./css/loginForm.css">
        <title>Login Page</title>
    </head>
    <body>
        <h4 id="loginFornTitle">Login Form</h4>
        <c:if test="${message != null}">
            <span class="failed">Username or password is incorrect, please try again</span>
        </c:if>

        <form action="LoginServlet" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>User Name: </td>
                        <td><input type="text" value="${sessionScope.userName}" name="username"></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Sign In">
                            <a href="RegisterServlet">Register</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
