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

    @Column(name = "season")
    private String season;

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
