/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.PatientBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;
import static util.DBConnection.createConnection;

/**
 *
 * @author ca
 */
public class RegisterDao {
    
   public String registerUser(PatientBean patientBean) {
      
        try(Connection connection = createConnection();
                PreparedStatement statement = connection.prepareStatement("INSERT INTO USERS (EMAIL, USERTYPE, PASSWORD) VALUES (?, ?, ?)"))
        {
                statement.setString(1, patientBean.getEmail());
                statement.setString(2, "p");
                statement.setString(3, patientBean.getPassword());
            
            int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    return "SUCCESS";
                } else {
                    return "Error registering user!";
                }
        }
        catch (SQLException e) {
            return "Error registering user! SQL Exception";
        }
   }
   
   public String RegisterPatient(PatientBean patient){
       String insertQuery = "INSERT INTO PATIENT (pemail, pname, ppassword, paddress, pnic, pdob, ptel) VALUES (?, ?, ?, ?, ?, ?, ?)";
       
       try(Connection connection = createConnection();
               PreparedStatement statement = connection.prepareStatement(insertQuery)){
           // Set parameters for the patient table insertion   
                statement.setString(1, patient.getEmail());
                statement.setString(2, patient.getFullname());
                statement.setString(3, patient.getPassword());
                statement.setString(4, patient.getAddress());
                statement.setString(5, patient.getNIC());
                statement.setString(6, patient.getDob());
                statement.setString(7, patient.getNotel());
                
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    return "SUCCESS";
                } else {
                    return "Error registering user!";
                }
       }
       catch (SQLException e) {
            return "Error registering patient! SQL Exception";
        }
   }
}
