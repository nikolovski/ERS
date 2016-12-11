package com.revature.ers.data;

import com.revature.ers.beans.Reimbursement;
import com.revature.ers.beans.User;
import com.revature.ers.beans.UserRole;
import junit.framework.TestCase;

import java.util.List;

/**
 * Created by d4k1d23 on 12/8/16.
 */
public class DataFacadeTest extends TestCase {
    public void setUp() throws Exception {
        super.setUp();

    }

    public void tearDown() throws Exception {

    }

    public void testInsertReimbursement() throws Exception {

    }
    public void testGetAllReimbursements() throws Exception {
        List<Reimbursement> reimbursements = new DataFacade().getAllReimbursements();
        System.out.println(reimbursements);
        for (Reimbursement reimbursement : reimbursements
                ) {
            System.out.println(reimbursement);
        }
    }

    public void testGetAllReimbursementsFromAuthor() throws Exception {

    }

    public void testGetAllReimbursementsFromResolver() throws Exception {

    }

    public void testGetReimbursementById() throws Exception {

    }

    public void testApproveReimbursement() throws Exception {

    }

    public void testDeclineReimbursement() throws Exception {

    }

    public void testGetAllPendingReimbursements() throws Exception {
        List<Reimbursement> reimbursements = new DataFacade().getAllPendingReimbursements();
        System.out.println(reimbursements);
        for (Reimbursement reimbursement : reimbursements
                ) {
            System.out.println(reimbursement);
        }
    }

    public void testInsertUser() throws Exception {

    }

    public void testGetUser() throws Exception {
        System.out.println(new DataFacade().getUserByUsername("bclarkm"));
    }

    public void testGetRoles() throws Exception {
        List<UserRole> roles = new DataFacade().getAllRoles();
        for (UserRole role : roles
                ) {
            System.out.println(role);
        }
    }

    public void testGetRole() throws Exception {
        System.out.println(new DataFacade().getRole(3));
    }

    public void testGetAllUsers() throws Exception {
        List<User> users = new DataFacade().getAllUsers();
        for (User user : users
                ) {
            System.out.println(user);
        }
    }
    public void testGetAllApprovedReimbursements() throws Exception{
        User user = new User();
        user.setId(3);
        List<Reimbursement> reimbursements = new DataFacade().getAllApprovedReimbursements(user);
        for (Reimbursement reimb:
             reimbursements) {
            System.out.println(reimb);
        }
    }
}