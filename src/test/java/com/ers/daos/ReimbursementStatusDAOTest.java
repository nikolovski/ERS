package com.ers.daos;

import com.ers.ServiceLocator;
import junit.framework.TestCase;

import java.sql.Connection;

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

    }

    public void testQueryAll() throws Exception {

    }

    public void testQueryById() throws Exception {

    }

    public void testGetId() throws Exception {
        System.out.println(new ReimbursementStatusDAO(connection).queryById(3));
    }

}