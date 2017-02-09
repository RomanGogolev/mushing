package org.mushing.reports.contoller;

import org.mushing.reports.dao.MemberManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.awt.image.ImageProducer;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Created by roman on 11.12.16.
 */
@Controller
public class ImageController {

    private String UPLOAD_DIRECTORY="/home/roman/Документы/uploaded/";

    @Autowired
    MemberManager memberManager;

    @RequestMapping(value = "/images/{imageId}")
    @ResponseBody
    public byte[] showImage(@PathVariable String imageId)  {
        BufferedImage image=null;
        byte[] imageInByte=null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            image = ImageIO.read(getClass().getResourceAsStream(UPLOAD_DIRECTORY+imageId));
            ImageIO.write( image, "jpg", baos );
            baos.flush();
            imageInByte = baos.toByteArray();
            baos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return imageInByte;
    }
}
