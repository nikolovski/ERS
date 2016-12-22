<%--
  Created by IntelliJ IDEA.
  User: d4k1d23
  Date: 12/13/16
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="new_reimb" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">Submit Request</h4>
            </div>
            <div class="modal-body">
                <form id="new_reimbursement" action="/ers/new_reimbursement.do" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                <select class="form-control" name="type">
                                    <c:forEach var="type" items="${reimbTypes}">
                                        <option value="${type.id}">${type.type}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-usd"></span></div>
                                <input type="number" step="any" name="amount" class="form-control" placeholder="Amount" required>
                            </div>
                        </div>
                    </div>
                    <br>
                    <textarea name="description" class="form-control" rows="5" required></textarea>
                    <br>
                    <div class="form-group">
                        <label for="receipt">Upload Receipt</label>
                        <input type="file" name="receipt" id="receipt" maxlength="5120" required>
                        <p class="help-block">Max file size: 5MB</p>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" form="new_reimbursement">Submit</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->