package com.ers.entities;

import com.ers.ResourceHelper;
import com.ers.exceptions.StringLengthException;


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
     * @throws StringLengthException if any of the input values violates the length restriction
     */
    public User(int id,
                String username,
                String password,
                String firstName,
                String lastName,
                String email,
                UserRole role) throws StringLengthException {
        this.id = id;
        setUsername(username);
        setPassword(password);
        setFirstName(firstName);
        setLastName(lastName);
        setEmail(email);
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
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                '}';
    }
}
