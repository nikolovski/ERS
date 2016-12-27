package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;

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
     */
    public UserRole(int id, String role) {
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

    public void setRole(String role){ this.role = role; }

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", role='" + role + '\'' +
                '}';
    }
}
