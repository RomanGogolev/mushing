package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "events")
public class Event {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "headerevent")
    private String headerevent;

    @Column(name = "datestart")
    private Date datestart;

    @Column(name = "idrank")
    private int idrank;

    @Column(name = "place")
    private String place;

    @Column(name = "organizers")
    private String organizers;

    @Column(name = "season")
    private String season;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHeaderevent() {
        return headerevent;
    }

    public void setHeaderevent(String headerevent) {
        this.headerevent = headerevent;
    }

    public Date getDatestart() {
        return datestart;
    }

    public void setDatestart(Date datestart) {
        this.datestart = datestart;
    }

    public int getIdrank() {
        return idrank;
    }

    public void setIdrank(int idrank) {
        this.idrank = idrank;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getOrganizers() {
        return organizers;
    }

    public void setOrganizers(String organizers) {
        this.organizers = organizers;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }
}
