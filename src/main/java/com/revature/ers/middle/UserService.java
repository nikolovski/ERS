package com.revature.ers.middle;

import com.revature.ers.Authentication;
import com.revature.ers.beans.User;
import com.revature.ers.beans.UserRole;
import com.revature.ers.data.DataFacade;
import com.revature.ers.exceptions.ExistingUserException;

import javax.naming.AuthenticationException;

/**
 * Created by Martino Nikolovski on 12/8/16.
 */
class UserService {
    void insertNewUser(String username,
                       String password,
                       String first_name,
                       String last_name,
                       String email,
                       int role_id) throws ExistingUserException {
        if (userExists(username, email)) throw new ExistingUserException(
                "The user with username " + username + " and email " + email + " is already registered!");
        UserRole userRole = new DataFacade().getRole(role_id);
        password = Authentication.hash(password);
        User user = new User(1, username, password, first_name, last_name, email, userRole);
        new DataFacade().insertUser(user);
    }

    User userLogin(String username, String password) throws AuthenticationException, NullPointerException {
        User user = new DataFacade().getUserByUsername(username);
        if (Authentication.validatePassword(password, user.getPassword()))
            return user;
        else throw new AuthenticationException("Invalid credentials!");

    }

    boolean userExists(String username, String email) {
        return new DataFacade().getUserByEmail(email) != null &&
                new DataFacade().getUserByUsername(username) != null;
    }
}
