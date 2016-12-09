package com.revature.ers;

import junit.framework.TestCase;

/**
 * Created by d4k1d23 on 12/8/16.
 */
public class AuthenticationTest extends TestCase {
    String hashed, password;
    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {

    }

    public void testHash() throws Exception {
        password = "test123";
        hashed = Authentication.hash(password);
        System.out.println(hashed);
    }

    public void testValidatePassword() throws Exception {
        password = "test123";
        hashed = Authentication.hash(password);
        System.out.println(hashed);
        System.out.println(Authentication.validatePassword(password,hashed));
        password = "asdmfnas";
        System.out.println(Authentication.validatePassword(password,hashed));
    }

}