package com.revature.ers.middle;

import com.revature.ers.beans.ReimbursementType;
import com.revature.ers.data.DataFacade;

import java.util.List;

/**
 * Created by d4k1d23 on 12/15/16.
 */
public class ReimbursementTypeService {
    public List<ReimbursementType> getReimbursementTypes() {
        return new DataFacade().getAllReimbursementTypes();
    }
}
