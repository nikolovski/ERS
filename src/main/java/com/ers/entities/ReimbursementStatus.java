package com.ers.entities;

import com.ers.exceptions.StringLengthException;

import java.util.ResourceBundle;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class ReimbursementStatus {
    private int statusId;
    private String status;
    private ResourceBundle constants = java.util.ResourceBundle.getBundle("constants");

    public ReimbursementStatus(int statusId, String status) {
        this.statusId = statusId;
        this.status = status.length()>0 && status.length()<=Integer.parseInt(constants.getString("reimbursementStatus.status.length"))?
                status:null;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) throws StringLengthException {
        if(status.length()>0 && status.length()<=Integer.parseInt(constants.getString("reimbursementStatus.status.length")))
            this.status = status;
        else throw new StringLengthException();
    }

    @Override
    public String toString() {
        return "ReimbursementStatus{" +
                "statusId=" + statusId +
                ", status='" + status + '\'' +
                '}';
    }

}
