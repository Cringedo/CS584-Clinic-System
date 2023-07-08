/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author ca
 */
public class LoginDao {
    public String authenticateUser(User user){
        String email = user.getEmail();
        String password = user.getPassword();
        
        Connection con = null;
        Statement statement = null;
        PreparedStatement stmt = null;
        ResultSet resultset = null;
        String emailDB = "";
        String passwordDB = "";
        String roleDB = "";
        
        try{
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultset = statement.executeQuery("select email, usertype, password from users");
            
            while(resultset.next()){
                emailDB = resultset.getString("email");
                passwordDB = resultset.getString("password");
                roleDB = resultset.getString("usertype");
                if(email.equals(emailDB)&& password.equals(passwordDB)&& roleDB.equals("p")){                  
                    return "patient";
                }
                else if(email.equals(emailDB)&& password.equals(passwordDB)&& roleDB.equals("d")){
                        return "doctor";
                }
                else if(email.equals(emailDB)&& password.equals(passwordDB)&& roleDB.equals("a")){
                    return "admin";
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (resultset != null) {
                    resultset.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return "invalid user credentials";
    }
    
    public String getUser(User user){
        String email = user.getEmail();
        String password = user.getPassword();
        
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try{
            con = DBConnection.createConnection();
            String sql = "SELECT pemail, pname FROM patient WHERE pemail = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            
            // Execute the query
            rs = stmt.executeQuery();

            // Process the query results
            if (rs.next()) {
               String pemail = rs.getString("pemail");
               String pname = rs.getString("pname");
               
               return pname;
            }
            else
                return "Not found";
            
        }catch (SQLException e){
            e.printStackTrace();
        } finally {
            // Close the database resources
            if (rs != null) {
               try {
                  rs.close();
               } catch (SQLException e) {
                  e.printStackTrace();
               }
            }
            if (stmt != null) {
               try {
                  stmt.close();
               } catch (SQLException e) {
                  e.printStackTrace();
               }
            }
            if (con != null) {
               try {
                  con.close();
               } catch (SQLException e) {
                  e.printStackTrace();
               }
            }
         }
        return "FAILED";
    }
    
    
}
