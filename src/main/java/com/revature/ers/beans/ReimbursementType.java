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
     * @throws StringLengthException if the type length is beyond the range specified in the properties file
     */
    public ReimbursementType(int id, String type) throws StringLengthException {
        this.id = id;
        if(validateTypeLength(type)) this.type = type;
        else throw new StringLengthException();
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
        if(validateTypeLength(type)) this.type = type;
        else throw new StringLengthException();
    }

    /**
     * Method for validating the length of the type name
     * @param type String that needs to be validated
     * @return true if the string is valid
     */
    private boolean validateTypeLength(String type){
        if(type==null || type.length()==0) return false;
        int length = Integer.parseInt(constants.getString("reimbursementType.type.length"));
        return  type.length()<=length? true:false;
    }

    @Override
    public String toString() {
        return "ReimbursementType{" +
                "id=" + id +
                ", type='" + type + '\'' +
                '}';
    }
}
