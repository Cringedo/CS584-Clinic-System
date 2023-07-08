<%-- 
    Document   : doctor
    Created on : Jul 7, 2023, 3:09:42 AM
    Author     : ca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource var="myDatasource" 
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/ClinicDB" user="app"
                   password="app"/>
<% String value = (String) session.getAttribute("key");
    session.setAttribute("key", value);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Doctor! <%= value %></h1>
        <a href="doctor.jsp">dashboard</a>
        <a href="patientDoc.jsp">Patient</a>
        <a href="settingDoc.jsp">Settings</a>
        
        
    </body>
</html>
