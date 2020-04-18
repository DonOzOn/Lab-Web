<%-- 
    Document   : RegisterForm
    Created on : Mar 28, 2020, 4:54:56 PM
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
        <title>Register Page</title>
    </head>
    <body>
        <h4 id="loginFornTitle">Registration form</h4>
        <c:if test="${message != null}">
            <p class="${messageClass}">${message}</p>
        </c:if>
        <form action="#" method="post">
            <input type="hidden" name="request" value="register">
            <table>
                <tbody>
                    <tr>
                        <td>User Name: </td>
                        <td><input type="text" value="${savedUserName}" name="username"></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <select name='type' value="${savedType}">
                                <c:if test="${savedType == 1}">
                                    <option value='0'>Student</option>
                                     <option value='1'selected>Teacher</option>
                                </c:if>
                                <c:if test="${savedType == 0}">
                                      <option value='0' selected>Student</option>
                                    <option value='1'>Teacher</option>
                                </c:if>
                                <c:if test="${savedType == null}">
                                    <option value='0' >Student</option>
                                    <option value='1'>Teacher</option>
                                </c:if>      

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="email" value="${savedEmail}" name='email'></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Register"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
