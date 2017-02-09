package org.mushing.reports.models;

/**
 * Created by roman on 09.01.17.
 */
public class UploadedFile {

    public UploadedFile(String name){
        this.name=name;
        splitName(name);
    }

    private String name;

    private String withoutFormat="";

    private String format="";

    public String getFormat() {
        return format;
    }

    public String getWithoutFormat() {
        return withoutFormat;
    }

    public void setWithoutFormat(String withoutFormat) {
        this.withoutFormat = withoutFormat;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private void splitName(String name){
        String[] parts = name.split("\\.");
        for(int i=0;i<parts.length-1;i++){
            this.withoutFormat += parts[i];
        }
        format=parts[parts.length-1];
    }
}
