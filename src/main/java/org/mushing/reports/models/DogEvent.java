package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "dogsevent")
public class DogEvent {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "idmember")
    private int idmember;

    @Column(name = "idevent")
    private int idevent;

    @Column(name = "idbreed")
    private int idbreed;

    @Column(name = "nameonpedigree")
    private String nameonpedigree;

    @Column(name = "sex")
    private String sex;

    @Column(name = "datebirth")
    private Date datebirth;

    @Column(name = "marknumber")
    private String marknumber;

    @Column(name = "numberchip")
    private String numberchip;

    @Column(name = "idfederation")
    private int idfederation;

    @Column(name = "numberpedigree")
    private String numberpedigree;

    @Column(name = "fioowner")
    private String fioowner;

    @Column(name = "numberbookkv")
    private String numberbookkv;

    @Column(name = "inqualification")
    private boolean inqualification;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdmember() {
        return idmember;
    }

    public void setIdmember(int idmember) {
        this.idmember = idmember;
    }

    public int getIdevent() {
        return idevent;
    }

    public void setIdevent(int idevent) {
        this.idevent = idevent;
    }

    public int getIdbreed() {
        return idbreed;
    }

    public void setIdbreed(int idbreed) {
        this.idbreed = idbreed;
    }

    public String getNameonpedigree() {
        return nameonpedigree;
    }

    public void setNameonpedigree(String nameonpedigree) {
        this.nameonpedigree = nameonpedigree;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getDatebirth() {
        return datebirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.datebirth = dateBirth;
    }

    public String getMarknumber() {
        return marknumber;
    }

    public void setMarknumber(String marknumber) {
        this.marknumber = marknumber;
    }

    public String getNumberchip() {
        return numberchip;
    }

    public void setNumberchip(String numberchip) {
        this.numberchip = numberchip;
    }

    public int getIdfederation() {
        return idfederation;
    }

    public void setIdfederation(int idfederation) {
        this.idfederation = idfederation;
    }

    public String getNumberpedigree() {
        return numberpedigree;
    }

    public void setNumberpedigree(String numberpedigree) {
        this.numberpedigree = numberpedigree;
    }

    public String getFioowner() {
        return fioowner;
    }

    public void setFioowner(String fioowner) {
        this.fioowner = fioowner;
    }

    public String getNumberbookkv() {
        return numberbookkv;
    }

    public void setNumberbookkv(String numberbookkv) {
        this.numberbookkv = numberbookkv;
    }

    public boolean isInqualification() {
        return inqualification;
    }

    public void setInqualification(boolean inqualification) {
        this.inqualification = inqualification;
    }
}
