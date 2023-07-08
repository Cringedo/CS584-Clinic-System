/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.DoctorBean;
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
public class AddDoctorServlet extends HttpServlet {

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
        String docnic = request.getParameter("docnic");
        String docemail = request.getParameter("docemail");
        String docname = request.getParameter("docname");
        String docspeciality = request.getParameter("docspeciality");
        String docnum = request.getParameter("docnum");
        String docpassword = request.getParameter("docpassword");

        // Create a DoctorBean object and set the retrieved parameters
        DoctorBean doctor = new DoctorBean();
        doctor.setDocnic(docnic);
        doctor.setDocemail(docemail);
        doctor.setDocname(docname);
        doctor.setDocspeciality(docspeciality);
        doctor.setDocnum(docnum);
        doctor.setDocpassword(docpassword);
        
        AddDao ad = new AddDao();
        
        String result = ad.doctorDao(doctor);
        
        if (result.equals("SUCCESS")) {
                response.setContentType("text/html");
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('User successfully registered');");
                response.getWriter().println("window.location.href='admin.jsp';");
                response.getWriter().println("</script>");
        } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('" + result + "');");
                response.getWriter().println("window.location.href='addDoctors.jsp';");
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
        
        String id = request.getParameter("id");
        
        AddDao ad = new AddDao();
        
        String result = ad.deleteDoctor(id);
        
        if (result.equals("SUCCESS")) {
                response.setContentType("text/html");
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('User successfully deleted');");
                response.getWriter().println("window.location.href='admin.jsp';");
                response.getWriter().println("</script>");
        } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('" + result + "');");
                response.getWriter().println("window.location.href='addDoctors.jsp';");
                response.getWriter().println("</script>");
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
