package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "membersevent")
public class MemberEvent {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "idevent")
    private int idevent;

    @Column(name = "fio")
    private String fio;

    @Column(name = "city")
    private String city;

    @Column(name = "club")
    private String club;

    @Column(name = "datebirth")
    private Date datebirth;

    @Column(name = "numberphone")
    private String numberphone;

    @Column(name = "email")
    private String email;

    @Column(name = "descr")
    private String descr;

    @Column(name = "idclassrace")
    private int idclassrace;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdevent() {
        return idevent;
    }

    public void setIdevent(int idevent) {
        this.idevent = idevent;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public Date getDatebirth() {
        return datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public String getNumberphone() {
        return numberphone;
    }

    public void setNumberphone(String numberphone) {
        this.numberphone = numberphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public int getIdclassrace() {
        return idclassrace;
    }

    public void setIdclassrace(int idclassrace) {
        this.idclassrace = idclassrace;
    }
}
