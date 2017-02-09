package org.mushing.reports.contoller;

import com.google.gson.Gson;
import org.mushing.reports.dao.MemberManager;
import org.mushing.reports.models.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by roman on 08.01.17.
 */
@Controller
public class AjaxController {

    @Autowired
    private MemberManager memberManager;

    @RequestMapping(value = "/ajax/members", method = RequestMethod.GET,
            headers="Accept=*/*",produces="application/json; charset=UTF-8")
    public @ResponseBody String getMembersList(){
        List<Member> list = memberManager.getAllFromFeder();
        String json = new Gson().toJson(list);
        return json;
    }

}
