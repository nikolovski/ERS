<%@ page import="com.revature.ers.web.UserRoleController" %>
<%@ page import="com.revature.ers.beans.UserRole" %>
<%@ page import="java.util.List" %>

<%--The following scriplet is for getting the various user roles/positions in the company from the db--%>
<%
    List<UserRole> roles = new UserRoleController().getRoles();
    session.setAttribute("roles", roles);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ERS - Login</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'>
    <link href="css/login_style.css">

    <%--Google fonts--%>
    <link href="https://fonts.googleapis.com/css?family=Orbitron:400,700" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
            integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
            crossorigin="anonymous"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <link rel="stylesheet" href="css/login_style.css">
</head>

<body>
<div class="container-fluid">
    <%--The following JSTL is for displaying appropriate message on the login screen--%>
    <c:if test="${message != null}">
    <c:choose>
    <c:when test="${error eq true}">
    <div class="alert alert-danger" id="error"></c:when>
        <c:otherwise>
        <div class="alert alert-success" id="error"></c:otherwise>
            </c:choose>
            <strong><c:out value="${message}"/></strong>
        </div>
        <script>
            $("#error").hide().fadeIn(500).delay(3000).fadeOut(3000);
        </script>
        <% session.setAttribute("message", null); %>
        </c:if>
        <div class="row" id="title">
            <img src="images/logo.png" width="80px" height="80px" alt="ers_logo">ERSystem
        </div>
        <div id="content" class="row">
            <%--Login Form--%>
            <span class="col-xs-12 col-sm-5 col-md-5 col-lg-5 login">
            <header class="login-header"><span class="text">LOGIN</span><span class="loader"></span></header>
            <form id="login" class="login-form" action="login.do" method="post">
                <input type="text" placeholder="Username" name="username" class="login-input" required
                       autocomplete="on"/>
                <input type="password" placeholder="Password" name="password" class="login-input" required/>
                <button type="submit" class="login-btn" form="login">login</button>
            </form>
        </span>
            <span class=" col-xs-12 col-sm-2 col-md-2 col-lg-2">
            </span>
            <%--Registration Form--%>
            <span class=" col-xs-12 col-sm-5 col-md-5 col-lg-5 login">
            <header class="login-header"><span class="text">REGISTER</span><span class="loader"></span></header>
            <form id="register" class="login-form" action="register.do" method="post">
                <input type="text" placeholder="First Name" name="first_name" class="login-input register" required/>
                <input type="text" placeholder="Last Name" name="last_name" class="login-input register" required/>
                <input type="email" placeholder="Email" name="email" class="login-input register" required/>
                <input type="text" placeholder="Username" name="new_username" class="login-input register" required/>
                <input type="password" placeholder="Password" name="new_password" class="login-input register"
                       required/>
                <br>
                <span>
                    <select name="role_id" class="form-control" style="width: 13em;">
                        <%--Displaying all available roles for the registration form--%>
                        <c:forEach var="role" items="${roles}">
                            <option value="${role.id}"><c:out value="${role.role}"/></option>
                        </c:forEach>
                    </select>
                </span>
                <button type="submit" class="login-btn" form="register">register</button>
            </form>
        </span>
        </div>
    </div>
    <footer>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" align="center" style="text-align: center; padding-top: 5px">
            <img src="https://3g4d13k75x47q7v53surz1gi-wpengine.netdna-ssl.com/wp-content/themes/revature/imgs/logo.png"
                 alt="Revature logo">
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" align="center" style="margin-top: 1%;">
            <span>nikolovski.io</span>
        </div>
    </footer>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.slim.js"
        integrity="sha256-5i/mQ300M779N2OVDrl16lbohwXNUdzL/R2aVUXyXWA="
        crossorigin="anonymous"></script>
<script src="js/index.js"></script>
</html>
