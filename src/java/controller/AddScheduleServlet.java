/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.ScheduleBean;
import dao.AddDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ca
 */
public class AddScheduleServlet extends HttpServlet {

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
        String treatment = request.getParameter("treatment");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String docnic = request.getParameter("docnic");
        
        // Create a new ScheduleBean instance and set its properties
        ScheduleBean schedule = new ScheduleBean();
        schedule.setTreatment(treatment);
        schedule.setDate(date);
        schedule.setTime(time);
        schedule.setDocnic(docnic);
        
        AddDao ad = new AddDao();
        
        String result = ad.insertSchedule(schedule);
        
        if (result.equals("SUCCESS")) {
                response.setContentType("text/html");
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('Schedule successfully Added');");
                response.getWriter().println("window.location.href='admin.jsp';");
                response.getWriter().println("</script>");
        } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('" + result + "');");
                response.getWriter().println("window.location.href='scheduleAdmin.jsp';");
                response.getWriter().println("</script>");
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
