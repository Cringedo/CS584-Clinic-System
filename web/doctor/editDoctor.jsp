<%-- 
    Document   : editDoctor
    Created on : Jul 7, 2023, 12:35:18 AM
    Author     : ca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicDB" user="app"
                   password="app"/>

<% 
    String value = (String) session.getAttribute("key");
    session.setAttribute("key", value);
    String name = (String) session.getAttribute("name");
    String doc_nic = "tasia@gmail.com"; // <------ [UPDATE] MAKE SURE THIS UNTUK TUKAR KEPADA SESSIONDATA
%>

<!--[SQL] FETCHING THE DATA FROM THE DATABASE-->
<!-- MAKE SURE UNTUK AMBIL DATA FROM REQUEST SERVLET-->
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM doctor WHERE docemail = '<%= doc_nic %>'
</sql:query>
     

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/animations.css">  
        <link rel="stylesheet" href="../css/main.css">  
        <link rel="stylesheet" href="../css/admin.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT DOCTOR TESTING</title>
    </head>
    <body>
        
        
        <c:forEach var="row" items="${result.rows}">
            <c:set var="doctor" value="${row}" />
        </c:forEach>
        
        
        
        <div id="popup1" class="dash-body">
            <div>
                <center>
                    <div style="display: flex; justify-content: center;">
                        <div class="abc">
                            <form action="EditDoctorServlet" method="POST">


                                <table width="80%" class="sub-table add-doc-form-container" border="0">

                                    <tr>
                                        <td>
                                            <p style="padding: 0;margin: 0;text-align: left;font-size: 25px;font-weight: 500;">Edit Doctor Details.</p>
                                        Doctor ID : ${doctor.docid} (Auto Generated)<br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <form action="edit-doc.php" method="POST" class="add-new-form">
                                            <label for="Email" class="form-label">Email: </label>
                                            <input type="hidden" value="'.$id.'" name="id00">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                        <input type="hidden" name="oldemail" value="${doctor.docemail}" >
                                        <input type="email" name="docemail" class="input-text" placeholder="Email Address" value="${doctor.docemail}" required><br>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td class="label-td" colspan="2">
                                            <label for="name" class="form-label">Name: </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <input type="text" name="docname" class="input-text" placeholder="Doctor Name" value="${doctor.docname}" required><br>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <label for="nic" class="form-label">NIC: </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <input type="text" name="docnic" class="input-text" placeholder="NIC Number" value="${doctor.docnic}" required><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <label for="Tele" class="form-label">Telephone: </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <input type="tel" name="docnum" class="input-text" placeholder="Telephone Number" value="${doctor.docnum}" required><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <label for="spec" class="form-label">Choose specialties:</label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <input type="text" name="docspeciality" class="input-text" placeholder="Speciality" value="${doctor.docspeciality}" required><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <label for="password" class="form-label">Password: </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <input type="password" name="docpassword" class="input-text" placeholder="Defind a Password" required><br>
                                        </td>
                                    </tr><tr>
                                        <td class="label-td" colspan="2">
                                            <label for="cpassword" class="form-label">Conform Password: </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label-td" colspan="2">
                                            <input type="password" name="cpassword" class="input-text" placeholder="Confirm Password" required><br>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td colspan="2">
                                            <input type="reset" value="Reset" class="login-btn btn-primary-soft btn" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                            <input type="submit" value="Save" class="login-btn btn-primary btn">
                                        </td>

                                    </tr>

                                    </form>
                                    </tr>

                                </table>
                            </form>
                        </div>
                    </div>
                </center>
                <br><br>
            </div>
        </div>
    </body>
</html>

                        