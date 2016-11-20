package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Time;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "results")
public class Result {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "idmember")
    private int idmember;

    @Column(name = "starttime")
    private Time starttime;

    @Column(name = "endtime")
    private Time endtime;

    @Column(name = "positionmember")
    private int positionmember;

    @Column(name = "idevent")
    private int idevent;

    @Column(name = "raznost")
    private Time raznost;

    public Time getRaznost() {
        return raznost;
    }

    public void setRaznost(Time raznost) {
        this.raznost = raznost;
    }

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

    public Time getStarttime() {
        return starttime;
    }

    public void setStarttime(Time starttime) {
        this.starttime = starttime;
    }

    public Time getEndtime() {
        return endtime;
    }

    public void setEndtime(Time endtime) {
        this.endtime = endtime;
    }

    public int getPositionmember() {
        return positionmember;
    }

    public void setPositionmember(int positionmember) {
        this.positionmember = positionmember;
    }

    public int getIdevent() {
        return idevent;
    }

    public void setIdevent(int idevent) {
        this.idevent = idevent;
    }
}
