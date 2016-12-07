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

    protected String email;

    protected String fio;

    protected String phonenumber;

    protected String sex;

    protected Date datebirth;

    protected MultipartFile data;

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

    public String getFio() {
        return this.fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
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
        this.fio=null;
        this.phonenumber=null;
        this.sex=null;
    }
}
