package org.mushing.reports.models;

import javax.persistence.*;
import javax.print.attribute.standard.MediaSize;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "judges")
public class Judge {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "idevent")
    private int idevent;

    @Column(name = "judgefrom")
    private String judgefrom;

    @Column(name = "typeid")
    private int typeid;

    @Column(name = "fio")
    private String fio;

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

    public String getJudgefrom() {
        return judgefrom;
    }

    public void setJudgefrom(String judgefrom) {
        this.judgefrom = judgefrom;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }
}
