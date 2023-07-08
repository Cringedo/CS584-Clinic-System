/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.DoctorBean;
import bean.PatientBean;
import bean.ScheduleBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import static util.DBConnection.createConnection;

/**
 *
 * @author ca
 */
public class AddDao {
    public String doctorDao(DoctorBean doctor){
        String insertQuery = "INSERT INTO DOCTOR (docnic, docemail, docname, docspeciality, docnum, docpassword) VALUES (?, ?, ?, ?, ?, ?)";
        
        try(Connection connection = createConnection();
                PreparedStatement statement = connection.prepareStatement("INSERT INTO DOCTOR (docnic, docemail, docname, docspeciality, docnum, docpassword) VALUES (?, ?, ?, ?, ?, ?)"))
        {
            PreparedStatement docstatement = connection.prepareStatement("INSERT INTO USERS (EMAIL, USERTYPE, PASSWORD) VALUES (?, ?, ?)");
            
            statement.setString(1, doctor.getDocnic());
            statement.setString(2, doctor.getDocemail());
            statement.setString(3, doctor.getDocname());
            statement.setString(4, doctor.getDocspeciality());
            statement.setString(5, doctor.getDocnum());
            statement.setString(6, doctor.getDocpassword());
            
            docstatement.setString(1, doctor.getDocemail());
            docstatement.setString(2, "d");
            docstatement.setString(3, doctor.getDocpassword());
            
            docstatement.executeUpdate();
            
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
    
    public String insertSchedule(ScheduleBean schedule){
        String query = "INSERT INTO schedule (treatment, schdate, schtime, docnic) VALUES (?, ?, ?, ?)";
        
        try(Connection connection = createConnection();
                PreparedStatement stmt = connection.prepareStatement(query)){
            stmt.setString(1, schedule.getTreatment());
            stmt.setString(2, schedule.getDate());
            stmt.setString(3, schedule.getTime());
            stmt.setString(4, schedule.getDocnic());
            
            int rowsAffected = stmt.executeUpdate();
            
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
    
    public String deleteDoctor(String email){
        
        try(Connection connection = createConnection();
         PreparedStatement stmt = connection.prepareStatement("DELETE FROM doctor WHERE docemail = ?"))
        {
            PreparedStatement st = connection.prepareStatement("DELETE FROM users WHERE email = ?");
            
            stmt.setString(1, email);
            st.setString(1, email);
            
            st.executeUpdate();
            int rowsAffected = stmt.executeUpdate();
            

            if (rowsAffected > 0) {
                return "SUCCESS";
            } else {
                return "Error Deleting user!";
            }
        }
        catch (SQLException e) {
            return "Error DELETE SQL Exception";
        }
    }
    
    public String EditDoctor(DoctorBean doctor){
        
        try(Connection connection = createConnection();
                PreparedStatement statement = connection.prepareStatement("UPDATE doctor SET  docemail = ?, docname = ?, docspeciality = ?, docnum = ?, docpassword = ? WHERE docnic = ?")){
            statement.setString(1, doctor.getDocemail());
            statement.setString(2, doctor.getDocname());
            statement.setString(3, doctor.getDocspeciality());
            statement.setString(4, doctor.getDocnum());
            statement.setString(5, doctor.getDocpassword());
            statement.setString(6, doctor.getDocnic());
            
            
            int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    return "SUCCESS";
                } else {
                    return "Error registering user!";
                }
            
        }
        catch (SQLException e) {
            return "Error registering user! Update SQL Exception";
        }
    }
    
    public String editPatient(PatientBean patient){
        
        try(Connection connection = createConnection();
                PreparedStatement statement = connection.prepareStatement("UPDATE patient SET pemail = ?, pname = ?, ppassword = ?, paddress = ?, pdob = ?, ptel = ? WHERE pnic = ?")){
            
                statement.setString(1, patient.getEmail());
                statement.setString(2, patient.getFullname());
                statement.setString(3, patient.getPassword());
                statement.setString(4, patient.getAddress());
                statement.setString(5, patient.getDob());
                statement.setString(6, patient.getNotel());
                statement.setString(7, patient.getNIC());
                
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    return "SUCCESS";
                } else {
                    return "Error registering user!";
                }
        }
        catch (SQLException e) {
            return "Error registering user! Update Patient SQL Exception";
        }
    }
    
    public String deletePatient(String email){
        
        try(Connection conn = createConnection();
         PreparedStatement stmt = conn.prepareStatement("DELETE FROM PATIENT WHERE pemail = ?")){
            stmt.setString(1, email);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                        return "SUCCESS";
            } else {
                return "Error registering user!";
            }
        }
        catch (SQLException e) {
            return "Error DELETE patient SQL Exception";
        }
    }
    
}
