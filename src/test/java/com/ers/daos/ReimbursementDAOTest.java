package com.ers.daos;

import com.ers.ServiceLocator;
import com.ers.entities.Reimbursement;
import junit.framework.TestCase;

import java.sql.Connection;
import java.util.List;

/**
 * Created by d4k1d23 on 12/4/16.
 */
public class ReimbursementDAOTest extends TestCase {
    Connection connection;
    public void setUp() throws Exception {
        super.setUp();
        connection = ServiceLocator.getERSDatabase().getConnection();

    }

    public void tearDown() throws Exception {

    }

    public void testInsert() throws Exception {

    }

    public void testQueryAll() throws Exception {
        List<Reimbursement> reimbursements = new ReimbursementDAO(connection).queryAll();
        for (Reimbursement reimbursement:reimbursements) {
            System.out.println(reimbursement);
        }
    }

    public void testGetId() throws Exception {
        System.out.println(new ReimbursementDAO(connection).getId());
    }

    public void testQueryById() throws Exception{
        System.out.println(new ReimbursementDAO(connection).queryById(3));
    }

}