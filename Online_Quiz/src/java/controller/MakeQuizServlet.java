/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestionDao;
import entity.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DonOzOn
 */
public class MakeQuizServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        try {
            HttpSession session = request.getSession();

            //Check if user have already logged in or not
            String userName = (String) session.getAttribute("userName");

            //If user logged in, set filename to the required filename
            //If not, filename will be login form
            String page = "LoginForm.jsp";
            if (userName != null) {
                String userType = (String) session.getAttribute("userType").toString();
                if (userType.equals("0")) {
                    page = "ErrorPage/Denied.jsp";
                } else {
                    page = "makeQuiz/AddQuiz.jsp";
                }
            }
            //It will find page attribute in request, and include it in its predefined div
            request.setAttribute("page", page);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("./ErrorPage/Error.jsp").forward(request, response);
        }
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

        try {
            Question qm = null;
            String page = "makeQuiz/AddQuiz.jsp";
            //Get quiz data posted from makequiz.jsp...
            String answer = "";
            for (int i = 1; i <= 4; i++) {
                if (request.getParameter("ans" + i) != null) {
                    answer += String.valueOf(i);
                }
            }
            System.out.println(answer);
            Question q = new Question(-1, request.getParameter("content"), answer, new Date());
            System.out.println(q.getContent());
            q.addOption(request.getParameter(("opt1")));
            q.addOption(request.getParameter(("opt2")));
            q.addOption(request.getParameter(("opt3")));
            q.addOption(request.getParameter(("opt4")));
            request.setAttribute("content", q.getContent());
            request.setAttribute("opt1", q.getOption().get(0));
            request.setAttribute("opt2", q.getOption().get(1));
            request.setAttribute("opt3", q.getOption().get(2));
            request.setAttribute("opt4", q.getOption().get(3));
            request.setAttribute("answer", q.getAnswer());

            int error = 0;
            // validate quiz null
            if (q.getContent().equals("") || q.getContent() == null) {
                error = 1;
            } else if (q.getOption().get(0).equals("") || q.getOption().get(0) == null) {
                error = 2;
            } else if (q.getOption().get(1).equals("") || q.getOption().get(1) == null) {
                error = 3;
            } else if (q.getOption().get(2).equals("") || q.getOption().get(2) == null) {
                error = 4;
            } else if (q.getOption().get(3).equals("") || q.getOption().get(3) == null) {
                error = 5;
            } else if (q.getAnswer().equals("") || q.getAnswer() == null) {
                error = 6;
            } else if (q.getAnswer().equals("1234")) {
                error = 7;
            }

            // create quiz 
            if (error == 0) {
                QuestionDao qd = new QuestionDao();
                qd.addQueston(q);
                page = "makeQuiz/AddRessult.jsp";
            }
            
            //send message error
            if (error == 1) {
                request.setAttribute("message", "Question content cannot be empty");
            }
            if (error == 2) {
                request.setAttribute("message", "Option 1 content cannot be empty");
            }
            if (error == 3) {
                request.setAttribute("message", "Option 2 content cannot be empty");
            }
            if (error == 4) {
                request.setAttribute("message", "Option 3 content cannot be empty");
            }
            if (error == 5) {
                request.setAttribute("message", "Option 4 content cannot be empty");
            }
            if (error == 6) {
                request.setAttribute("message", "Please select answer(s)");
            }
            if (error == 7) {
                request.setAttribute("message", "Cannot select all answers");
            }

            request.setAttribute("page", page);
            String[] saveAnswer = new String[4];
            
            // send save answer to view when error existed
            if (error != 0) {
                for (int i = 0; i < q.getAnswer().length(); i++) {
                    char x = q.getAnswer().charAt(i);
                    int index = (int) x - 49;
                    saveAnswer[index] = "checked";
                }
                request.setAttribute("saveAnswer", saveAnswer);
            }
            request.getRequestDispatcher("/index.jsp").forward(request, response);

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
