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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DonOzOn
 */
public class ManageQuizServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

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
            String userName = (String) session.getAttribute("user");
            //If user logged in, set filename to the required filename
            //If not, filename will be login form
            String page = "LoginForm.jsp";
            if (userName != null) {
                String userType = (String) session.getAttribute("userType").toString();
                if (userType.equals("0")) {
                    page = "ErrorPage/Denied.jsp";
                } else {
                    page = "ManageQuiz.jsp";
                    QuestionDao qd = new QuestionDao();
                    String req = (String) request.getParameter("del");
                    //delete quiz
                    if (req != null) {
                        //check id of quiz
                        try {
                            int id = Integer.parseInt(req);
                            qd.deleteQueston(id);
                        } catch (Exception ex) {
                            request.setAttribute("error", "This quiz is invalid!!");
                        }

                    }
                    int pageSize = 5;
                    String pageIndex = request.getParameter("index");
                    int index = 0;
                    //check index page
                    if (pageIndex != null) {
                        try {
                            index = Integer.parseInt(pageIndex);
                        } catch (Exception e) {
                            request.setAttribute("error", "This page is invalid!!");
                        }
                    } else {
                        index = 1;
                    }
                    //count total result 
                    int totalRecord = qd.getQuestionSize();
                    if (totalRecord <= 0) {
                        request.setAttribute("error", "No question!!");
                    }
                    int maxPage = totalRecord / pageSize;
                    if ((totalRecord % pageSize) != 0) {
                        maxPage++;
                    }
                    if (index > maxPage || index < 0) {
                        request.setAttribute("error", "This page is invalid!!");
                    }

                    //get list galery with paging 
                    List<Question> questionList = qd.getQuestionsInRange(index, pageSize);
                    request.setAttribute("listQuestion", questionList);
                    request.setAttribute("index", index);
                    request.setAttribute("maxPage", maxPage);
                    request.setAttribute("totalRecord", totalRecord);
                }
            }
            //It will find page attribute in request, and include it in its predefined div
            request.setAttribute("page", page);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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
        processRequest(request, response);
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
