/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ca
 */
public class DBConnection {
    public static Connection createConnection(){
        Connection connection = null;
        
        // Database connection details
        String url = "jdbc:derby://localhost:1527/ClinicDB";
        String username = "app";
        String password = "app";
        
        try {
            // Load the Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            // Establish the connection
            connection = DriverManager.getConnection(url, username, password);
            
            System.out.println("Database connection successful!");
            
         } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Failed to connect to the database!");
            e.printStackTrace();
        }
        
        return connection;
    }
}
