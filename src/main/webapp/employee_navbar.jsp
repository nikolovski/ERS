<%--
  Created by IntelliJ IDEA.
  User: Martino
  Date: 12/11/2016
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">ERS</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#" data-toggle="modal" data-target="#new_reimb">New Reimbursement <span class="glyphicon glyphicon-plus"></span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/ers/logout.do">LogOut</a></li>
            </ul>
        </div>
    </div>
    <%@include file="new_reimb_modal.jsp"%>
</nav>
