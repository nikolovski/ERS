package com.ers.entities;

import com.ers.ResourceHelper;
import com.ers.exceptions.StringLengthException;


/**
 * Created by Martino Nikolovski on 12/2/16.
 */

public class User implements ResourceHelper {
    private int userId;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private UserRole role;

    public User() {}

    /**
     * Constructor with 7 input parameters
     * @param userId
     * @param username
     * @param password
     * @param firstName
     * @param lastName
     * @param email
     * @param role the role of the user such as DBA, Web Developer, Finance Manger etc.
     * @throws StringLengthException if any of the input values violates the length restriction
     */
    public User(int userId,
                String username,
                String password,
                String firstName,
                String lastName,
                String email,
                UserRole role) throws StringLengthException {
        this.userId = userId;
        setUsername(username);
        setPassword(password);
        setFirstName(firstName);
        setFirstName(lastName);
        setEmail(email);
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) throws StringLengthException {
        if(validateUsernameLength(username)) this.username = username;
        else throw new StringLengthException();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws StringLengthException {
        if(validatePasswordLength(password)) this.password = password;
        else throw new StringLengthException();
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) throws StringLengthException {
        if(validateFirstNameLength(firstName)) this.firstName = firstName;
        else throw new StringLengthException();
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) throws StringLengthException {
        if(validateLastNameLength(lastName)) this.lastName = lastName;
        else throw new StringLengthException();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) throws StringLengthException {
        if(validateEmailLength(email)) this.email = email;
        else throw new StringLengthException();
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    /**
     * Validation for the username length
     * @param username
     * @return true if validation is successful
     */
    private boolean validateUsernameLength(String username){
        if(username==null || username.length()==0) return false;
        int length = Integer.parseInt(constants.getString("user.username.length"));
        return  username.length()<=length? true:false;
    }

    /**
     * Validation for the password length
     * @param username
     * @return true if validation is successful
     */
    private boolean validatePasswordLength(String username){
        if(username==null || username.length()==0) return false;
        int length = Integer.parseInt(constants.getString("user.password.length"));
        return  username.length()<=length? true:false;
    }

    /**
     * Validation for the first name length
     * @param firstName
     * @return true if validation is successful
     */
    private boolean validateFirstNameLength(String firstName){
        if(firstName==null || firstName.length()==0) return false;
        int length = Integer.parseInt(constants.getString("user.firstName.length"));
        return  firstName.length()<=length? true:false;
    }

    /**
     * Validation for the last name length
     * @param lastName
     * @return true if validation is successful
     */
    private boolean validateLastNameLength(String lastName){
        if(lastName==null || lastName.length()==0) return false;
        int length = Integer.parseInt(constants.getString("user.lastName.length"));
        return  lastName.length()<=length? true:false;
    }

    /**
     * Validation for the email length
     * @param email
     * @return true if validation is successful
     */
    private boolean validateEmailLength(String email){
        if(email==null || email.length()==0) return false;
        int length = Integer.parseInt(constants.getString("user.email.length"));
        return  email.length()<=length? true:false;
    }

}
