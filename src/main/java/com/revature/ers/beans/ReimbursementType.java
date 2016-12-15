package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;
import com.revature.ers.exceptions.StringLengthException;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */

public class ReimbursementType implements ResourceHelper {
    private int id;
    private String type;

    public ReimbursementType() {}

    /**
     * Constructor with 2 input parameters
     * @param id the id of the type
     * @param type the name of the type
     */
    public ReimbursementType(int id, String type) {
        this.id = id;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) throws StringLengthException {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ReimbursementType{" +
                "id=" + id +
                ", type='" + type + '\'' +
                '}';
    }
}
