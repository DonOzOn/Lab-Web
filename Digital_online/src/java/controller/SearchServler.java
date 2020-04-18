/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.DBContext;
import dao.DigitalDao;
import entity.Digital;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DonOzOn
 */
@WebServlet(name = "SearchServler", urlPatterns = {"/SearchServler"})
public class SearchServler extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try {
            DBContext db = new DBContext();
            DigitalDao digitalDao = new DigitalDao();
            int pageSize = 3;
            String txtSearch = request.getParameter("txtSearch");
            String pageIndex = request.getParameter("index");
//            if(pageIndex == null){
//                pageIndex = "1";
//            }
            int index = 0;
            //check index page
            if (pageIndex != null) {
                try {
                    index = Integer.parseInt(pageIndex);
                } catch (Exception e) {
                    request.setAttribute("error", "This page is invalid!!");
                }
            }else{
                index = 1;
            }
            //count total result 
            int totalRecord = digitalDao.count(txtSearch);
            if(totalRecord <= 0){
                request.setAttribute("error", "No result for '"+txtSearch+"'!!");
            }
            int maxPage = totalRecord / pageSize;
            if ((totalRecord % pageSize) != 0) {
                maxPage++;
            }
            // switch to page 1 when index > maxPage
//           if(index > maxPage){
//               index = 1;
//           }
            //get list search 
            List<Digital> digitalList = digitalDao.seacrh(txtSearch, index, pageSize);
            request.setAttribute("listSearch", digitalList);
            request.setAttribute("txtSearch", txtSearch);
            request.setAttribute("index", index);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("totalRecord", totalRecord);
            //get latest news
            request.setAttribute("top1", digitalDao.getTop1());
            //get top 5 news except latest
            request.setAttribute("top5", digitalDao.getTop5());
            request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", ex);
            request.getRequestDispatcher("Error.jsp").forward(request, response);

        }
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
        processRequest(request, response);
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
