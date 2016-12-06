package com.ers.daos;

import com.ers.ServiceLocator;
import com.ers.entities.User;
import junit.framework.TestCase;

import java.sql.Connection;
import java.util.List;

/**
 * Created by d4k1d23 on 12/4/16.
 */
public class UserDAOTest extends TestCase {
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
        List<User> users = new UserDAO(connection).queryAll();
        for (User user:users) {
            System.out.println(user);
        }
    }

    public void testQueryById() throws Exception {

    }

    public void testGetId() throws Exception {

    }

}