<%-- 
    Document   : patientAdmin
    Created on : Jul 7, 2023, 2:28:08 AM
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
        <h1>Patient Admin List</h1>
        
        <sql:query var="result" dataSource="${myDatasource}">
        SELECT pname, pemail, ptel FROM APP.PATIENT
        </sql:query>
        <c:if test="${empty result.rows}">
            <p>No data available!</p>
        </c:if>
        <c:if test="${not empty result.rows}">
            <table border="1">
                <!-- column headers -->
                <tr>
                  <th>Name</th>
                  <th>Email</th>
                  <th>No. Tel</th>
                  <th>Actions</th>
                </tr>
                <!-- column data -->
                <c:forEach var="row" items="${result.rowsByIndex}">
                  <tr>
                    <c:forEach var="column" items="${row}">
                      <td><c:out value="${column}" /></td>
                    </c:forEach>
                    <td>
                      <a href="editPatient.jsp?id=${row[1]}">Update</a>
                      <a href="EditPatientServlet?id=${row[1]}">Delete</a>
                    </td>
                  </tr>
                </c:forEach>
              </table>
        </c:if>
        
    </body>
</html>
