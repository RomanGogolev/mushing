package org.mushing.reports.contoller;

import org.mushing.reports.dao.MemberManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

/**
 * Created by roman on 11.12.16.
 */
@Controller
public class ImageController {

    @Autowired
    MemberManager memberManager;

    @ResponseBody
    @RequestMapping(value = "/app/images/{imageName}", method = RequestMethod.GET)
    public byte[] getImage(@PathVariable(value = "imageName") String imageName) throws IOException {
        try {
            // Retrieve image from the classpath.
            File image = new File("/app/images/"+imageName);

            if(image.exists()) {

                image = image.getAbsoluteFile();

                // Prepare buffered image.
                BufferedImage img = ImageIO.read(image);

                // Create a byte array output stream.
                ByteArrayOutputStream bao = new ByteArrayOutputStream();

                // Write to output stream
                ImageIO.write(img, "jpg", bao);

                return bao.toByteArray();
            }else return null;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}
