package com.ers.middle;

import com.ers.Authentication;
import com.ers.beans.User;
import com.ers.beans.UserRole;
import com.ers.data.DataFacade;
import com.ers.exceptions.ExistingUserException;

import javax.naming.AuthenticationException;

/**
 * Created by d4k1d23 on 12/8/16.
 */
public class UserService {
    void insertNewUser(String username,
                       String password,
                       String first_name,
                       String last_name,
                       String email,
                       int role_id) throws ExistingUserException {
        if (userExists(username,email)) throw new ExistingUserException(
                "The user with username "+username+" and email "+email+" is already registered!");
            UserRole userRole = new DataFacade().getRole(role_id);
        password = Authentication.hash(password);
        User user = new User(1, username, password, first_name, last_name, email, userRole);
        new DataFacade().insertUser(user);
    }

    User userLogin(String username, String password) throws AuthenticationException {
        User user = new DataFacade().getUserByUsername(username);
        if(Authentication.validatePassword(password,user.getPassword()))
            return user;
        else throw new AuthenticationException("Invalid credentials!");
    }

    boolean userExists(String username, String email) {
        return new DataFacade().getUserByEmail(email) != null &&
                new DataFacade().getUserByUsername(username) != null;
    }
}
