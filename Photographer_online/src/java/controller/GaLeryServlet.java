/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.PhotoDao;
import entity.Galery;
import entity.Image;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DonOzOn
 */
public class GaLeryServlet extends HttpServlet {

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
            PhotoDao photoDao = new PhotoDao();
            String galeryID = request.getParameter("galeryID");
            String imgID = request.getParameter("imgID");
            boolean invalid = true;
            boolean indexValid = true;
            int galery = 0;
            //check galery id
            try {
                if (galeryID != null) {
                    galery = Integer.parseInt(galeryID);

                } else {
                    // set default galery id
                    galery = 1;
                }
            } catch (Exception e) {
                request.setAttribute("error", "This galery is invalid!!");
                invalid = false;
            }
            // galery is valid
            if (invalid == true) {
                int pageSize = 8;

                //count total result 
                int totalRecord = photoDao.countImage(galery);
                if (totalRecord <= 0) {
                    request.setAttribute("error", "No image in galery!!");
                } else {
                    int maxPage = totalRecord / pageSize;
                    if ((totalRecord % pageSize) != 0) {
                        maxPage++;
                    }
                    int image = 0;
                    String pageIndex = request.getParameter("index");
                    int index = 0;
                    //check index page
                    try {
                        if (pageIndex != null) {

                            index = Integer.parseInt(pageIndex);
                        } else {
                            index = 1;
                        }
                    } catch (Exception e) {
                        request.setAttribute("error", "This page is invalid!!");
                        indexValid = false;
                    }
                    // check range of page
                    if (indexValid == true && index > 0 && index <= maxPage) {
                        //check image id valid
                        try {
                            if (imgID != null) {
                                image = Integer.parseInt(imgID);
                            } else {
                                // set default image id
                                image = photoDao.getTop1ImageGalery(galery).getId();
                            }
                        } catch (Exception e) {
                            request.setAttribute("error", "This image not found!!");
                        }
                        // check image in galery or not
                        if (photoDao.getImageID(image, galery) != null) {
                            request.setAttribute("top1Galery", photoDao.getImageID(image, galery));
                        } else {
                            request.setAttribute("error", "This image not found!!");
                        }
                    } else {
                        request.setAttribute("error", "This page is invalid!!");
                    }
                    try {
                        //get list image with paging 
                        List<Image> imagelList = photoDao.getListImageWithPaging(galery, index, pageSize);
                        request.setAttribute("listImage", imagelList);

                    } catch (Exception ex) {
                        request.setAttribute("error", "This galery is invalid!!");
                    }
                    request.setAttribute("index", index);
                    request.setAttribute("maxPage", maxPage);
                    request.setAttribute("galeryID", galery);
                    request.setAttribute("activeGalery", "activeGalery");
                    request.setAttribute("totalRecord", totalRecord);
                    request.setAttribute("galery", photoDao.getGaleryByID(galery));
                }
            }
            //get top 3 galery
            request.setAttribute("top3", photoDao.getTop3Galery());
            //get contact infor
            request.setAttribute("contact", photoDao.getContact());
            request.getRequestDispatcher("Gallery.jsp").forward(request, response);
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
