package com.ers.entities;

import com.ers.exceptions.StringLengthException;

import java.util.ResourceBundle;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class ReimbursementType {

    private int typeId;
    private String type;
    private ResourceBundle constants = ResourceBundle.getBundle("constants");

    public ReimbursementType(int typeId, String type) {
        this.typeId = typeId;
        this.type = type.length()>0 && type.length()<=Integer.parseInt(constants.getString("reimbursementType.type.length"))?
                type:null;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) throws StringLengthException {
        if(type.length()>0 && type.length()<=Integer.parseInt(constants.getString("reimbursementType.type.length")))
            this.type = type;
        else throw new StringLengthException();
    }

    @Override
    public String toString() {
        return "ReimbursementType{" +
                "typeId=" + typeId +
                ", type='" + type + '\'' +
                '}';
    }
}
