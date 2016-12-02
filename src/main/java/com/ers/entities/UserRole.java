package com.ers.entities;

import com.ers.exceptions.StringLengthException;

import java.util.ResourceBundle;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class UserRole {
    private int userRoleID;
    private String role;

    public UserRole() {}

    public UserRole(int userRoleID, String role) throws StringLengthException {
        this.userRoleID = userRoleID;
        if(validateRole(role)) this.role = role;
        else throw new StringLengthException();
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
        if(validateRole(role)) this.role = role;
        else throw new StringLengthException();
    }

    private boolean validateRole(String role){
        if(role==null || role.length()==0) return false;
        ResourceBundle constants = ResourceBundle.getBundle("constants");
        int length = Integer.parseInt(constants.getString("userRole.role.length"));
        return  role.length()<=length? true:false;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "userRoleID=" + userRoleID +
                ", role='" + role + '\'' +
                '}';
    }
}
