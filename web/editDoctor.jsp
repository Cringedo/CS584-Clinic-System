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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:query var="result" dataSource="${myDatasource}">
        SELECT * FROM doctor WHERE docemail = ?
         <sql:param value="${param.id}" />
        </sql:query>
        
        <c:forEach var="row" items="${result.rows}">
            <c:set var="doctor" value="${row}" />
        </c:forEach>
        
        
        
        <form action="EditDoctorServlet" method="POST">
        <label for="docnic">NIC:</label>
        <input type="text" id="docnic" name="docnic" value="${doctor.docnic}" readonly><br>

        <label for="docemail">Email:</label>
        <input type="email" id="docemail" name="docemail" value="${doctor.docemail}"><br>

        <label for="docname">Name:</label>
        <input type="text" id="docname" name="docname" value="${doctor.docname}"><br>

        <label for="docspeciality">Speciality:</label>
        <input type="text" id="docspeciality" name="docspeciality" value="${doctor.docspeciality}"><br>

        <label for="docnum">Phone Number:</label>
        <input type="text" id="docnum" name="docnum" value="${doctor.docnum}"><br>

        <label for="docpassword">Password:</label>
        <input type="password" id="docpassword" name="docpassword" required><br>

        <input type="submit" value="Add Doctor">
    </form>
    </body>
</html>
