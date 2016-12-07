package org.mushing.reports.forms;

import org.springframework.security.core.CredentialsContainer;

import java.sql.Date;

/**
 * Created by roman on 27.11.16.
 */
public class MemberEventCreateForm implements CredentialsContainer {

    protected String city;

    protected String club;

    protected Date datebirth;

    protected String descr;

    protected String email;

    protected String fio;

    protected int idclassrace;

    protected int idevent;

    protected String numberphone;

    public String getNumberphone() {
        return this.numberphone;
    }

    public void setNumberphone(String numberphone) {
        this.numberphone = numberphone;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getClub() {
        return this.club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public Date getDatebirth() {
        return this.datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public String getDescr() {
        return this.descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
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

    public int getIdclassrace() {
        return this.idclassrace;
    }

    public void setIdclassrace(int idclassrace) {
        this.idclassrace = idclassrace;
    }

    public int getIdevent() {
        return this.idevent;
    }

    public void setIdevent(int idevent) {
        this.idevent = idevent;
    }

    @Override
    public void eraseCredentials() {
        this.city=null;
        this.club=null;
        this.datebirth=null;
        this.descr=null;
        this.email=null;
        this.fio=null;
        this.numberphone=null;
    }
}
