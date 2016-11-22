package org.mushing.reports.forms;

import org.springframework.security.core.CredentialsContainer;

/**
 * Created by roman on 22.11.16.
 */
public class DistanceCreateForm implements CredentialsContainer {

    protected String countRound;

    protected int idEvent;

    protected String lengthRound;

    protected String lowerDot;

    protected String stadion;

    protected String tair;

    protected String tsnow;

    protected String upperDot;

    protected String view;

    protected String weather;

    public String getCountRound() {
        return this.countRound;
    }

    public void setCountRound(String countRound) {
        this.countRound = countRound;
    }

    public int getIdEvent() {
        return this.idEvent;
    }

    public void setIdEvent(int idEvent) {
        this.idEvent = idEvent;
    }

    public String getLengthRound() {
        return this.lengthRound;
    }

    public void setLengthRound(String lengthRound) {
        this.lengthRound = lengthRound;
    }

    public String getLowerDot() {
        return this.lowerDot;
    }

    public void setLowerDot(String lowerDot) {
        this.lowerDot = lowerDot;
    }

    public String getStadion() {
        return this.stadion;
    }

    public void setStadion(String stadion) {
        this.stadion = stadion;
    }

    public String getTair() {
        return this.tair;
    }

    public void setTair(String tair) {
        this.tair = tair;
    }

    public String getTsnow() {
        return this.tsnow;
    }

    public void setTsnow(String tsnow) {
        this.tsnow = tsnow;
    }

    public String getUpperDot() {
        return this.upperDot;
    }

    public void setUpperDot(String upperDot) {
        this.upperDot = upperDot;
    }

    public String getView() {
        return this.view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public String getWeather() {
        return this.weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    @Override
    public void eraseCredentials() {
        this.weather=null;
        this.countRound=null;
        this.lengthRound=null;
        this.lowerDot=null;
        this.stadion=null;
        this.tair=null;
        this.tsnow=null;
        this.upperDot=null;
        this.view=null;
    }
}
