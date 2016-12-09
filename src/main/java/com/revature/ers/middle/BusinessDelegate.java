package com.revature.ers.middle;

import com.revature.ers.beans.User;
import com.revature.ers.exceptions.ExistingUserException;

import javax.naming.AuthenticationException;

/**
 * Created by d4k1d23 on 12/8/16.
 */
public class BusinessDelegate {
    public User login(String username, String password) throws AuthenticationException, NullPointerException {
        return new UserService().userLogin(username, password);
    }

    public void register(String username,
                         String password,
                         String first_name,
                         String last_name,
                         String email,
                         int role_id) throws ExistingUserException {
        new UserService().insertNewUser(username, password, first_name, last_name, email, role_id);
    }
}
