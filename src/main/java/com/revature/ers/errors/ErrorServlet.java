package com.revature.ers.errors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by d4k1d23 on 12/20/16.
 */
@WebServlet(urlPatterns = "/error")
public class ErrorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int statusCode = (Integer) req.getAttribute("javax.servlet.error.status_code");
        req.setAttribute("status",statusCode);
        req.getRequestDispatcher("error_page.jsp").forward(req,resp);
    }
}
