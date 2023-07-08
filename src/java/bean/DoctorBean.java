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

public class DoctorBean implements Serializable {
    private String docnic;
    private String docemail;
    private String docname;
    private String docspeciality;
    private String docnum;
    private String docpassword;

    public String getDocnic() {
        return docnic;
    }

    public void setDocnic(String docnic) {
        this.docnic = docnic;
    }

    public String getDocemail() {
        return docemail;
    }

    public void setDocemail(String docemail) {
        this.docemail = docemail;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname;
    }

    public String getDocspeciality() {
        return docspeciality;
    }

    public void setDocspeciality(String docspeciality) {
        this.docspeciality = docspeciality;
    }

    public String getDocnum() {
        return docnum;
    }

    public void setDocnum(String docnum) {
        this.docnum = docnum;
    }

    public String getDocpassword() {
        return docpassword;
    }

    public void setDocpassword(String docpassword) {
        this.docpassword = docpassword;
    }
}

