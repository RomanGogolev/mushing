package org.mushing.reports.forms;

import org.springframework.security.core.CredentialsContainer;

import java.sql.Date;

/**
 * Created by roman on 21.11.16.
 */
public class DogEditForm implements CredentialsContainer {

    protected int id;

    protected Date dateBirth;

    protected int idfciGroup;

    protected String fullName;

    protected String markNumber;

    protected String numberChip;

    protected String numberPedigree;

    protected String ownerName;

    protected String homeName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
        return idfciGroup;
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

    @Override
    public void eraseCredentials() {
        this.ownerName=null;
        this.numberPedigree=null;
        this.numberChip=null;
        this.markNumber=null;
        this.fullName=null;
        this.dateBirth=null;
    }
}
