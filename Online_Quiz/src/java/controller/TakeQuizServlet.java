/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestionDao;
import dao.QuestionHistoryDao;
import entity.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
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
public class TakeQuizServlet extends HttpServlet {

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
                session.removeAttribute("quizData");
                page = "takeQuiz/QuizPrepare.jsp";
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
        try {
            String page = "takeQuiz/QuizPrepare.jsp";
            String req = request.getParameter("req");
            // check now page is quizDo
            if (req.equals("quizDo")) {
                questionDo(request, response);
            } else if (req.equals("quizResult")) {
                questionResult(request, response);
            }
            request.setAttribute("page", page);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("./ErrorPage/Error.jsp").forward(request, response);
        }
    }

    public void questionDo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            HttpSession session = request.getSession();
            QuestionDao qd = new QuestionDao();
            String page = "takeQuiz/QuizPrepare.jsp";
            String num = request.getParameter("numOfQuiz");

            int numOfQuiz = 0;
            // check number of question null
            if (num != null && !num.isEmpty() && !num.trim().equals("")) {
                try {
                    numOfQuiz = Integer.parseInt(num);
                    request.setAttribute("savedNumOfQuiz", numOfQuiz);
                    // check number of question valid
                    if ((numOfQuiz <= 0)) {
                        request.setAttribute("message", "Error! Quiz number must be larger than 0");
                    } else if (numOfQuiz > qd.getQuestionSize()) {
                        request.setAttribute("message", "Error! There is not enough quiz to take");
                    } else {
//                        List<Integer> questionIndexs = new ArrayList<>();
//                        // get question index of list
//                        for (int i = 0; i < qd.getQuestions().size(); i++) {
//                            questionIndexs.add(i);
//                        }
//                        // shuffer list question index
//                        Collections.shuffle(questionIndexs);
//                        List<Question> returnQuestion = new ArrayList<>();
//                        // create a random arraylist questtion from shuffer index list
//                        for (int i = 0; i < numOfQuiz; i++) {
//                            returnQuestion.add(qd.getQuestions().get(questionIndexs.get(i)));
//                        }
                        // set question to session to cant change when reload page
                        if (session.getAttribute("quizData") == null) {
                            // get random question
                            session.setAttribute("quizData", qd.getQuestionsRandom(numOfQuiz));
                        }
                        request.setAttribute("quizSize", numOfQuiz);
                        page = "takeQuiz/QuizDo.jsp";
                    }
                } catch (Exception ex) {
                    request.setAttribute("message", "Error! Quiz number no valid");
                }
            } else {
                request.setAttribute("message", "Error! Please enter number of quiz");
            }
            request.setAttribute("page", page);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("./ErrorPage/Error.jsp").forward(request, response);
        }

    }

    public void questionResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            int checkTime = Integer.parseInt(request.getParameter("invalidTime"));
            int numOfQuiz = Integer.parseInt(request.getParameter("numOfQuiz"));
            double mark = 0;
            QuestionDao qd = new QuestionDao();
            for (int i = 0; i < numOfQuiz; i++) {
                int id = Integer.parseInt(request.getParameter("q" + String.valueOf(i)));
                Question question = qd.findQuestionById(id);
                String answer = "";
                for (int j = 0; j < 4; j++) {
                    //get answer with each question
                    String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j);
                    if (request.getParameter(answerId) != null) {
                        // add to new string array answer
                        answer += String.valueOf(j + 1);
                    }
                }
                // decrease mark quen correct answer
                if (question.getAnswer().equals(answer)) {
                    mark++;
                }
            }
            String className = null;
             String status = "Failed";
            // add result to history
            QuestionHistoryDao qhm = new QuestionHistoryDao();
            int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
            NumberFormat formatter = new DecimalFormat("#0.00");
            mark = (mark / (double) numOfQuiz) * 10;
            double percent = mark * 10;
            //check time over or not
            if (checkTime >= 0) {
                status = "Failed";
                if (mark > 4) {
                    status = "Passed";
                }
                className = (status.equals("Passed")) ? "success" : "failed";
            } else {
                className = "failed";
                 status = "Reject because overtime";
            }
            qhm.addQuestonHistory(userId, numOfQuiz, (int) mark, new Date(),status);

            request.setAttribute("numOfQuiz", numOfQuiz);
            request.setAttribute("result", formatter.format(mark));
            request.setAttribute("percent", formatter.format(percent));
            request.setAttribute("status", status);
            request.setAttribute("className", className);
            String page = "takeQuiz/QuizResult.jsp";
            request.setAttribute("page", page);
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
