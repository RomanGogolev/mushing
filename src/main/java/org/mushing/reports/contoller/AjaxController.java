package org.mushing.reports.contoller;

import com.google.gson.Gson;
import org.mushing.reports.dao.DogManager;
import org.mushing.reports.dao.MemberManager;
import org.mushing.reports.models.Dog;
import org.mushing.reports.models.Member;
import org.mushing.reports.models.AjaxModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by roman on 08.01.17.
 */
@Controller
public class AjaxController {

    @Autowired
    private MemberManager memberManager;

    @Autowired
    private DogManager dogManager;

    @RequestMapping(value = "/ajax/members", method = RequestMethod.GET,
            headers="Accept=*/*",produces="application/json; charset=UTF-8", params = "name")
    public @ResponseBody String getMembersList(@RequestParam String name){
        List<Member> listFeder = memberManager.searchFeder(name);
        List<Member> listNotFeder = memberManager.searchNotFeder(name);
        if(listFeder!=null && listFeder.size()>0) {
            if(listNotFeder!=null && listNotFeder.size()>0){
                listFeder.addAll(listNotFeder);
            }
            List<AjaxModel> response = new ArrayList<AjaxModel>();
            for (Member member : listFeder) {
                if (!member.isInFeder()) {
                    response.add(new AjaxModel(member.getId(), member.getSurname() + " " + member.getName() + " " +
                            member.getFathername() + " " + member.getFederation().getFederation()));
                } else {
                    response.add(new AjaxModel(member.getId(), member.getSurname() + " " + member.getName() + " " +
                            member.getFathername() + " Our"));
                }
            }
            String json = new Gson().toJson(response);
            return json;
        }
        if(listNotFeder!=null && listNotFeder.size()>0){
            List<AjaxModel> response = new ArrayList<AjaxModel>();
            for (Member member : listNotFeder) {
                response.add(new AjaxModel(member.getId(), member.getSurname() + " " + member.getName() + " " +
                        member.getFathername() + " " + member.getFederation().getFederation()));
            }
            String json = new Gson().toJson(response);
            return json;
        }
        return null;
    }

    @RequestMapping(value = "/ajax/dogs", method = RequestMethod.GET,
            headers="Accept=*/*",produces="application/json; charset=UTF-8", params = "name")
    public @ResponseBody String getDogsList(@RequestParam String name){
        List<Dog> listFeder = dogManager.searchInFeder(name);
        List<Dog> listNotFeder = dogManager.searchNotInFeder(name);
        if(listFeder!=null && listFeder.size()>0) {
            if(listNotFeder!=null && listNotFeder.size()>0){
                listFeder.addAll(listNotFeder);
            }
            List<AjaxModel> response = new ArrayList<AjaxModel>();
            for (Dog dog : listFeder) {
                if (!dog.isInFeder()) {
                    response.add(new AjaxModel(dog.getId(), dog.getFullname() + " " + dog.getOwnername() + " "
                            + dog.getFederation().getFederation()));
                } else {
                    response.add(new AjaxModel(dog.getId(), dog.getFullname() + " " + dog.getOwnername() + " Our"));
                }
            }
            String json = new Gson().toJson(response);
            return json;
        }
        if(listNotFeder!=null && listNotFeder.size()>0){
            List<AjaxModel> response = new ArrayList<AjaxModel>();
            for (Dog dog : listNotFeder) {
                response.add(new AjaxModel(dog.getId(), dog.getFullname() + " " + dog.getOwnername() + " "
                            + dog.getFederation().getFederation()));
            }
            String json = new Gson().toJson(response);
            return json;
        }
        return null;
    }

}
