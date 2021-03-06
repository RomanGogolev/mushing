package org.mushing.reports.forms;



import java.sql.Date;

/**
 * Created by roman on 21.11.16.
 */
public class DogCreateForm  {

    protected Integer idfederation;

    protected Date dateBirth;

    protected int idfciGroup;

    protected int idbreed;

    protected String sex;

    protected String fullName;

    protected String markNumber;

    protected String numberChip;

    protected String numberPedigree;

    protected String ownerName;

    protected String homeName;

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getIdbreed() {
        return idbreed;
    }

    public void setIdbreed(int idbreed) {
        this.idbreed = idbreed;
    }

    public Integer getIdfederation() {
        return this.idfederation;
    }

    public void setIdfederation(Integer idfederation) {
        this.idfederation = idfederation;
    }

    public String getHomeName() {
        return this.homeName;
    }

    public void setHomeName(String homeName) {
        this.homeName = homeName;
    }

    public Date getDateBirth() {
        return this.dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public int getIdfciGroup() {
        return this.idfciGroup;
    }

    public void setIdfciGroup(int idfciGroup) {
        this.idfciGroup = idfciGroup;
    }

    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getMarkNumber() {
        return this.markNumber;
    }

    public void setMarkNumber(String markNumber) {
        this.markNumber = markNumber;
    }

    public String getNumberChip() {
        return this.numberChip;
    }

    public void setNumberChip(String numberChip) {
        this.numberChip = numberChip;
    }

    public String getNumberPedigree() {
        return this.numberPedigree;
    }

    public void setNumberPedigree(String numberPedigree) {
        this.numberPedigree = numberPedigree;
    }

    public String getOwnerName() {
        return this.ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public void eraseCredentials() {
        this.ownerName=null;
        this.numberPedigree=null;
        this.numberChip=null;
        this.markNumber=null;
        this.fullName=null;
        this.dateBirth=null;
    }
}
