<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">  
    <link rel="stylesheet" href="../css/main.css">  
    <link rel="stylesheet" href="../css/admin.css">
        
    <title>Dashboard</title>
    <style>
        .dashbord-tables,.doctor-heade{
            animation: transitionIn-Y-over 0.5s;
        }
        .filter-container{
            animation: transitionIn-Y-bottom  0.5s;
        }
        .sub-table,#anim{
            animation: transitionIn-Y-bottom 0.5s;
        }
        .doctor-heade{
            animation: transitionIn-Y-over 0.5s;
        }
    </style>
</head>
<body>
    <%-- learn from w3schools.com --%>

    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Calendar" %>

    <%-- Session validation --%>
    <%@ page import="javax.servlet.http.HttpSession" %>
    <%@ page import="java.io.IOException" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>

    <%!
        private Connection con;
        private Statement stmt;
        private ResultSet rs;
        
        private void getConnection() throws ClassNotFoundException, SQLException {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "your_username", "your_password");
        }
        
        private void closeConnection() throws SQLException {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    %>

    <%!
        public boolean isLoggedIn(HttpSession session) {
            return (session != null && session.getAttribute("user") != null && session.getAttribute("usertype").equals("d"));
        }
    %>

    <%!
        public void validateSession(HttpSession session, HttpServletResponse response) throws ServletException, IOException {
            if (!isLoggedIn(session)) {
                response.sendRedirect("../login.jsp");
            }
        }
    %>

    <%!
        public String formatDate(Date date, String format) {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(date);
        }
    %>

    <%!
        public Date getNextWeekDate(Date date) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.WEEK_OF_YEAR, 1);
            return calendar.getTime();
        }
    %>

    <%-- Session management --%>
    <%! String useremail, username; %>
    <%!
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession(false);
            if (session != null) {
                useremail = (String) session.getAttribute("user");
                if (useremail == null || !((String) session.getAttribute("usertype")).equals("d")) {
                    response.sendRedirect("../login.jsp");
                }
              else {
                    username = (String) session.getAttribute("username");
                    try {
                        getConnection();
                        // Your code for handling database operations goes here
                        closeConnection();
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                response.sendRedirect("../login.jsp");
            }
        }
    %>

    <%-- HTML code for the dashboard --%>
    <header>
        <div class="logo">
            <img src="../images/logo.png" alt="logo">
        </div>
        <nav>
            <ul class="nav_links">
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="patients.jsp">Patients</a></li>
                <li><a href="appointments.jsp">Appointments</a></li>
                <li><a href="reports.jsp">Reports</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
        <a class="cta" href="book_appointment.jsp">Book Appointment</a>
    </header>

    <div class="dashbord-tables">
        <div class="doctor-heade">
            <h1>Welcome, <%= username %></h1>
            <h2>Dashboard</h2>
        </div>

        <div class="filter-container">
            <div class="filter">
                <form action="#" method="POST">
                    <label for="date">Select Date:</label>
                    <input type="date" id="date" name="date">
                    <input type="submit" value="Filter">
                </form>
            </div>
        </div>

        <div class="sub-table">
            <div class="doctor-patient">
                <h3>Appointments for <%= formatDate(new Date(), "dd-MM-yyyy") %></h3>
                <table>
                    <thead>
                        <tr>
                            <th>Patient Name</th>
                            <th>Appointment Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Code to fetch and display appointments goes here --%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>