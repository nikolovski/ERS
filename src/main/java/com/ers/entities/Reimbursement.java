package com.ers.entities;

import com.ers.Helper;
import com.ers.exceptions.StringLengthException;

import java.io.File;
import java.util.Date;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class Reimbursement implements Helper{
    private int reimbId;
    private double reimbAmount;
    private Date reimbSubmitted;
    private Date reimbResolved;
    private String reimbDescription;
    private File reimbReceipt;
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
                         Date reimbSubmitted,
                         Date reimbResolved,
                         String reimbDescription,
                         File reimbReceipt,
                         User reimbAuthor,
                         User reimbResolver,
                         ReimbursementStatus reimbStatus,
                         ReimbursementType reimbType) throws StringLengthException {
        this.reimbId = reimbId;
        this.reimbAmount = reimbAmount;
        this.reimbSubmitted = reimbSubmitted;
        this.reimbResolved = reimbResolved;
        if(validateDescriptionLength(reimbDescription))
            this.reimbDescription = reimbDescription;
        else throw new StringLengthException();
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

    public Date getReimbSubmitted() {
        return reimbSubmitted;
    }

    public void setReimbSubmitted(Date reimbSubmitted) {
        this.reimbSubmitted = reimbSubmitted;
    }

    public Date getReimbResolved() {
        return reimbResolved;
    }

    public void setReimbResolved(Date reimbResolved) {
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

    public File getReimbReceipt() {
        return reimbReceipt;
    }

    public void setReimbReceipt(File reimbReceipt) {
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


    /**
     * Validation for the description length
     * @param reimbDescription
     * @return true if the validation is successful
     */
    private boolean validateDescriptionLength(String reimbDescription){
        if(reimbDescription==null || reimbDescription.length()==0) return false;
        int length = Integer.parseInt(constants.getString("reimbursement.description.lengths"));
        return  reimbDescription.length()<=length? true:false;
    }
}
