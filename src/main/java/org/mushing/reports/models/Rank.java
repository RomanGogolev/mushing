package org.mushing.reports.models;

import org.springframework.context.annotation.Primary;

import javax.persistence.*;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "ranks")
public class Rank {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "rank")
    private String rank;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }
}
