package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.models.DogEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by roman on 23.11.16.
 */
@Controller
public class DeleteController {
    @Autowired
    BreedManager breedManager;

    @Autowired
    ClassManager classManager;

    @Autowired
    DistanceManager distanceManager;

    @Autowired
    DogManager dogManager;

    @Autowired
    DogEventManager dogEventManager;

    @Autowired
    EventManager eventManager;

    @Autowired
    FederationManager federationManager;

    @Autowired
    JudgeManager judgeManager;

    @Autowired
    JudgeTypeManager judgeTypeManager;

    @Autowired
    MemberEventManager memberEventManager;

    @Autowired
    MemberManager memberManager;

    @Autowired
    RankManager rankManager;

    @RequestMapping(value = "/secure/event-delete", method = RequestMethod.GET)
    public String eventdelete(@RequestParam int id, Model model){
        eventManager.delete(id);
        return "redirect:/secure/events";
    }

    @RequestMapping(value = "/secure/dog-delete", method = RequestMethod.GET)
    public String dogdelete(@RequestParam int id, Model model){
        dogManager.delete(id);
        return "redirect:/secure/dogs";
    }

    @RequestMapping(value = "/secure/member-delete", method = RequestMethod.GET)
    public String memberdelete(@RequestParam int id, Model model){
        memberManager.delete(id);
        return "redirect:/secure";
    }

    @RequestMapping(value = "/secure/distance-delete", method = RequestMethod.GET)
    public String distancedelete(@RequestParam int id,@RequestParam int idevent, Model model){
        distanceManager.delete(id);
        return "redirect:/secure/event-view?id="+idevent;
    }

    @RequestMapping(value = "/secure/judge-delete", method = RequestMethod.GET)
    public String judgeedelete(@RequestParam int id,@RequestParam int idevent, Model model){
        judgeManager.delete(id);
        return "redirect:/secure/event-view?id="+idevent;
    }

    @RequestMapping(value = "/secure/memberevent-delete", method = RequestMethod.GET)
    public String membereventdelete(@RequestParam int id,@RequestParam int idevent, Model model){
        memberEventManager.delete(id);
        return "redirect:/secure/event-view?id="+idevent;
    }

    @RequestMapping(value = "/secure/dogevent-delete", method = RequestMethod.GET)
    public String dogeventdelete(@RequestParam int id,@RequestParam int idmember, Model model){
        DogEvent dogEvent = dogEventManager.get(id);
        dogEventManager.delete(id);
        return "redirect:/secure/memberevent-view?id="+dogEvent.getIdmember()+"&idevent="+dogEvent.getIdevent();
    }

}
