<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Error <c:out value="${status}"></c:out></title>
    <style>
        body{
            background-size: 100%;
            background-repeat:no-repeat;
            background-position: center;
        }
    </style>

</head>
<body>
<c:choose>
    <c:when test="${status eq 404}">
        <style>
            body{
                background-image: url("images/404.png");
                background-color: #f06932;
            }
        </style>
    </c:when>
    <c:when test="${status eq 403}">
        <style>
            body{
                background-size: 50%;
                background-image: url("images/403.jpg");
                background-color: #89c0c7;
            }
        </style>
    </c:when>
    <c:otherwise>
        <style>
            body{
                background-size: 50%;
                background-image: url("images/other_error.jpg");
                background-color: #d0dce9;
                background-position: bottom;
            }
        </style>
    </c:otherwise>
</c:choose>
</body>
</html>
