package org.mushing.reports.models;

import javax.persistence.*;

/**
 * Created by roman on 11.12.16.
 */
@Entity
@Table(name = "fcigroups")
public class Fcigroup {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "fci")
    private String fci;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFci() {
        return fci;
    }

    public void setFci(String fci) {
        this.fci = fci;
    }
}
