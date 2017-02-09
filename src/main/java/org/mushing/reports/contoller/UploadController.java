package org.mushing.reports.contoller;

import org.mushing.reports.forms.UploadForm;
import org.mushing.reports.models.UploadedFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by roman on 22.01.17.
 */
@Controller
public class UploadController {

    private String UPLOAD_DIRECTORY_RULES="/tmp";

    private String UPLOAD_DIRECTORY_BLANKS="/tmp";

    private String UPLOAD_DIRECTORY_STATEMENTS="/tmp";

    private String UPLOAD_DIRECTORY_REPORTS="/tmp";

    @RequestMapping(value = "/rules/upload", method = RequestMethod.POST)
    public String uploadRules(UploadForm uploadForm, Model model){
        MultipartFile data = uploadForm.getData();
        try {
            if(!data.isEmpty()) {
                if(! new File(UPLOAD_DIRECTORY_RULES).exists())
                {
                    new File(UPLOAD_DIRECTORY_RULES).mkdir();
                }
                String filePath = UPLOAD_DIRECTORY_RULES + data.getOriginalFilename();
                File dest = new File(filePath);
                if(dest.exists()){
                    int i=1;
                    while(dest.exists()){
                        UploadedFile uploadedFile = new UploadedFile(data.getOriginalFilename());
                        dest = new File(UPLOAD_DIRECTORY_RULES+uploadedFile.getWithoutFormat()+"("+i+")."+uploadedFile.getFormat());
                        i++;
                    }
                    data.transferTo(dest);
                } else {
                    data.transferTo(dest);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/rules";
    }
    @RequestMapping(value = "/blanks/upload", method = RequestMethod.POST)
    public String uploadBlanks(UploadForm uploadForm, Model model){
        MultipartFile data = uploadForm.getData();
        try {
            if(!data.isEmpty()) {
                if(! new File(UPLOAD_DIRECTORY_BLANKS).exists())
                {
                    new File(UPLOAD_DIRECTORY_BLANKS).mkdir();
                }
                String filePath = UPLOAD_DIRECTORY_BLANKS + data.getOriginalFilename();
                File dest = new File(filePath);
                if(dest.exists()){
                    int i=1;
                    while(dest.exists()){
                        UploadedFile uploadedFile = new UploadedFile(data.getOriginalFilename());
                        dest = new File(UPLOAD_DIRECTORY_BLANKS+uploadedFile.getWithoutFormat()+"("+i+")."+uploadedFile.getFormat());
                        i++;
                    }
                    data.transferTo(dest);
                } else {
                    data.transferTo(dest);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/blanks";
    }
    @RequestMapping(value = "/statements/upload", method = RequestMethod.POST)
    public String uploadStatements(UploadForm uploadForm, Model model){
        MultipartFile data = uploadForm.getData();
        try {
            if(!data.isEmpty()) {
                if(! new File(UPLOAD_DIRECTORY_STATEMENTS).exists())
                {
                    new File(UPLOAD_DIRECTORY_STATEMENTS).mkdir();
                }
                String filePath = UPLOAD_DIRECTORY_STATEMENTS + data.getOriginalFilename();
                File dest = new File(filePath);
                if(dest.exists()){
                    int i=1;
                    while(dest.exists()){
                        UploadedFile uploadedFile = new UploadedFile(data.getOriginalFilename());
                        dest = new File(UPLOAD_DIRECTORY_STATEMENTS+uploadedFile.getWithoutFormat()+"("+i+")."+uploadedFile.getFormat());
                        i++;
                    }
                    data.transferTo(dest);
                } else {
                    data.transferTo(dest);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/statements";
    }

    @RequestMapping(value = "/reports/upload", method = RequestMethod.POST)
    public String uploadReports(UploadForm uploadForm, Model model){
        MultipartFile data = uploadForm.getData();
        try {
            if(!data.isEmpty()) {
                if(! new File(UPLOAD_DIRECTORY_REPORTS).exists())
                {
                    new File(UPLOAD_DIRECTORY_REPORTS).mkdir();
                }
                String filePath = UPLOAD_DIRECTORY_REPORTS + data.getOriginalFilename();
                File dest = new File(filePath);
                if(dest.exists()){
                    int i=1;
                    while(dest.exists()){
                        UploadedFile uploadedFile = new UploadedFile(data.getOriginalFilename());
                        dest = new File(UPLOAD_DIRECTORY_REPORTS+uploadedFile.getWithoutFormat()+"("+i+")."+uploadedFile.getFormat());
                        i++;
                    }
                    data.transferTo(dest);
                } else {
                    data.transferTo(dest);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/reports";
    }
}
