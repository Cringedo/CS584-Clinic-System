<%-- 
    Document   : index
    Created on : Jul 3, 2023, 10:43:07 PM
    Author     : ca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicDB" user="app"
                   password="app"/>
<% String value = (String) session.getAttribute("key");
    session.setAttribute("key", value);
    session.setAttribute("name", request.getAttribute("name"));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/animations.css">  
        <link rel="stylesheet" href="css/main.css">  
        <link rel="stylesheet" href="css/admin.css">

        <title>Dashboard</title>
        <style>
            .dashbord-tables{
                animation: transitionIn-Y-over 0.5s;
            }
            .filter-container{
                animation: transitionIn-Y-bottom  0.5s;
            }
            .sub-table,.anime{
                animation: transitionIn-Y-bottom 0.5s;
            }
        </style>
    </head>
    <body>
               
        <div class="container">
            <div class="menu">
                <table class="menu-container" border="0">
                    <tr>
                        <td style="padding:10px" colspan="2">
                            <table border="0" class="profile-container">
                                <tr>
                                    <td width="30%" style="padding-left:20px" >
                                        <img src="img/user.png" alt="" width="100%" style="border-radius:50%">
                                    </td>
                                    <td style="padding:0px;margin:0px;">
                                        <p class="profile-title"><%= request.getAttribute("name") %></p>
                                        <p class="profile-subtitle"><%= value %></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <a href="LogoutServlet" ><input type="button" value="Log out" class="logout-btn btn-primary-soft btn"></a>
                                    </td>
                                </tr>
                        </table>
                        </td>
                    </tr>
                    <tr class="menu-row" >
                        <td class="menu-btn menu-icon-home menu-active menu-icon-home-active" >
                            <a href="index.jsp" class="non-style-link-menu non-style-link-menu-active"><div><p class="menu-text">Home</p></a></div><a>
                        </td>
                    </tr>

                    <tr class="menu-row" >
                        <td class="menu-btn menu-icon-session">
                            <a href="schedule.jsp" class="non-style-link-menu"><div><p class="menu-text">Scheduled Sessions</p></div></a>
                        </td>
                    </tr>
                    <tr class="menu-row" >
                        <td class="menu-btn menu-icon-appoinment">
                            <a href="AppointmentServlet" class="non-style-link-menu"><div><p class="menu-text">My Bookings</p></a></div>
                        </td>
                    </tr>
                    <tr class="menu-row" >
                        <td class="menu-btn menu-icon-settings">
                            <a href="settings.jsp" class="non-style-link-menu"><div><p class="menu-text">Settings</p></a></div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="dash-body" style="margin-top: 15px">
                        <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;" >

                                    <tr >

                                        <td colspan="1" class="nav-bar" >
                                        <p style="font-size: 23px;padding-left:12px;font-weight: 600;margin-left:20px;">Home</p>

                                        </td>
                                        <td width="25%">

                                        </td>
                                        <td width="15%">
                                            <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                                                Today's Date
                                            </p>
                                            <p class="heading-sub12" style="padding: 0;margin: 0;">
                                               <%
                                                    Date today = new Date();
                                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                    String formattedDate = dateFormat.format(today);
                                                 %>

                                                 <%= formattedDate %>
                                            </p>
                                        </td>
                                        <td width="10%">
                                            <button  class="btn-label"  style="display: flex;justify-content: center;align-items: center;"><img src="img/calendar.svg" width="100%"></button>
                                        </td>


                                    </tr>
                            <tr>
                                <td colspan="4" >

                                <center>
                                <table class="filter-container doctor-header patient-header" style="border: none;width:95%" border="0" >
                                <tr>
                                    <td >
                                        <h3>Welcome!</h3>
                                        <h1><%= request.getAttribute("name") %>.</h1>
                                        <p>Scheduling your healthcare appointments has never been easier. <br>With our user-friendly online platform,
                                            you can book, manage, and track your appointments with just a few clicks. 
                                            <br>Enjoy the convenience of choosing your preferred healthcare provider, selecting a suitable time slot, and receiving appointment reminders. 
                                            <br>
                                            Take control of your healthcare journey and experience hassle-free appointments with our online clinic system. <br>
                                            Thank you for choosing us. We're here to support your well-being.
                                        </p>
                                        <br>
                                        <br>

                                    </td>
                                </tr>
                                </table>
                                </center>

                            </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <table border="0" width="100%"">
                                        <tr>
                                            <td>



                                                <p style="font-size: 20px;font-weight:600;padding-left: 40px;" class="anime">Your Upcoming Booking</p>
                                                <center>
                                                    <sql:query var="result" dataSource="${myDatasource}">
                                                    SELECT PNAME, PNIC, PDOB, PTEL FROM APP.PATIENT
                                                    </sql:query>
                                                    <div class="abc scroll" style="height: 250px;padding: 0;margin: 0;">
                                                    <table width="85%" class="sub-table scrolldown" border="0" >
                                                    <thead>

                                                    <tr>
                                                    <th class="table-headin">


                                                                Appoint. Number

                                                                </th>
                                                            <th class="table-headin">


                                                            Session Title

                                                            </th>

                                                            <th class="table-headin">
                                                                Doctor
                                                            </th>
                                                            <th class="table-headin">

                                                                Sheduled Date & Time

                                                            </th>

                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="row" items="${result.rowsByIndex}">
                                                            <tr>
                                                              <c:forEach var="column" items="${row}">
                                                                <td><c:out value="${column}" /></td>
                                                              </c:forEach>
                                                            </tr>
                                                          </c:forEach>

<!--                                                        <?php
                                                        $nextweek=date("Y-m-d",strtotime("+1 week"));
                                                            $sqlmain= "select * from schedule inner join appointment on schedule.scheduleid=appointment.scheduleid inner join patient on patient.pid=appointment.pid inner join doctor on schedule.docid=doctor.docid  where  patient.pid=$userid  and schedule.scheduledate>='$today' order by schedule.scheduledate asc";
                                                            //echo $sqlmain;
                                                            $result= $database->query($sqlmain);

                                                            if($result->num_rows==0){
                                                                echo '<tr>
                                                                <td colspan="4">
                                                                <br><br><br><br>
                                                                <center>
                                                                <img src="../img/notfound.svg" width="25%">

                                                                <br>
                                                                <p class="heading-main12" style="margin-left: 45px;font-size:20px;color:rgb(49, 49, 49)">Nothing to show here!</p>
                                                                <a class="non-style-link" href="schedule.php"><button  class="login-btn btn-primary-soft btn"  style="display: flex;justify-content: center;align-items: center;margin-left:20px;">&nbsp; Channel a Doctor &nbsp;</font></button>
                                                                </a>
                                                                </center>
                                                                <br><br><br><br>
                                                                </td>
                                                                </tr>';

                                                            }
                                                            else{
                                                            for ( $x=0; $x<$result->num_rows;$x++){
                                                                $row=$result->fetch_assoc();
                                                                $scheduleid=$row["scheduleid"];
                                                                $title=$row["title"];
                                                                $apponum=$row["apponum"];
                                                                $docname=$row["docname"];
                                                                $scheduledate=$row["scheduledate"];
                                                                $scheduletime=$row["scheduletime"];

                                                                echo '<tr>
                                                                    <td style="padding:30px;font-size:25px;font-weight:700;"> &nbsp;'.
                                                                    $apponum
                                                                    .'</td>
                                                                    <td style="padding:20px;"> &nbsp;'.
                                                                    substr($title,0,30)
                                                                    .'</td>
                                                                    <td>
                                                                    '.substr($docname,0,20).'
                                                                    </td>
                                                                    <td style="text-align:center;">
                                                                        '.substr($scheduledate,0,10).' '.substr($scheduletime,0,5).'
                                                                    </td>



                                                                </tr>';

                                                            }
                                                        }

                                                        ?>-->

                                                        </tbody>

                                                    </table>
                                                    </div>
                                                    </center>







                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            <tr>
                        </table>
                    </div>
    </body>
</html>
