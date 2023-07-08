<%-- 
    Document   : scheduleAdmin
    Created on : Jul 6, 2023, 10:48:08 PM
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
        <sql:query var="doc" dataSource="${myDatasource}">
        SELECT docnic, docname
        FROM doctor
        </sql:query>
        
        <h1>Add Schedule</h1>
        <form action="AddScheduleServlet" method="POST">
            <label for="treatment">Treatment:</label>
            <input type="text" id="treatment" name="treatment" required><br>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br>

            <label for="time">Time:</label>
            <input type="time" id="time" name="time" required><br>

            <label for="docnic">Doctor NIC:</label>
            <select id="docnic" name="docnic" required>
                <c:forEach var="row" items="${doc.rows}">
                    <option value="${row.docnic}">${row.docnic} - ${row.docname}</option>
                </c:forEach>
            </select><br>

            <input type="submit" value="Add Schedule">
        </form>
        <br><br>
        
        
        <sql:query var="result" dataSource="${myDatasource}">
        SELECT s.treatment, d.docname, s.schdate, s.schtime
        FROM schedule s
        INNER JOIN doctor d ON s.docnic = d.docnic
        </sql:query>
        
        
        <table border="1">
        <!-- column headers -->
        <tr>
          <th>Treatment Title</th>
          <th>Doctor</th>
          <th>Date</th>
          <th>Time</th>
          <th>Actions</th>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${result.rowsByIndex}">
          <tr>
            <c:forEach var="column" items="${row}">
              <td><c:out value="${column}" /></td>
            </c:forEach>
            <td>
              <a href="AddDoctorServlet?id=${row[1]}">Delete</a>
            </td>
          </tr>
        </c:forEach>
      </table>
    </body>
</html>
