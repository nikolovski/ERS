package com.revature.ers.web;


import com.revature.ers.beans.Reimbursement;
import com.revature.ers.beans.User;
import com.revature.ers.exceptions.ExistingUserException;
import com.revature.ers.middle.BusinessDelegate;

import javax.naming.AuthenticationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/8/16.
 */
class UserController {
    void login (HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException{
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            User user = new BusinessDelegate().login(username,password);
            user.setPassword(null);
            req.getSession().setAttribute("userData",user);
            if(user.getRole().getId()==1){
                List<Reimbursement> pending = new BusinessDelegate().pendingReimbursements();
                req.getSession().setAttribute("reimbursements",pending);
            }
            else{
//                List<ReimbursementType> types = new BusinessDelegate();
            }


//            req.getSession().setAttribute("reimbTypes",);
            req.getSession().setAttribute("selectedTab", "pending");
            req.getRequestDispatcher("dashboard.jsp").forward(req,resp);
        } catch (AuthenticationException e) {
            req.setAttribute("authFailed",e.getMessage());
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        } catch (NullPointerException e){
            req.setAttribute("authFailed",e.getMessage());
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }
    }

    void register(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException{
        String username = req.getParameter("new_username");
        String password = req.getParameter("new_password");
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String email = req.getParameter("email");
        int role_id = Integer.parseInt(req.getParameter("role_id"));
        try {
            new BusinessDelegate().register(username,password,first_name,last_name,email,role_id);
            req.setAttribute("registerSuccess","Successfully registered!");
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        } catch (ExistingUserException e) {
            req.setAttribute("registerFailed",e.getMessage());
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }
    }
}
