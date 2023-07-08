/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author ca
 */
import java.io.Serializable;

public class PatientBean extends User implements Serializable {
    private String fname;
    private String lname;
    private String address;
    private String NIC;
    private String dob;
    private String notel;

    public PatientBean() {
        super(null, null);
        this.fname = null;
        this.lname = null;
        this.address = null;
        this.NIC = null;
        this.dob = null;
        this.notel = null;
    }

    public PatientBean(String email, String password, String fname, String lname, String address, String NIC, String dob, String notel) {
        super(email, password);
        this.fname = fname;
        this.lname = lname;
        this.address = address;
        this.NIC = NIC;
        this.dob = dob;
        this.notel = notel;
    }

    // Getters and Setters
    public String getFname() {
        return fname;
    }
    
    public String getFullname() {
        return fname + " " + lname;
    }
  
    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getNotel() {
        return notel;
    }

    public void setNotel(String notel) {
        this.notel = notel;
    }
}

