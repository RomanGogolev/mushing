package org.mushing.reports.models;

import javax.persistence.*;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "distance")
public class Distance {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "stadion")
    private String stadion;

    @Column(name = "upperdot")
    private String upperdot;

    @Column(name = "lowerdot")
    private String lowerdot;

    @Column(name = "lengthround")
    private String lengthround;

    @Column(name = "countround")
    private String countround;

    @Column(name = "idevent")
    private int idevent;

    @Column(name = "weather")
    private String weather;

    @Column(name = "tsnow")
    private String tsnow;

    @Column(name = "tair")
    private String tair;

    @Column(name = "view")
    private String view;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStadion() {
        return stadion;
    }

    public void setStadion(String stadion) {
        this.stadion = stadion;
    }

    public String getUpperdot() {
        return upperdot;
    }

    public void setUpperdot(String upperdot) {
        this.upperdot = upperdot;
    }

    public String getLowerdot() {
        return lowerdot;
    }

    public void setLowerdot(String lowerdot) {
        this.lowerdot = lowerdot;
    }

    public String getLengthround() {
        return lengthround;
    }

    public void setLengthround(String lengthround) {
        this.lengthround = lengthround;
    }

    public String getCountround() {
        return countround;
    }

    public void setCountround(String countround) {
        this.countround = countround;
    }

    public int getIdevent() {
        return idevent;
    }

    public void setIdevent(int idevent) {
        this.idevent = idevent;
    }

    public String getWeather() {
        return weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    public String getTsnow() {
        return tsnow;
    }

    public void setTsnow(String tsnow) {
        this.tsnow = tsnow;
    }

    public String getTair() {
        return tair;
    }

    public void setTair(String tair) {
        this.tair = tair;
    }

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }
}
