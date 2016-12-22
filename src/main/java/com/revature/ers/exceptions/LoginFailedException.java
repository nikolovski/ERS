package com.revature.ers.exceptions;

/**
 * Created by Martino on 12/21/2016.
 */
public class LoginFailedException extends NullPointerException {
    public LoginFailedException() {
    }

    public LoginFailedException(String s) {
        super(s);
    }
}
