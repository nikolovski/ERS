package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;
import com.revature.ers.exceptions.StringLengthException;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */

public class UserRole implements ResourceHelper {
    private int id;
    private String role;

    public UserRole() {}

    /**
     * Constructor with 2 input parameters
     * @param id the id of the role
     * @param role the name of the role
     * @throws StringLengthException if the role length is beyond the range specified in the properties file
     */
    public UserRole(int id, String role) throws StringLengthException {
        this.id = id;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) throws StringLengthException{
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", role='" + role + '\'' +
                '}';
    }
}
