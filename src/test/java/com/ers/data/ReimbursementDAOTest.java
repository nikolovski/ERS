package com.ers.data;

import com.ers.ServiceLocator;
import com.ers.entities.Reimbursement;
import com.ers.entities.ReimbursementStatus;
import com.ers.entities.ReimbursementType;
import com.ers.entities.User;
import junit.framework.TestCase;

import java.sql.Connection;
import java.sql.Timestamp;
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
        User author = new UserDAO(connection).queryById(4);
        User resolver = new UserDAO(connection).queryById(7);
        ReimbursementStatus status = new ReimbursementStatus(2,"Pending");
        ReimbursementType type = new ReimbursementType(3,"Food");
        Reimbursement reimbursement = new Reimbursement(213,4352.4, Timestamp.valueOf("2016-03-01 13:03:24"),
                null,"This is a description",null,author,null,status,type);
        new ReimbursementDAO(connection).insert(reimbursement);
    }

    public void testQueryAll() throws Exception {
        List<Reimbursement> reimbursements = new ReimbursementDAO(connection).queryAll();
        for (Reimbursement reimbursement:reimbursements) {
            System.out.println(reimbursement);
        }
    }

    public void testQueryByUser() throws Exception {
        User user = new User();
        user.setId(5);
        System.out.println(new ReimbursementDAO(connection).queryByUser(user,2));//Resolver
        System.out.println(new ReimbursementDAO(connection).queryByUser(user,1));//Author
    }

    public void testGetId() throws Exception {
        System.out.println(new ReimbursementDAO(connection).getId());
    }

    public void testQueryById() throws Exception{
        System.out.println(new ReimbursementDAO(connection).queryById(3));
        System.out.println(new ReimbursementDAO(connection).queryById(4));
    }

}