/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import dao.LoginDao;
import bean.DoctorBean;
import dao.AddDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ca
 */
public class EditDoctorServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
            
        String email = request.getParameter("useremail");
        String password = request.getParameter("userpassword");

        User user = new User(email,password);


        LoginDao loginDao = new LoginDao();

        String userValidate = loginDao.authenticateUser(user);
        String name = loginDao.getUser(user);
        HttpSession session = request.getSession();
        session.setAttribute("key", email);
        session.setAttribute("name", name);
        
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
        
        String result = ad.EditDoctor(doctor);
        
        if (result.equals("SUCCESS")) {
            switch (userValidate) {         
                case "patient":
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "doctor":   
                    request.getRequestDispatcher("doctor/index.jsp").forward(request, response);
                    break;
                case "admin":      

                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                    break;
                default:
                    response.getWriter().println("<script type=\"text/javascript\">");
                    response.getWriter().println("alert('Failed to login');");
                    response.getWriter().println("window.location.href='login.jsp';");
                    response.getWriter().println("</script>");
                    break;
        }
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
