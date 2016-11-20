package org.mushing.reports.models;

import javax.persistence.*;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "federations")
public class Federation {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "federation")
    private String federation;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFederation() {
        return federation;
    }

    public void setFederation(String federation) {
        this.federation = federation;
    }
}
