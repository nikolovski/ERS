package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;


/**
 * Created by Martino Nikolovski on 12/2/16.
 */

public class User implements ResourceHelper {
    private int id;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private UserRole role;

    public User() {
    }

    /**
     * Constructor with 7 input parameters
     *
     * @param id
     * @param username
     * @param password
     * @param firstName
     * @param lastName
     * @param email
     * @param role      the role of the user such as DBA, Web Developer, Finance Manger etc.
     */
    public User(int id,
                String username,
                String password,
                String firstName,
                String lastName,
                String email,
                UserRole role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ",\n\t username='" + username + '\'' +
                ",\n\t password='" + password + '\'' +
                ",\n\t firstName='" + firstName + '\'' +
                ",\n\t lastName='" + lastName + '\'' +
                ",\n\t email='" + email + '\'' +
                ",\n\t role=" + role +
                "\n}";
    }
}
