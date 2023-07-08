package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/animations.css\">  \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/main.css\">  \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/login.css\">\n");
      out.write("\n");
      out.write("        <title>Login</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <center>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <table border=\"0\" style=\"margin: 0;padding: 0;width: 60%;\">\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <p class=\"header-text\">Welcome Back!</p>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        <div class=\"form-body\">\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <p class=\"sub-text\">Login with your details to continue</p>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <form action=\"LoginServlet\" method=\"POST\" >\n");
      out.write("                <td class=\"label-td\">\n");
      out.write("                    <label for=\"useremail\" class=\"form-label\">Email: </label>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td class=\"label-td\">\n");
      out.write("                    <input type=\"email\" name=\"useremail\" class=\"input-text\" placeholder=\"Email Address\" required>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td class=\"label-td\">\n");
      out.write("                    <label for=\"userpassword\" class=\"form-label\">Password: </label>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td class=\"label-td\">\n");
      out.write("                    <input type=\"Password\" name=\"userpassword\" class=\"input-text\" placeholder=\"Password\" required>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <input type=\"submit\" value=\"Login\" class=\"login-btn btn-primary btn\">\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </div>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <br>\n");
      out.write("                    <label for=\"\" class=\"sub-text\" style=\"font-weight: 280;\">Don't have an account&#63; </label>\n");
      out.write("                    <a href=\"signup.jsp\" class=\"hover-link1 non-style-link\">Sign Up</a>\n");
      out.write("                    <br><br><br>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("    \n");
      out.write("                        \n");
      out.write("                    </form>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("</center>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
