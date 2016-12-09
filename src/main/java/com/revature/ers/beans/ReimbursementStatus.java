package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;
import com.revature.ers.exceptions.StringLengthException;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */

public class ReimbursementStatus implements ResourceHelper {
    private int id;
    private String status;

    public ReimbursementStatus() {}

    /**
     * Constructor with 2 input parameters
     * @param id the id of the status
     * @param status the name of the status
     */
    public ReimbursementStatus(int id, String status) throws StringLengthException {
        this.id = id;
        if(validateStatusLength(status)) this.status = status;
        else throw new StringLengthException();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) throws StringLengthException {
        if(validateStatusLength(status)) this.status = status;
        else throw new StringLengthException();
    }

    /**
     * Method for validating the length of the status name
     * @param status String that needs to be validated
     * @return true if the string is valid
     */
    private boolean validateStatusLength(String status){
        if(status==null || status.length()==0) return false;
        int length = Integer.parseInt(constants.getString("reimbursementStatus.status.length"));
        return  status.length()<=length? true:false;
    }

    @Override
    public String toString() {
        return "ReimbursementStatus{" +
                "id=" + id +
                ", status='" + status + '\'' +
                '}';
    }

}
