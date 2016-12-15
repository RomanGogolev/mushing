package org.mushing.reports.models;

import javax.persistence.*;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "classes")
public class Class {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "classrace")
    private String classrace;

    @Column(name = "rkfname")
    private String rkfname;

    @Column(name = "fesname")
    private String fesname;

    @Column(name = "season")
    private String season;

    public String getRkfname() {
        return rkfname;
    }

    public void setRkfname(String rkfname) {
        this.rkfname = rkfname;
    }

    public String getFesname() {
        return fesname;
    }

    public void setFesname(String fesname) {
        this.fesname = fesname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClassrace() {
        return classrace;
    }

    public void setClassrace(String classrace) {
        this.classrace = classrace;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }
}
