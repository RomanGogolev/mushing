package org.mushing.reports.models;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "dogs")
public class Dog {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "fullname")
    private String fullname;

    @Column(name = "ownername")
    private String ownername;

    @Column(name = "datebirth")
    private Date datebirth;

    @Column(name = "marknumber")
    private String marknumber;

    @Column(name = "numberpedigree")
    private String numberpedigree;

    @Column(name = "numberchip")
    private String numberchip;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idfcigroup")
    private Fcigroup fcigroup;

    @Column(name = "homename")
    private String homename;

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

    public String getHomename() {
        return homename;
    }

    public void setHomename(String homename) {
        this.homename = homename;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getOwnername() {
        return ownername;
    }

    public void setOwnername(String ownername) {
        this.ownername = ownername;
    }

    public Date getDatebirth() {
        return datebirth;
    }

    public void setDatebirth(Date datebirth) {
        this.datebirth = datebirth;
    }

    public String getMarknumber() {
        return marknumber;
    }

    public void setMarknumber(String marknumber) {
        this.marknumber = marknumber;
    }

    public String getNumberpedigree() {
        return numberpedigree;
    }

    public void setNumberpedigree(String numberpedigree) {
        this.numberpedigree = numberpedigree;
    }

    public String getNumberchip() {
        return numberchip;
    }

    public void setNumberchip(String numberchip) {
        this.numberchip = numberchip;
    }

    public Fcigroup getFcigroup() {
        return fcigroup;
    }

    public void setFcigroup(Fcigroup fcigroup) {
        this.fcigroup = fcigroup;
    }
}
