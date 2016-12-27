package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;

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
    public ReimbursementStatus(int id, String status){
        this.id = id;
        this.status = status;
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

    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return "ReimbursementStatus{" +
                "id=" + id +
                ", status='" + status + '\'' +
                '}';
    }

}
