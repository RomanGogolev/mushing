package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "membersevent")
public class MemberEvent {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idevent")
    private Event event;

    @Column(name = "surname")
    private String surname;

    @Column(name = "name")
    private String name;

    @Column(name = "fathername")
    private String fathername;

    @Column(name = "city")
    private String city;

    @Column(name = "club")
    private String club;

    @Column(name = "datebirth")
    private Date datebirth;

    @Column(name = "numberphone")
    private String numberphone;

    @Column(name = "email")
    private String email;

    @Column(name = "descr")
    private String descr;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idclassrace")
    private Class clazz;

    @Column(name = "starttime")
    private Time starttime;

    @Column(name = "endtime")
    private Time endtime;

    @Column(name = "position")
    private int position;

    @Column(name = "startnumber")
    private int startnumber;

    @Column(name = "raznost")
    private Time raznost;

    public MemberEvent(){}

    public MemberEvent(Member member, Event event, Class clazz, String descr){
        this.event=event;
        this.surname=member.getSurname();
        this.name=member.getName();
        this.fathername=member.getFathername();
        this.city=member.getCity();
        if(!member.isInFeder()) {
            this.club = member.getFederation().getFederation();
        }
        this.datebirth=member.getDatebirth();
        this.numberphone=member.getPhonenumber();
        this.email=member.getEmail();
        this.descr=descr;
        this.clazz=clazz;
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

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getStartnumber() {
        return startnumber;
    }

    public void setStartnumber(int startnumber) {
        this.startnumber = startnumber;
    }

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

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Class getClazz() {
        return clazz;
    }

    public void setClazz(Class clazz) {
        this.clazz = clazz;
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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getClub() {
        return club;
    }

    public void setClub(String club) {
        this.club = club;
    }

    public Date getDatebirth() {
        return datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public String getNumberphone() {
        return numberphone;
    }

    public void setNumberphone(String numberphone) {
        this.numberphone = numberphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

}
