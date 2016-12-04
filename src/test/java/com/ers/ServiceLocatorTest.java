package com.ers;

import junit.framework.TestCase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by d4k1d23 on 12/3/16.
 */
public class ServiceLocatorTest extends TestCase {
    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }
    public void testGetERSDatabase() throws Exception {
        Connection connection = ServiceLocator.getERSDatabase().getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from ers_users");
        while (resultSet.next()){
            System.out.println(resultSet.getString("user_email"));
        }
    }

}