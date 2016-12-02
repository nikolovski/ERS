package com.ers.entities;

import com.ers.exceptions.StringLengthException;

import java.util.ResourceBundle;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class UserRole {
    private int userRoleID;
    private String role;
    private ResourceBundle constants = ResourceBundle.getBundle("constants");

    public UserRole(int userRoleID, String role) {
        this.userRoleID = userRoleID;
        this.role = role.length()>0 && role.length()<=Integer.parseInt(constants.getString("userRole.role.length"))? role :null;
    }

    public int getUserRoleID() {
        return userRoleID;
    }

    public void setUserRoleID(int userRoleID) {
        this.userRoleID = userRoleID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) throws StringLengthException{
        if(role.length()>0 && role.length()<=Integer.parseInt(constants.getString("userRole.role.length")))
            this.role = role;
        else throw new StringLengthException();
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "userRoleID=" + userRoleID +
                ", role='" + role + '\'' +
                '}';
    }
}
