package org.mushing.reports.forms;



import java.sql.Date;

/**
 * Created by roman on 21.11.16.
 */
public class EventCreateForm  {

    protected Date dateStart;

    protected String headerEvent;

    protected int idRank;

    protected String organizers;

    protected String place;

    protected String season;

    public Date getDateStart() {
        return this.dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public String getHeaderEvent() {
        return this.headerEvent;
    }

    public void setHeaderEvent(String headerEvent) {
        this.headerEvent = headerEvent;
    }

    public int getIdRank() {
        return this.idRank;
    }

    public void setIdRank(int idRank) {
        this.idRank = idRank;
    }

    public String getOrganizers() {
        return this.organizers;
    }

    public void setOrganizers(String organizers) {
        this.organizers = organizers;
    }

    public String getPlace() {
        return this.place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getSeason() {
        return this.season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public void eraseCredentials() {
        this.dateStart=null;
        this.headerEvent=null;
        this.organizers=null;
        this.place=null;
        this.season=null;
    }
}
