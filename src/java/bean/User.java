/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author ca
 */
public class User implements Serializable {
    private String email;
    private String password;

    public User() {
        // Default constructor
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Getters and setters for email and password

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
