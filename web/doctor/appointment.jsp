<%-- 
    Document   : appointment
    Created on : Jul 6, 2023, 1:02:17 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicDB" user="app"
                   password="app"/>

<% 
    String value = (String) session.getAttribute("key");
    session.setAttribute("key", value);
    String name = (String) session.getAttribute("name");
    String doc_nric = "011213100720"; // <------ [UPDATE] MAKE SURE THIS UNTUK TUKAR KEPADA SESSIONDATA
%>

<!--[SQL] FETCHING THE DATA FROM THE DATABASE-->
<!-- MAKE SURE UNTUK AMBIL DATA FROM REQUEST SERVLET-->
<sql:query var="result" dataSource="${myDatasource}">
     SELECT A.appid, A.treatment, D.docemail, A.appdate, A.status, A.pnic
     FROM appointment A
     INNER JOIN doctor D ON A.docnic = D.docnic
     WHERE A.docnic = '<%= doc_nric %> '   
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">  
    <link rel="stylesheet" href="../css/main.css">  
    <link rel="stylesheet" href="../css/admin.css">
        
    <title>Appointments</title>
    <style>
        .popup{
            animation: transitionIn-Y-bottom 0.5s;
        }
        .sub-table{
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
                                    <img src="../img/user.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <p class="profile-title"><%= name %></p>
                                    <p class="profile-subtitle"><%= value %></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="../logout.php" ><input type="button" value="Log out" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                    </table>
                    </td>
                </tr>
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-dashbord " >
                        <a href="index.jsp" class="non-style-link-menu "><div><p class="menu-text">Dashboard</p></a></div></a>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-appoinment  menu-active menu-icon-appoinment-active">
                        <a href="appointment.jsp" class="non-style-link-menu non-style-link-menu-active"><div><p class="menu-text">My Appointments</p></a></div>
                    </td>
                </tr>
                
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-patient">
                        <a href="patient.jsp" class="non-style-link-menu"><div><p class="menu-text">My Patients</p></a></div>
                    </td>
                </tr>
                <tr class="menu-row" >
                    <td class="menu-btn menu-icon-settings">
                        <a href="setiing.jsp" class="non-style-link-menu"><div><p class="menu-text">Settings</p></a></div>
                    </td>
                </tr>
                
            </table>
        </div>
        <div class="dash-body">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;margin-top:25px; ">
                <tr >
                    <td width="13%" >
                    <a href="appointment.php" ><button  class="login-btn btn-primary-soft btn btn-icon-back"  style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px"><font class="tn-in-text">Back</font></button></a>
                    </td>
                    <td>
                        <p style="font-size: 23px;padding-left:12px;font-weight: 600;">Appointment Manager</p>
                                           
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
                        <p class="heading-sub12" style="padding: 0;margin: 0;">
                            
                        </p>
                    </td>
                    <td width="10%">
                        <button  class="btn-label"  style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                    </td>


                </tr>
               
                <!-- <tr>
                    <td colspan="4" >
                        <div style="display: flex;margin-top: 40px;">
                        <div class="heading-main12" style="margin-left: 45px;font-size:20px;color:rgb(49, 49, 49);margin-top: 5px;">Schedule a Session</div>
                        <a href="?action=add-session&id=none&error=0" class="non-style-link"><button  class="login-btn btn-primary btn button-icon"  style="margin-left:25px;background-image: url('../img/icons/add.svg');">Add a Session</font></button>
                        </a>
                        </div>
                    </td>
                </tr> -->
                <tr>
                    <td colspan="4" style="padding-top:10px;width: 100%;" >
                    
                        <p class="heading-main12" style="margin-left: 45px;font-size:18px;color:rgb(49, 49, 49)">My Appointments</p>
                    </td>
                    
                </tr>
<!--            PROBABLY ADD FOR OTHER FUNCTION SUCH AS ADDING OR WHAT    
                <tr>
                    <td colspan="4" style="padding-top:0px;width: 100%;" >
                        <center>
                        <table class="filter-container" border="0" >
                        <tr>
                           <td width="10%">

                           </td> 
                        <td width="5%" style="text-align: center;">
                        Date:
                        </td>
                        <td width="30%">
                        <form action="" method="post">
                            
                            <input type="date" name="sheduledate" id="date" class="input-text filter-container-items" style="margin: 0;width: 95%;">

                        </td>
                        
                    <td width="12%">
                        <input type="submit"  name="filter" value=" Filter" class=" btn-primary-soft btn button-icon btn-filter"  style="padding: 15px; margin :0;width:100%">
                        </form>
                    </td>

                    </tr>
                            </table>

                        </center>
                    </td>
                    
                </tr>-->
                  
                <tr>
                   <td colspan="4">     
                        
                        <center>
                         <div class="abc scroll"> 
                         <table width="93%" class="sub-table scrolldown" border="0">
                             <thead>
                                 <tr>
                                     <th class="table-headin">
                                         Appointment ID
                                     </th>
                                     <th class="table-headin">
                                         Treatment
                                     </th>
                                     <th class="table-headin">
                                         Patient NRIC
                                     </th> 
                                     <th class="table-headin" >
                                         Schedule Date
                                     </th>
                                     <th class="table-headin">
                                         Status
                                     </th>      
                                 </tr>
                             </thead>
                             <tbody>
                                 <c:forEach var="row" items="${result.rows}" >
                                     <tr>

                                         <td style="text-align:center;font-size:23px;font-weight:500">
                                             <c:out value="${row.appid}"/>
                                         </td>
                                         <td style="text-align:center;">
                                             <c:out value="${row.treatment}"/> 
                                         </td>
                                         <td style="text-align:center;">
                                             <c:out value="${row.pnic}"/>
                                         </td>
                                         <td style="text-align:center;">
                                             <c:out value="${row.appdate}"/>
                                         </td>
                                         <td style="text-align:center;">
                                             <c:out value="${row.status}"/>
                                         </td>

                                     </tr>
                                 </c:forEach>
                             </tbody>

                         </table>
                         </div>
                         </center>
                   </td> 
                </tr>
                       
                        
                        
            </table>
        </div>
    </div>
    
    </div>

</body>
</html>
