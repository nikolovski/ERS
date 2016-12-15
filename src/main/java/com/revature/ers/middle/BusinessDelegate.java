package com.revature.ers.middle;

import com.revature.ers.beans.*;
import com.revature.ers.exceptions.ExistingUserException;

import javax.naming.AuthenticationException;
import java.util.List;

/**
 * Created by d4k1d23 on 12/8/16.
 */
public class BusinessDelegate {
    public User login(String username, String password) throws AuthenticationException, NullPointerException {
        return new UserService().userLogin(username, password);
    }

    public void register(String username,
                         String password,
                         String first_name,
                         String last_name,
                         String email,
                         int role_id) throws ExistingUserException {
        new UserService().insertNewUser(username, password, first_name, last_name, email, role_id);
    }
    public List<Reimbursement> pendingReimbursements(){
        return new ReimbursementService().getPending();
    }

    public List<UserRole> getRoles() {
       return new UserRoleService().getRoles();
    }

    public List<Reimbursement> approvedReimbursements(User user) {
        return new UserService().getApprovedReimbursements(user);
    }

    public List<Reimbursement> declinedReimbursements(User user) {
        return new UserService().getDeclinedReimbursements(user);
    }

    public List<Reimbursement> updateReimbursements(List<Reimbursement> updated) {
        return new ReimbursementService().updateBulk(updated);
    }

    public List<ReimbursementType> getTypes() {
        return new ReimbursementTypeService().getReimbursementTypes();
    }

    public List<Reimbursement> insertReimbursement(Reimbursement reimbursement) {
        return new ReimbursementService().insertReimbursement(reimbursement);
    }
}
