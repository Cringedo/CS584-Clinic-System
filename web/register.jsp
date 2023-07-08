<%-- 
    Document   : register
    Created on : Jul 2, 2023, 2:35:08 PM
    Author     : ca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicDB" user="app"
                   password="app"/>
<!DOCTYPE html>
<jsp:useBean id="patient" scope="request" type="bean.PatientBean"/>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/animations.css">  
        <link rel="stylesheet" href="css/main.css">  
        <link rel="stylesheet" href="css/signup.css">

        <title>Create Account</title>
        <style>
            .container{
                animation: transitionIn-X 0.5s;
            }
        </style>
    </head>
    <body>
        <center>
            <div class="container">
                <form action="RegisterServlet" method="POST" >
                    <table border="0" style="width: 69%;">
                        <tr>
                            <td colspan="2">
                                <p class="header-text">Let's Get Started</p>
                                <p class="sub-text">It's Okey, Now Create User Account.</p>
                            </td>
                        </tr>


                        <tr>
                            <input type="hidden" name="nic" value="<jsp:getProperty name="patient" property="NIC" />">
                            <input type="hidden" name="dob" value="<jsp:getProperty name="patient" property="dob" />">
                            <input type="hidden" name="fname" value="<jsp:getProperty name="patient" property="fname" />">
                            <input type="hidden" name="lname" value="<jsp:getProperty name="patient" property="lname" />">
                            <input type="hidden" name="address" value="<jsp:getProperty name="patient" property="address" />">

                            <td class="label-td" colspan="2">
                                <label for="newemail" class="form-label">Email: </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <input type="email" name="newemail" class="input-text" placeholder="Email Address" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <label for="tele" class="form-label">Mobile Number: </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <input type="tel" name="tele" class="input-text"  placeholder="ex: 0712345678" pattern="[0]{1}[0-9]{9}">
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <label for="newpassword" class="form-label">Create New Password: </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <input type="password" name="newpassword" class="input-text" placeholder="New Password" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <label for="cpassword" class="form-label">Confirm Password: </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-td" colspan="2">
                                <input type="password" name="cpassword" class="input-text" placeholder="Confirm Password" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="reset" value="Reset" class="login-btn btn-primary-soft btn">
                            </td>
                            <td>
                                <input type="submit" value="Sign Up" class="login-btn btn-primary btn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <label for="" class="sub-text" style="font-weight: 280;">Already have an account? </label>
                                <a href="login.jsp" class="hover-link1 non-style-link">Login</a>
                                <br><br><br>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </center>

    </body>
</html>
