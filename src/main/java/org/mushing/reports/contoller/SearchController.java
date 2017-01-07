package org.mushing.reports.contoller;

import org.mushing.reports.dao.DogManager;
import org.mushing.reports.dao.EventManager;
import org.mushing.reports.dao.MemberManager;
import org.mushing.reports.models.Dog;
import org.mushing.reports.models.Event;
import org.mushing.reports.models.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by roman on 09.12.16.
 */

@Controller
public class SearchController {

    @Autowired
    DogManager dogManager;

    @Autowired
    EventManager eventManager;

    @Autowired
    MemberManager memberManager;

    @RequestMapping(value = "/secure/search", method = RequestMethod.GET)
    public String search(Model model, @RequestParam String search, @RequestParam String name){
        model.addAttribute("search",search);
        if(search.equals("user")){
            List<Member> members = memberManager.searchFeder(name);
            model.addAttribute("members",members);
        }else if(search.equals("dog")){
            List<Dog> dogs = dogManager.searchInFeder(name);
            model.addAttribute("dogs",dogs);
        }else if(search.equals("event")){
            List<Event> events = eventManager.search(name);
            model.addAttribute("events",events);
        }
        return "secure/search";
    }

    @RequestMapping(value = "/secure/searchAnother", method = RequestMethod.GET)
    public String searchAnother(Model model, @RequestParam String search, @RequestParam String name){
        model.addAttribute("search",search);
        if(search.equals("user")){
            List<Member> members = memberManager.searchNotFeder(name);
            model.addAttribute("members",members);
        }else if(search.equals("dog")){
            List<Dog> dogs = dogManager.searchNotInFeder(name);
            model.addAttribute("dogs",dogs);
        }else if(search.equals("event")){
            List<Event> events = eventManager.search(name);
            model.addAttribute("events",events);
        }
        return "secure/search";
    }

}
