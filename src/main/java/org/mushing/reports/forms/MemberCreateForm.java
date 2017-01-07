package org.mushing.reports.forms;

import org.apache.commons.fileupload.servlet.FileCleanerCleanup;
import org.springframework.security.core.CredentialsContainer;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.sql.Date;
import java.util.List;

/**
 * Created by roman on 21.11.16.
 */
public class MemberCreateForm implements CredentialsContainer {

    protected Integer idfederation;

    protected String email;

    protected String surname;

    protected String name;

    protected String fathername;

    protected String phonenumber;

    protected String sex;

    protected Date datebirth;

    protected MultipartFile data;

    private String city;

    public Integer getIdfederation() {
        return this.idfederation;
    }

    public void setIdfederation(Integer idfederation) {
        this.idfederation = idfederation;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public MultipartFile getData() {
        return data;
    }

    public void setData(MultipartFile data) {
        this.data = data;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFathername() {
        return this.fathername;
    }

    public void setFathername(String fathername) {
        this.fathername = fathername;
    }

    public String getPhonenumber() {
        return this.phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getDatebirth() {
        return this.datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    @Override
    public void eraseCredentials() {
        this.datebirth=null;
        this.email=null;
        this.name=null;
        this.fathername=null;
        this.surname=null;
        this.phonenumber=null;
        this.sex=null;
        this.city=null;
    }
}
