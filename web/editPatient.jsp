<%-- 
    Document   : editPatient
    Created on : Jul 7, 2023, 2:34:12 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit patient!</h1>
        <sql:query var="result" dataSource="${myDatasource}">
        SELECT * FROM patient WHERE pemail = ?
         <sql:param value="${param.id}" />
        </sql:query>
        
        <c:forEach var="row" items="${result.rows}">
            <c:set var="patient" value="${row}" />
        </c:forEach>
        
        <form action="EditPatientServlet" method="POST">
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" required><br>

            <label for="lname">Last Name:</label>
            <input type="text" id="lname" name="lname" required><br>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${patient.paddress}"><br>

            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" value="${patient.pnic}" readonly><br>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="${patient.pdob}"><br>

            <label for="newemail">Email:</label>
            <input type="email" id="newemail" name="newemail" placeholder="Email Address" value="${patient.pdob}"><br>

            <label for="tele">Mobile Number:</label>
            <input type="tel" id="tele" name="tele" placeholder="ex: 0712345678" pattern="[0]{1}[0-9]{9}" value="${patient.ptel}"><br>

            <label for="newpassword">New Password:</label>
            <input type="password" id="newpassword" name="newpassword" placeholder="New Password" required><br>

            <label for="cpassword">Confirm Password:</label>
            <input type="password" id="cpassword" name="cpassword" placeholder="Confirm Password" required><br>

            <input type="submit" value="Register">
        </form>
    </body>
</html>
