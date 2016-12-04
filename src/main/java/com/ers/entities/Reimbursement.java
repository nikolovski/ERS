package com.ers.entities;

import com.ers.ResourceHelper;
import com.ers.exceptions.StringLengthException;

import java.sql.Blob;
import java.sql.Timestamp;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class Reimbursement implements ResourceHelper {

    private int reimbId;
    private double reimbAmount;
    private Timestamp reimbSubmitted;
    private Timestamp reimbResolved;
    private String reimbDescription;
    private Blob reimbReceipt;
    private User reimbAuthor;
    private User reimbResolver;
    private ReimbursementStatus reimbStatus;
    private ReimbursementType reimbType;

    /**
     * Constructor with 10 input parameters
     * @param reimbId
     * @param reimbAmount
     * @param reimbSubmitted
     * @param reimbResolved
     * @param reimbDescription
     * @param reimbReceipt
     * @param reimbAuthor
     * @param reimbResolver
     * @param reimbStatus
     * @param reimbType
     * @throws StringLengthException if any of the input values violates the length restriction
     */
    public Reimbursement(int reimbId,
                         double reimbAmount,
                         Timestamp reimbSubmitted,
                         Timestamp reimbResolved,
                         String reimbDescription,
                         Blob reimbReceipt,
                         User reimbAuthor,
                         User reimbResolver,
                         ReimbursementStatus reimbStatus,
                         ReimbursementType reimbType) {
        this.reimbId = reimbId;
        this.reimbAmount = reimbAmount;
        this.reimbSubmitted = reimbSubmitted;
        this.reimbResolved = reimbResolved;
        this.reimbDescription = reimbDescription;
        this.reimbReceipt = reimbReceipt;
        this.reimbAuthor = reimbAuthor;
        this.reimbResolver = reimbResolver;
        this.reimbStatus = reimbStatus;
        this.reimbType = reimbType;
    }

    public int getReimbId() {
        return reimbId;
    }

    public void setReimbId(int reimbId) {
        this.reimbId = reimbId;
    }

    public double getReimbAmount() {
        return reimbAmount;
    }

    public void setReimbAmount(double reimbAmount) {
        this.reimbAmount = reimbAmount;
    }

    public Timestamp getReimbSubmitted() {
        return reimbSubmitted;
    }

    public void setReimbSubmitted(Timestamp reimbSubmitted) {
        this.reimbSubmitted = reimbSubmitted;
    }

    public Timestamp getReimbResolved() {
        return reimbResolved;
    }

    public void setReimbResolved(Timestamp reimbResolved) {
        this.reimbResolved = reimbResolved;
    }

    public String getReimbDescription() {
        return reimbDescription;
    }

    public void setReimbDescription(String reimbDescription) throws StringLengthException {
        if(validateDescriptionLength(reimbDescription))
            this.reimbDescription = reimbDescription;
        else throw new StringLengthException();
    }

    public Blob getReimbReceipt() {
        return reimbReceipt;
    }

    public void setReimbReceipt(Blob reimbReceipt) {
        this.reimbReceipt = reimbReceipt;
    }

    public User getReimbAuthor() {
        return reimbAuthor;
    }

    public void setReimbAuthor(User reimbAuthor) {
        this.reimbAuthor = reimbAuthor;
    }

    public User getReimbResolver() {
        return reimbResolver;
    }

    public void setReimbResolver(User reimbResolver) {
        this.reimbResolver = reimbResolver;
    }

    public ReimbursementStatus getReimbStatus() {
        return reimbStatus;
    }

    public void setReimbStatus(ReimbursementStatus reimbStatus) {
        this.reimbStatus = reimbStatus;
    }

    public ReimbursementType getReimbType() {
        return reimbType;
    }

    public void setReimbType(ReimbursementType reimbType) {
        this.reimbType = reimbType;
    }

    @Override
    public String toString() {
        return "Reimbursement{" +
                "reimbId=" + reimbId +
                ", reimbAmount=" + reimbAmount +
                ", reimbSubmitted=" + reimbSubmitted +
                ", reimbResolved=" + reimbResolved +
                ", reimbDescription='" + reimbDescription + '\'' +
                ", reimbReceipt=" + reimbReceipt +
                ", reimbAuthor=" + reimbAuthor +
                ", reimbResolver=" + reimbResolver +
                ", reimbStatus=" + reimbStatus +
                ", reimbType=" + reimbType +
                '}';
    }

    /**
     * Validation for the description length
     * @param reimbDescription
     * @return true if the validation is successful
     */
    private boolean validateDescriptionLength(String reimbDescription){
        if(reimbDescription==null || reimbDescription.length()==0) return false;
        int length = Integer.parseInt(constants.getString("reimbursement.description.length"));
        System.out.println(reimbDescription.length());
        return  reimbDescription.length()<=length? true:false;
    }
}
