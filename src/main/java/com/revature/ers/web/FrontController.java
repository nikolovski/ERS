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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        UserController userController = new UserController();
        switch (requestURI){
            case "/ERS/login.do":
                userController.login(req,resp);
                break;
            case "/ERS/register.do":
                userController.register(req,resp);
                break;
            default:
                resp.setStatus(404);
        }
    }
}
