package com.revature.ers;

import java.util.ResourceBundle;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public interface ResourceHelper {
    ResourceBundle constants = ResourceBundle.getBundle("constants");

    //Table names
    String reimbursementTableName = constants.getString("reimbursementTableName");
    String userTableName = constants.getString("userTableName");
    String userRoleTableName = constants.getString("userRoleTableName");
    String reimbursementStatusTableName = constants.getString("reimbursementStatusTableName");
    String reimbursementTypeTableName = constants.getString("reimbursementTypeTableName");

    //Column names
    //in reimbursements table
    String reimbursementId = constants.getString("reimbursementId");
    String reimbursementAmount = constants.getString("reimbursementAmount");
    String reimbursementSubmitted = constants.getString("reimbursementSubmitted");
    String reimbursementResolved = constants.getString("reimbursementResolved");
    String reimbursementDescription = constants.getString("reimbursementDescription");
    String reimbursementReceipt = constants.getString("reimbursementReceipt");
    String reimbursementAuthor = constants.getString("reimbursementAuthor");
    String reimbursementResolver = constants.getString("reimbursementResolver");
    String reimbStatusId = constants.getString("reimbStatusId");
    String reimbTypeId = constants.getString("reimbTypeId");

    //in users table
    String userId = constants.getString("userId");
    String userUsername = constants.getString("userUsername");
    String userPassword = constants.getString("userPassword");
    String userFirstName = constants.getString("userFirstName");
    String userLastName = constants.getString("userLastName");
    String userEmail = constants.getString("userEmail");
    String roleId = constants.getString("roleId");

    //in user type table
    String reimbursementStatusId = constants.getString("reimbursementStatusId");
    String reimbursementStatus = constants.getString("reimbursementStatus");

    //in user type table
    String reimbursementTypeId = constants.getString("reimbursementTypeId");
    String reimbursementType = constants.getString("reimbursementType");

    //in user role table
    String userRoleId = constants.getString("userRoleId");
    String userRole = constants.getString("userRole");

    /*FREQUENTLY USED QUERIES*/
    //Select all reimbursements
    String getAllReimbursements = "SELECT " +
            reimbursementId + ", " +
            reimbursementAmount + ", " +
            reimbursementSubmitted + ", " +
            reimbursementResolved + ", " +
            reimbursementDescription + ", " +
            reimbursementReceipt + ", " +
            "author." + userId + " AS author_id, " +
            "author." + userUsername + " AS author_un, " +
            "author." + userPassword + " AS author_pw, " +
            "author." + userFirstName + " AS author_fn, " +
            "author." + userLastName + " AS author_ln, " +
            "author." + userEmail + " AS author_em, " +
            "authRole." + userRoleId + " AS auth_role_id, " +
            "authRole." + userRole + " AS auth_role, " +
            "resolver." + userId + " AS resolver_id, " +
            "resolver." + userUsername + " AS resolver_un, " +
            "resolver." + userPassword + " AS resolver_pw, " +
            "resolver." + userFirstName + " AS resolver_fn, " +
            "resolver." + userLastName + " AS resolver_ln, " +
            "resolver." + userEmail + " AS resolver_em, " +
            "resRole." + userRoleId + " AS res_role_id, " +
            "resRole." + userRole + " AS res_role, " +
            "status."+reimbursementStatusId +" AS status_id, "+
            "status."+reimbursementStatus +" AS status, "+
            "type."+reimbursementTypeId +" AS type_id, "+
            "type."+reimbursementType +" AS type "+
            "FROM " + reimbursementTableName + " reimbursement" +
            " INNER JOIN " + userTableName + " author ON " + reimbursementAuthor + " = author." + userId +
            " LEFT JOIN " + userTableName + " resolver ON " + reimbursementResolver + " = resolver." + userId +
            " INNER JOIN " + reimbursementStatusTableName + " status ON reimbursement." + reimbStatusId + " = status." + reimbursementStatusId +
            " INNER JOIN " + reimbursementTypeTableName + " type ON reimbursement." + reimbTypeId + " = type." + reimbTypeId +
            " INNER JOIN " + userRoleTableName + " authRole ON authRole." + userRoleId + " = author." + roleId +
            " LEFT JOIN " + userRoleTableName + " resRole ON resRole." + userRoleId + " = resolver." + roleId;

    //Select all users
    String getAllUsers = "SELECT * FROM " + userTableName +
            " INNER JOIN " + userRoleTableName + " ON " + roleId + " = " + userRoleId;

    //Select all Reimbursement Statuses
    String getAllReimbursementStatuses = "SELECT * FROM "+reimbursementStatusTableName;

    //Select all Reimbursement Types
    String getAllReimbursementTypes= "SELECT * FROM "+reimbursementTypeTableName;

    //Select all User Roles
    String getAllUserRoles = "SELECT * FROM "+userRoleTableName;

}
