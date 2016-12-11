package com.revature.ers.middle;

import com.revature.ers.beans.Reimbursement;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Martino on 12/11/2016.
 */
public class BusinessDelegateTest {
    @org.junit.Before
    public void setUp() throws Exception {

    }

    @org.junit.After
    public void tearDown() throws Exception {

    }

    @org.junit.Test
    public void login() throws Exception {

    }

    @org.junit.Test
    public void register() throws Exception {

    }

    @org.junit.Test
    public void pendingReimbursements() throws Exception {
        List<Reimbursement> reimbursements = new ReimbursementService().getPending();
        for (Reimbursement reimb:
             reimbursements) {
            System.out.println(reimb);
        }
    }

}