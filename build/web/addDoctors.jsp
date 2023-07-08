<%-- 
    Document   : addDoctors
    Created on : Jul 6, 2023, 10:50:56 PM
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
        <title>Add Doctor</title>
    </head>
    <body>
        <h1>Add Doctor</h1>
    <form action="AddDoctorServlet" method="POST">
        <label for="docnic">NIC:</label>
        <input type="text" id="docnic" name="docnic" required><br>

        <label for="docemail">Email:</label>
        <input type="email" id="docemail" name="docemail" required><br>

        <label for="docname">Name:</label>
        <input type="text" id="docname" name="docname" required><br>

        <label for="docspeciality">Speciality:</label>
        <input type="text" id="docspeciality" name="docspeciality" required><br>

        <label for="docnum">Phone Number:</label>
        <input type="text" id="docnum" name="docnum" required><br>

        <label for="docpassword">Password:</label>
        <input type="password" id="docpassword" name="docpassword" required><br>

        <input type="submit" value="Add Doctor">
    </form>
        <br><br>
        
        <sql:query var="result" dataSource="${myDatasource}">
        SELECT docname, docemail, docspeciality FROM APP.DOCTOR
        </sql:query>
       
        
        <table border="1">
        <!-- column headers -->
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Speciality</th>
          <th>Actions</th>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${result.rowsByIndex}" varStatus="loop">
            <tr>
              <c:forEach var="column" items="${row}">
                <td><c:out value="${column}" /></td>
              </c:forEach>
              <td>
                <a href="editDoctor.jsp?id=${result.rowsByIndex[loop.index][1]}">Update</a>
                <a href="AddDoctorServlet?id=${result.rowsByIndex[loop.index][1]}">Delete</a>
              </td>
            </tr>
          </c:forEach>

      </table>
    </body>
</html>
