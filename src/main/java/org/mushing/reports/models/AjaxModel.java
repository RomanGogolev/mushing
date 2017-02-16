package org.mushing.reports.models;

/**
 * Created by roman on 10.02.17.
 */
public class AjaxModel {
    private Integer id;
    private String name;
    public AjaxModel(Integer id, String name){
        this.id=id;
        this.name=name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
