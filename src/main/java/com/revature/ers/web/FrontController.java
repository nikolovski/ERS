package com.revature.ers.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by d4k1d23 on 12/8/16.
 */
@WebServlet(urlPatterns = "*.do")
public class FrontController extends HttpServlet {

    @Override
    public void init() throws ServletException {
//        this.getServletConfig().getServletContext().setAttribute("roles",
//                new UserRoleController().getRoles());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        switch (req.getRequestURI()){
            case "/ers/pending.do":
                new ReimbursementController().pending(req,resp);
                break;
            case "/ers/approved.do":
                new ReimbursementController().approved(req,resp);
                break;
            case "/ers/declined.do":
                new ReimbursementController().declined(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        switch (req.getRequestURI()){
            case "/ers/login.do":
                new UserController().login(req,resp);
                break;
            case "/ers/register.do":
                new UserController().register(req,resp);
                break;
            case "/ers/updateReimbursements.do":
                new ReimbursementController().updateReimbursements(req,resp);
                break;
            default:
                resp.setStatus(404);
        }
    }
}
