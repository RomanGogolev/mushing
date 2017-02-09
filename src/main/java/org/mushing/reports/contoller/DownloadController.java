package org.mushing.reports.contoller;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.File;

/**
 * Created by roman on 22.01.17.
 */
@Controller
public class DownloadController {

    private String UPLOAD_DIRECTORY_RULES="/home/roman/Документы/documents/rules/";

    private String UPLOAD_DIRECTORY_BLANKS="/home/roman/Документы/documents/blanks/";

    private String UPLOAD_DIRECTORY_STATEMENTS="/home/roman/Документы/documents/statements/";

    private String UPLOAD_DIRECTORY_REPORTS="/home/roman/Документы/documents/reports/";


    @RequestMapping(value = "/reports/download",method = RequestMethod.GET)
    @ResponseBody
    public FileSystemResource downloadReports(@RequestParam String filename, HttpServletResponse response){
        response.setContentType("application/force-download");
        response.setContentLength((int) new File(UPLOAD_DIRECTORY_REPORTS+filename).length());
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
        return new FileSystemResource(new File(UPLOAD_DIRECTORY_REPORTS+filename));
    }

    @RequestMapping(value = "/statements/download",method = RequestMethod.GET)
    @ResponseBody
    public FileSystemResource downloadStatements(@RequestParam String filename, HttpServletResponse response){
        response.setContentType("application/force-download");
        response.setContentLength((int) new File(UPLOAD_DIRECTORY_STATEMENTS+filename).length());
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
        return new FileSystemResource(new File(UPLOAD_DIRECTORY_STATEMENTS+filename));
    }

    @RequestMapping(value = "/blanks/download",method = RequestMethod.GET)
    @ResponseBody
    public FileSystemResource downloadBlanks(@RequestParam String filename, HttpServletResponse response){
        response.setContentType("application/force-download");
        response.setContentLength((int) new File(UPLOAD_DIRECTORY_BLANKS+filename).length());
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
        return new FileSystemResource(new File(UPLOAD_DIRECTORY_BLANKS+filename));
    }

    @RequestMapping(value = "/rules/download",method = RequestMethod.GET)
    @ResponseBody
    public FileSystemResource downloadRules(@RequestParam String filename, HttpServletResponse response){
        response.setContentType("application/force-download");
        response.setContentLength((int) new File(UPLOAD_DIRECTORY_RULES+filename).length());
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
        return new FileSystemResource(new File(UPLOAD_DIRECTORY_RULES+filename));
    }

}
