package org.mushing.reports.forms;



import java.sql.Date;

/**
 * Created by roman on 27.11.16.
 */
public class MemberEventEditForm  {

    protected int id;

    protected String city;

    protected String club;

    protected Date datebirth;

    protected String descr;

    protected String email;

    protected String surname;

    protected String name;

    protected String fathername;

    protected int idclassrace;

    protected int idevent;

    protected String numberphone;

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public void eraseCredentials() {
        this.city=null;
        this.club=null;
        this.datebirth=null;
        this.descr=null;
        this.email=null;
        this.name=null;
        this.fathername=null;
        this.surname=null;
        this.numberphone=null;
    }
}
