package com.ers.data;

import com.ers.ServiceLocator;
import com.ers.entities.User;
import com.ers.entities.UserRole;
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
        UserRole role = new UserRole(4,"TestRole");
        User user = new User(23,"mnikolovski","skdjfsdf","Martino","Nikolovski","mnikolovski@testm.com",role);
        new UserDAO(connection).insert(user);
    }

    public void testQueryAll() throws Exception {
        List<User> users = new UserDAO(connection).queryAll();
        for (User user:users) {
            System.out.println(user);
        }
    }

    public void testQueryById() throws Exception {
        System.out.println(new UserDAO(connection).queryById(6));
        System.out.println(new UserDAO(connection).queryById(15));
    }

    public void testGetId() throws Exception {
        System.out.println(new UserDAO(connection).getId());
    }

}