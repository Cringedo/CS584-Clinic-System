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

public class ScheduleBean implements Serializable {
    private int schid;
    private String treatment;
    private String date;
    private String time;
    private String docnic;
    
    public ScheduleBean() {
    }
    
    public int getSchid() {
        return schid;
    }
    
    public void setSchid(int schid) {
        this.schid = schid;
    }
    
    public String getTreatment() {
        return treatment;
    }
    
    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }
    
    public String getDate() {
        return date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    
    public String getTime() {
        return time;
    }
    
    public void setTime(String time) {
        this.time = time;
    }
    
    public String getDocnic() {
        return docnic;
    }
    
    public void setDocnic(String docnic) {
        this.docnic = docnic;
    }
}

