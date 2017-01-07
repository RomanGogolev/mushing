package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "members")
public class Member {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "surname")
    private String surname;

    @Column(name = "name")
    private String name;

    @Column(name = "fathername")
    private String fathername;

    @Column(name = "datebirth")
    private Date datebirth;

    @Column(name = "sex")
    private String sex;

    @Column(name = "phonenumber")
    private String phonenumber;

    @Column(name = "email")
    private String email;

    @Column(name = "dateenter")
    private Date dateenter;

    @Column(name = "img")
    private String img;

    @Column(name = "city")
    private String city;

    @Column(name = "inFeder")
    private boolean inFeder;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "federation")
    private Federation federation;

    public Federation getFederation() {
        return federation;
    }

    public void setFederation(Federation federation) {
        this.federation = federation;
    }

    public boolean isInFeder() {
        return inFeder;
    }

    public void setInFeder(boolean inFeder) {
        this.inFeder = inFeder;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFathername() {
        return fathername;
    }

    public void setFathername(String fathername) {
        this.fathername = fathername;
    }

    public Date getDatebirth() {
        return datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateenter() {
        return dateenter;
    }

    public void setDateenter(Date dateenter) {
        this.dateenter = dateenter;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
