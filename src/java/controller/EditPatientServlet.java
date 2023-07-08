/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.PatientBean;
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
public class EditPatientServlet extends HttpServlet {

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
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String dob = request.getParameter("dob");
        String newEmail = request.getParameter("newemail");
        String mobileNumber = request.getParameter("tele");
        String newPassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("cpassword");
        
        PatientBean patientp = new PatientBean(newEmail , newPassword, fname, lname, address, nic, dob, mobileNumber);
        
        AddDao ad = new AddDao();
        
        String result = ad.editPatient(patientp);
        
        if (result.equals("SUCCESS")) {
                response.setContentType("text/html");
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('User updated successfully');");
                response.getWriter().println("window.location.href='admin.jsp';");
                response.getWriter().println("</script>");
        } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('" + result + "');");
                response.getWriter().println("window.location.href='editDoctor.jsp';");
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
        
        String result = ad.deletePatient(id);
        
        if (result.equals("SUCCESS")) {
                response.setContentType("text/html");
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('User successfully deleted');");
                response.getWriter().println("window.location.href='admin.jsp';");
                response.getWriter().println("</script>");
        } else {
                response.getWriter().println("<script type=\"text/javascript\">");
                response.getWriter().println("alert('" + result + "');");
                response.getWriter().println("window.location.href='patientAdmin.jsp';");
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
