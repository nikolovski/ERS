package com.revature.ers;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Created by d4k1d23 on 12/4/16.
 */
public abstract class Authentication {
    public static String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(12));
    }

    public static boolean validatePassword(String candidate, String hashed) {
        return BCrypt.checkpw(candidate, hashed);
    }
}
