package org.mushing.reports.forms;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by roman on 09.01.17.
 */
public class UploadForm {

    protected MultipartFile data;

    public MultipartFile getData() {
        return this.data;
    }

    public void setData(MultipartFile data) {
        this.data = data;
    }
}
