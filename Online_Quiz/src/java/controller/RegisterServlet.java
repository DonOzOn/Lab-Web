/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDao;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DonOzOn
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = "RegisterForm.jsp";
        request.setAttribute("page", page);
        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = "RegisterForm.jsp";
        String message = "";
        String messageClass = "failed";
        try {
            UserDao ud = new UserDao();
            //Get user data from request
            String userNane = request.getParameter("username");
            String password = request.getParameter("password");
            String type = request.getParameter("type");
            String email = request.getParameter("email");

            request.setAttribute("savedUserName", userNane);
            request.setAttribute("savedEmail", email);
            request.setAttribute("savedType", Integer.parseInt(type));
            User newUser = new User(-1, userNane, password, email, Integer.parseInt(type));
            //Data validation
            int errorCode = ud.validateNewUser(newUser);
            if (errorCode == 1) {
                message = "Username is already exist";
            } else if (errorCode == 2) {
                message = "Email is already exist";
            } else if (newUser.getPassword().length() < 8) {
                message = "Password must contain at least 8 character";
            } else { //If no error found, add user to database
                ud.addUser(newUser);
                message = "User registered successfully";
                messageClass = "success";
            }

            request.setAttribute("page", page);
            request.setAttribute("message", message);
            request.setAttribute("messageClass", messageClass);
            request.getRequestDispatcher("/index.jsp")
                    .forward(request, response);

        } catch (Exception ex) {
            request.getRequestDispatcher("./ErrorPage/Error.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
