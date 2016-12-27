package com.revature.ers.beans;

import com.revature.ers.ResourceHelper;

import java.io.InputStream;
import java.sql.Timestamp;

/**
 * Created by Martino Nikolovski on 12/2/16.
 */
public class Reimbursement implements ResourceHelper {

    private int id;
    private double reimbAmount;
    private Timestamp reimbSubmitted;
    private Timestamp reimbResolved;
    private String reimbDescription;
    private InputStream reimbReceipt;
    private User reimbAuthor;
    private User reimbResolver;
    private ReimbursementStatus reimbStatus;
    private ReimbursementType reimbType;

    /**
     * Constructor with 10 input parameters
     *
     * @param id
     * @param reimbAmount
     * @param reimbSubmitted
     * @param reimbResolved
     * @param reimbDescription
     * @param reimbReceipt
     * @param reimbAuthor
     * @param reimbResolver
     * @param reimbStatus
     * @param reimbType
     */
    public Reimbursement(int id,
                         double reimbAmount,
                         Timestamp reimbSubmitted,
                         Timestamp reimbResolved,
                         String reimbDescription,
                         InputStream reimbReceipt,
                         User reimbAuthor,
                         User reimbResolver,
                         ReimbursementStatus reimbStatus,
                         ReimbursementType reimbType) {
        this.id = id;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public void setReimbDescription(String reimbDescription) { this.reimbDescription = reimbDescription; }

    public InputStream getReimbReceipt() {
        return reimbReceipt;
    }

    public void setReimbReceipt(InputStream reimbReceipt) {
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
                "id=" + id +
                ",\n\treimbAmount=" + reimbAmount +
                ",\n\treimbSubmitted=" + reimbSubmitted +
                ",\n\treimbResolved=" + reimbResolved +
                ",\n\treimbDescription='" + reimbDescription + '\'' +
                ",\n\treimbReceipt=" + reimbReceipt +
                ",\n\treimbAuthor=" + reimbAuthor +
                ",\n\treimbResolver=" + reimbResolver +
                ",\n\treimbStatus=" + reimbStatus +
                ",\n\treimbType=" + reimbType +
                "\n\t}";
    }
}
