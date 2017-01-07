package org.mushing.reports.models;

import javax.persistence.*;
import javax.print.attribute.standard.MediaSize;

/**
 * Created by roman on 12.11.16.
 */
@Entity
@Table(name = "judges")
public class Judge {
    @Id
    @Column(name = "id",unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "idevent")
    private Event event;

    @Column(name = "judgefrom")
    private String judgefrom;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "typeid")
    private JudgeType type;

    @Column(name = "fio")
    private String fio;

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

    public String getJudgefrom() {
        return judgefrom;
    }

    public void setJudgefrom(String judgefrom) {
        this.judgefrom = judgefrom;
    }

    public JudgeType getType() {
        return type;
    }

    public void setType(JudgeType type) {
        this.type = type;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }
}
