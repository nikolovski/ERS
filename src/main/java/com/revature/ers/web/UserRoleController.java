package com.revature.ers.web;

import com.revature.ers.beans.UserRole;
import com.revature.ers.middle.BusinessDelegate;

import java.util.List;

/**
 * Created by Martino on 12/11/2016.
 */
public class UserRoleController {
    List<UserRole> getRoles(){
        return new BusinessDelegate().getRoles();
    }
}
