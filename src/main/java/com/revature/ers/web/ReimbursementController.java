package com.revature.ers.web;

import com.revature.ers.beans.Reimbursement;
import com.revature.ers.beans.User;
import com.revature.ers.middle.BusinessDelegate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
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
    public void updateReimbursements(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Reimbursement> reimbursementList = (List<Reimbursement>) req.getSession().getAttribute("reimbursements");
        List<Reimbursement> updatedReimbursements = new ArrayList<>();
        User user = (User) req.getSession().getAttribute("userData");
        Reimbursement temp;
        if(req.getParameterValues("approved")!=null)
            for (String id : req.getParameterValues("approved")){
                temp = reimbursementList.get(Integer.parseInt(id));
                temp.setReimbResolver(user);
                temp.getReimbStatus().setId(1);
                temp.getReimbStatus().setStatus("Approved");
                temp.setReimbResolved(new Timestamp(System.currentTimeMillis()));
                updatedReimbursements.add(temp);
            }
        if(req.getParameterValues("denied")!=null)
            for (String id : req.getParameterValues("denied")){
                temp = reimbursementList.get(Integer.parseInt(id));
                temp.setReimbResolver(user);
                temp.getReimbStatus().setId(3);
                temp.getReimbStatus().setStatus("Denied");
                temp.setReimbResolved(new Timestamp(System.currentTimeMillis()));
                updatedReimbursements.add(temp);
            }

        req.getSession().setAttribute("reimbursements",new BusinessDelegate().updateReimbursements(updatedReimbursements));
        req.getSession().setAttribute("selectedTab", "pending");
        req.getRequestDispatcher("dashboard.jsp").forward(req,resp);
    }

    public void insertReimbursement(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //TODO finish the insertion
        resp.getWriter().println(
                req.getParameter("type") + " "+
                req.getParameter("amount") + " "+
                req.getParameter("description") + " "+
                req.getParameter("receipt")
        );
    }
}
