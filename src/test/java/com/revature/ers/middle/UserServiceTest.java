package com.revature.ers.middle;

import com.revature.ers.beans.User;
import com.revature.ers.beans.UserRole;
import com.revature.ers.exceptions.ExistingUserException;
import junit.framework.TestCase;


/**
 * Created by d4k1d23 on 12/8/16.
 */
public class UserServiceTest extends TestCase {
    public void setUp() throws Exception {
        super.setUp();

    }

    public void tearDown() throws Exception {

    }
    public void testInsertNewUser() throws ExistingUserException {

        new UserService().insertNewUser("inikolovski","shobe","Ivan",
                "Nikolovski","inikolovski@test.com",4);
    }

    public void testCheckExistingUser() throws Exception {
        UserRole role = new UserRole(10, "Civil Engineer");
        User user = new User(1, "shamilton0","LdTPHY","Steven",
                "Hamilton","shamilton0@list-manage.com",role);
        System.out.println(new UserService().userExists("shamilton0","shamilton0@list-manage.com"));
    }

    public void testTestUserLogin() throws Exception {
        System.out.println(new UserService().userLogin("inikolovski","shobe"));
    }
}