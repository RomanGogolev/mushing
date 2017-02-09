package org.mushing.reports.forms;



/**
 * Created by roman on 23.11.16.
 */
public class JudgeCreateForm  {

    protected String fio;

    protected int idEvent;

    protected String judgeFrom;

    protected int typeId;

    public String getFio() {
        return this.fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public int getIdEvent() {
        return this.idEvent;
    }

    public void setIdEvent(int idEvent) {
        this.idEvent = idEvent;
    }

    public String getJudgeFrom() {
        return this.judgeFrom;
    }

    public void setJudgeFrom(String judgeFrom) {
        this.judgeFrom = judgeFrom;
    }

    public int getTypeId() {
        return this.typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public void eraseCredentials() {
        this.fio=null;
        this.judgeFrom=null;
    }
}
