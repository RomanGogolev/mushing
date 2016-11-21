package org.mushing.reports.forms;

import org.springframework.security.core.CredentialsContainer;
import java.sql.Date;

/**
 * Created by roman on 21.11.16.
 */
public class MemberCreateForm implements CredentialsContainer {

    protected String email;

    protected String fio;

    protected String phonenumber;

    protected String sex;

    protected Date datebirth;

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
