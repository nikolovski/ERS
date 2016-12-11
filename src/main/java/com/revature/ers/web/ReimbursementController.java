package com.revature.ers.web;

import com.revature.ers.beans.Reimbursement;
import com.revature.ers.beans.User;
import com.revature.ers.middle.BusinessDelegate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Martino on 12/11/2016.
 */
public class ReimbursementController {
    public void pending(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Reimbursement> reimbursements = new BusinessDelegate().pendingReimbursements();
        req.getSession().setAttribute("reimbursements", reimbursements);
        req.getSession().setAttribute("selectedTab", "pending");
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    public void approved(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Reimbursement> reimbursements = new BusinessDelegate().approvedReimbursements((User) req.getSession().getAttribute("userData"));
        req.getSession().setAttribute("reimbursements", reimbursements);
        req.getSession().setAttribute("selectedTab", "approved");
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    public void declined(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Reimbursement> reimbursements = new BusinessDelegate().declinedReimbursements((User) req.getSession().getAttribute("userData"));
        req.getSession().setAttribute("reimbursements", reimbursements);
        req.getSession().setAttribute("selectedTab", "declined");
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }
}
