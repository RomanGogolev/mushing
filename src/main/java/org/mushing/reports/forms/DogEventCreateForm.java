package org.mushing.reports.forms;

import org.springframework.security.core.CredentialsContainer;

import java.sql.Date;

/**
 * Created by roman on 07.12.16.
 */
public class DogEventCreateForm implements CredentialsContainer {

    protected Date datebirth;

    protected String fioowner;

    protected int idbreed;

    protected int idevent;

    protected int idfederation;

    protected int idmember;

    protected boolean inqualification;

    protected String marknumber;

    protected String nameonpedigree;

    protected String numberbookkv;

    protected String numberchip;

    protected String numberpedigree;

    protected String sex;

    public Date getDatebirth() {
        return this.datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public String getFioowner() {
        return this.fioowner;
    }

    public void setFioowner(String fioowner) {
        this.fioowner = fioowner;
    }

    public int getIdbreed() {
        return this.idbreed;
    }

    public void setIdbreed(int idbreed) {
        this.idbreed = idbreed;
    }

    public int getIdevent() {
        return this.idevent;
    }

    public void setIdevent(int idevent) {
        this.idevent = idevent;
    }

    public int getIdfederation() {
        return this.idfederation;
    }

    public void setIdfederation(int idfederation) {
        this.idfederation = idfederation;
    }

    public int getIdmember() {
        return this.idmember;
    }

    public void setIdmember(int idmember) {
        this.idmember = idmember;
    }

    public boolean isInqualification() {
        return this.inqualification;
    }

    public void setInqualification(boolean inqualification) {
        this.inqualification = inqualification;
    }

    public String getMarknumber() {
        return this.marknumber;
    }

    public void setMarknumber(String marknumber) {
        this.marknumber = marknumber;
    }

    public String getNameonpedigree() {
        return this.nameonpedigree;
    }

    public void setNameonpedigree(String nameonpedigree) {
        this.nameonpedigree = nameonpedigree;
    }

    public String getNumberbookkv() {
        return this.numberbookkv;
    }

    public void setNumberbookkv(String numberbookkv) {
        this.numberbookkv = numberbookkv;
    }

    public String getNumberchip() {
        return this.numberchip;
    }

    public void setNumberchip(String numberchip) {
        this.numberchip = numberchip;
    }

    public String getNumberpedigree() {
        return this.numberpedigree;
    }

    public void setNumberpedigree(String numberpedigree) {
        this.numberpedigree = numberpedigree;
    }

    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public void eraseCredentials() {
        this.datebirth=null;
        this.fioowner=null;
        this.marknumber=null;
        this.nameonpedigree=null;
        this.marknumber=null;
        this.numberbookkv=null;
        this.numberchip=null;
        this.nameonpedigree=null;
        this.sex=null;
    }
}
