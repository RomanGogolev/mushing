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

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idmember")
    private Member member;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idevent")
    private Event event;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idbreed")
    private Breed breed;

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

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idfederation")
    private Federation federation;

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

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Breed getBreed() {
        return breed;
    }

    public void setBreed(Breed breed) {
        this.breed = breed;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public Federation getFederation() {
        return federation;
    }

    public void setFederation(Federation federation) {
        this.federation = federation;
    }
}
