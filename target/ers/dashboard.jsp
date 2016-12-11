<%--
  Created by IntelliJ IDEA.
  User: d4k1d23
  Date: 12/8/16
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"--%>
          <%--integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'>
    <link href="css/loginStyle.css">
    <%--DataTable stylesheets--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
    <%-------------------------%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
            integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
            crossorigin="anonymous"></script>
    <%--DataTable scripts--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
    <%---------------------%>

    <style>
        body{
            /*background-color: #333;*/
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );
    </script>

</head>
<body>
    <c:choose>
        <c:when test="${userData.role.id eq 1}">
            <%@include file="manager_navbar.jsp"%>
        </c:when>
        <c:otherwise>
            <h1>wuuuut</h1>
        </c:otherwise>
    </c:choose>
    <table id="example" class="table table-condensed table-striped table-bordered table-responsive" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Submitted On</th>
                <th>Submitted By</th>
                <th>Amount</th>
                <th>Type</th>
                <th>Description</th>
                <th>Receipt</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reimb" items="${reimbursements}">
                <tr>
                    <form id="approve${reimb.id}" action="/ers/approve.do">
                        <input type="text" hidden value="${reimb}" name="reimb">
                    </form>
                    <form id="decline${reimb.id}" action="/ers/decline.do">
                        <input type="text" hidden value="${reimb}" name="reimb">
                    </form>
                    <td><fmt:formatDate value="${reimb.reimbSubmitted}"/></td>
                    <td><c:out value="${reimb.reimbAuthor.firstName} ${reimb.reimbAuthor.lastName}"/></td>
                    <td><fmt:formatNumber type="currency" maxFractionDigits="2" value="${reimb.reimbAmount}"/></td>
                    <td><c:out value="${reimb.reimbType.type}"/></td>
                    <td><c:out value="${reimb.reimbDescription}"/></td>
                    <td><c:out value="${reimb.reimbReceipt}"/></td>
                    <td><button type="submit" class="btn btn-success" form="approve${reimb.id}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </button></td>
                    <td><button type="submit" class="btn btn-danger" form="decline${reimb.id}">
                        <span class="glyphicon glyphicon-remove"></span>
                    </button></td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
