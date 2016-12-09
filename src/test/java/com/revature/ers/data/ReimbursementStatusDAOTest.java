package com.revature.ers.data;

import com.revature.ers.ServiceLocator;
import com.revature.ers.beans.ReimbursementStatus;
import junit.framework.TestCase;

import java.sql.Connection;
import java.util.List;

/**
 * Created by d4k1d23 on 12/4/16.
 */
public class ReimbursementStatusDAOTest extends TestCase {
    Connection connection;
    public void setUp() throws Exception {
        super.setUp();
        connection = ServiceLocator.getERSDatabase().getConnection();
    }

    public void tearDown() throws Exception {

    }

    public void testInsert() throws Exception {
        ReimbursementStatus status = new ReimbursementStatus(23,"Test");
        new ReimbursementStatusDAO(connection).insert(status);

    }

    public void testQueryAll() throws Exception {
        List<ReimbursementStatus> reimbursementStatuses = new ReimbursementStatusDAO(connection).queryAll();
        for (ReimbursementStatus reimbursementStatus:reimbursementStatuses) {
            System.out.println(reimbursementStatus);
        }
    }

    public void testQueryById() throws Exception {
        System.out.println(new ReimbursementStatusDAO(connection).queryById(3));
    }

    public void testGetId() throws Exception {
        System.out.println(new ReimbursementStatusDAO(connection).getId());
    }

}