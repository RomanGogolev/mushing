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

    @RequestMapping(value = "/event-delete", method = RequestMethod.GET)
    public String eventdelete(@RequestParam int id){
        eventManager.delete(id);
        return "redirect:/events";
    }

    @RequestMapping(value = "/dog-delete", method = RequestMethod.GET)
    public String dogdelete(@RequestParam int id){
        dogManager.delete(id);
        return "redirect:/dogs";
    }

    @RequestMapping(value = "/member-delete", method = RequestMethod.GET)
    public String memberdelete(@RequestParam int id){
        memberManager.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/distance-delete", method = RequestMethod.GET)
    public String distancedelete(@RequestParam int id,@RequestParam int idevent){
        distanceManager.delete(id);
        return "redirect:/event-view?id="+idevent;
    }

    @RequestMapping(value = "/judge-delete", method = RequestMethod.GET)
    public String judgeedelete(@RequestParam int id,@RequestParam int idevent){
        judgeManager.delete(id);
        return "redirect:/event-view?id="+idevent;
    }

    @RequestMapping(value = "/memberevent-delete", method = RequestMethod.GET)
    public String membereventdelete(@RequestParam int id,@RequestParam int idevent){
        memberEventManager.delete(id);
        return "redirect:/event-view?id="+idevent;
    }

    @RequestMapping(value = "/dogevent-delete", method = RequestMethod.GET)
    public String dogeventdelete(@RequestParam int id,@RequestParam int idmember){
        DogEvent dogEvent = dogEventManager.get(id);
        dogEventManager.delete(id);
        return "redirect:/memberevent-view?id="+dogEvent.getEvent().getId()+"&idevent="+dogEvent.getEvent().getId();
    }

}
