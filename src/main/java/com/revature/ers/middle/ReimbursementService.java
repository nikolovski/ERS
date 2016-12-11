package com.revature.ers.middle;

import com.revature.ers.beans.Reimbursement;
import com.revature.ers.data.DataFacade;

import java.util.List;

/**
 * Created by Martino Nikolovski on 12/8/16.
 */
class ReimbursementService {
    List<Reimbursement> getPending(){
        return new DataFacade().getAllPendingReimbursements();
    }
}
