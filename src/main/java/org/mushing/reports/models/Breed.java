package org.mushing.reports.models;

import javax.persistence.*;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "breeds")
public class Breed {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "breed")
    private String breed;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }
}
