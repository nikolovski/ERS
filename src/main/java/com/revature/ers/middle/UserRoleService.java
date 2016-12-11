package com.revature.ers.middle;

import com.revature.ers.beans.UserRole;
import com.revature.ers.data.DataFacade;

import java.util.List;

/**
 * Created by Martino on 12/11/2016.
 */
public class UserRoleService {

    public List<UserRole> getRoles() {
        return new DataFacade().getAllRoles();
    }
}
