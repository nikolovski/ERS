package com.revature.ers.middle;

import com.revature.ers.beans.Reimbursement;
import com.revature.ers.beans.User;
import com.revature.ers.data.DataFacade;

import java.util.List;

/**
 * Created by Martino Nikolovski on 12/8/16.
 */
class ReimbursementService {
    List<Reimbursement> getPending(){
        return new DataFacade().getAllPendingReimbursements();
    }

    public List<Reimbursement> updateBulk(List<Reimbursement> updated) {
        return new DataFacade().updateBulk(updated);
    }

    public List<Reimbursement> insertReimbursement(Reimbursement reimbursement) {
        return new DataFacade().insertReimbursement(reimbursement);
    }

    public List<Reimbursement> getAllReimbursements(User user) {
        return new DataFacade().getAllReimbursementsFromAuthor(user);
    }
}
