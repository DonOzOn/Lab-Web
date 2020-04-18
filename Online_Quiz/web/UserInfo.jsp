<%-- 
    Document   : userInfo
    Created on : Mar 28, 2020, 5:00:23 PM
    Author     : DonOzOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/common.css">
    </head>
    <body>
        <h1>User Information</h1>
        <div class="infor">
            Username: ${sessionScope.userName} <br>
            Email: ${sessionScope.email}<br>
            Type: ${sessionScope.userType == 1 ? "Teacher" : "Student"}<br>
        </div>
    </body>
</html>
