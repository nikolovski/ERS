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
    <title>ERS - Dashboard</title>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"--%>
    <%--integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'>
    <link href="css/login_style.css">
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
        body {
            /*background-color: #333;*/
        }

        #view_receipt {
            width: 50px;
            height: 50px;
        }

        #view_receipt:hover {
            cursor: hand;
        }

        #receipt_td {
            text-align: center;
        }
    </style>
    <script>
        $(document).ready(function () {
            //Make the regular table a datatable
            $('#reimbursementTable').DataTable();

            //Open receipt file when clicked
            $("#view_receipt").click(function () {
                $("#receipt_form").submit();
            });

            //Update reimbursement statuses
            $("#submit_button").click(function () {
                if($("[name='approved']:checked").length !=0 || $("[name='declined']:checked").length!=0)
                    $("#updateReimbursements").submit();
                 else $("#close_modal").click();
            });
        });
    </script>

</head>
<body>
<c:choose>
    <c:when test="${userData.role.id eq 1}">
        <%@include file="manager_navbar.jsp" %>
    </c:when>
    <c:otherwise>
        <%@include file="employee_navbar.jsp" %>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${userData.role.id ==1}">
        <form id="updateReimbursements" action="/ers/updateReimbursements.do" method="post">
            <c:if test="${selectedTab eq 'pending'}">
                <button type="button" data-toggle="modal" data-target=".confirmation" class="btn btn-success" style="margin-bottom: 5px;">Submit
                    revisions
                </button>
            </c:if>
            <table id="reimbursementTable" class="table table-condensed table-striped table-bordered table-responsive"
                   cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>Submitted On</th>
                    <th>Submitted By</th>
                    <th>Amount</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Receipt</th>
                    <c:if test="${selectedTab eq 'pending'}">
                        <th><span class="glyphicon glyphicon-ok"></span></th>
                        <th><span class="glyphicon glyphicon-remove"></span></th>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="reimb" items="${reimbursements}">
                    <tr>
                        <td><fmt:formatDate value="${reimb.reimbSubmitted}"/></td>
                        <td><c:out value="${reimb.reimbAuthor.firstName} ${reimb.reimbAuthor.lastName}"/></td>
                        <td><fmt:formatNumber type="currency" maxFractionDigits="2" value="${reimb.reimbAmount}"/></td>
                        <td><c:out value="${reimb.reimbType.type}"/></td>
                        <td><c:out value="${reimb.reimbDescription}"/></td>
                        <td id="receipt_td">
                            <form id="receipt_form" action="get_receipt.do" method="get" target="_blank">
                                <input type="text" value="${reimbursements.indexOf(reimb)}" name="reimbId" hidden>
                                <img src="images/receipt.png" id="view_receipt">
                            </form>
                        </td>
                        <%--Display checkboxes if the pending tab is selected--%>
                        <c:if test="${selectedTab eq 'pending'}">
                            <td>
                                <input type="checkbox" onclick="toggleCheck(this,${reimb.id})" class="choice${reimb.id}"
                                       value="${reimbursements.indexOf(reimb)}" name="approved">
                            </td>
                            <td>
                                <input type="checkbox" onclick="toggleCheck(this,${reimb.id})" class="choice${reimb.id}"
                                       value="${reimbursements.indexOf(reimb)}" name="denied">
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </c:when>
    <c:otherwise>
        <table id="reimbursementTable" class="table table-condensed table-striped table-bordered table-responsive"
               cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Submitted On</th>
                <th>Status</th>
                <th>Amount</th>
                <th>Type</th>
                <th>Description</th>
                <th>Receipt</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="reimb" items="${reimbursements}">
                <tr>
                    <td><fmt:formatDate value="${reimb.reimbSubmitted}"/></td>
                    <td><c:out value="${reimb.reimbStatus.status}"/></td>
                    <td><fmt:formatNumber type="currency" maxFractionDigits="2" value="${reimb.reimbAmount}"/></td>
                    <td><c:out value="${reimb.reimbType.type}"/></td>
                    <td><c:out value="${reimb.reimbDescription}"/></td>
                    <td>
                        <form action="get_receipt.do" method="get" target="_blank">
                            <input type="text" value="${reimbursements.indexOf(reimb)}" name="reimbId" hidden>
                            <input type="submit" value="View Receipt">
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
<div class="modal fade confirmation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Confirm submission</h4>
            </div>
            <div class="modal-body">
                Are you sure you want to submit the revisions? The submission is irreversible!
            </div>
            <div class="modal-footer">
                <button id="close_modal" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="submit_button" type="button" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    /**
     * This function allows checking only one checkbox for each reimbursement
     * @param reimb_cb Approve or deny checkbox element
     * @param reimb_id The id required to refer to the specific row of choice
     */
    function toggleCheck(reimb_cb, reimb_id) {
        var reimbStatus = document.getElementsByClassName("choice" + reimb_id);
        for (var i in reimbStatus) reimbStatus[i].checked = false;
        reimb_cb.checked = true;
    }

    function submitForm() {
        document.getElementById("updateReimbursements").submit();
    }
</script>
</html>
