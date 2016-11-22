package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.forms.DogEditForm;
import org.mushing.reports.forms.EventEditForm;
import org.mushing.reports.forms.MemberEditForm;
import org.mushing.reports.models.Dog;
import org.mushing.reports.models.Event;
import org.mushing.reports.models.Member;
import org.mushing.reports.models.Rank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by roman on 23.11.16.
 */
@Controller
public class EditController {
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

    @Autowired
    ResultManager resultManager;

    @RequestMapping(value = "/secure/dog-edit", method = RequestMethod.POST)
    public String dogedit(
            RedirectAttributes redirectAttributes,
            DogEditForm dogEditForm,
            BindingResult result,
            Model model){
        Dog dog = new Dog();
        dog.setId(dogEditForm.getId());
        dog.setDatebirth(dogEditForm.getDateBirth());
        dog.setFcigroup(dogEditForm.getFciGroup());
        dog.setFullname(dogEditForm.getFullName());
        dog.setHomename(dogEditForm.getHomeName());
        dog.setMarknumber(dogEditForm.getMarkNumber());
        dog.setNumberchip(dogEditForm.getNumberChip());
        dog.setNumberpedigree(dogEditForm.getNumberPedigree());
        dog.setOwnername(dogEditForm.getOwnerName());
        dogManager.edit(dog);
        return "redirect:/secure/dogs";
    }

    @RequestMapping(value = "/secure/member-edit", method = RequestMethod.POST)
    public String memberedit(
            RedirectAttributes redirectAttributes,
            MemberEditForm memberEditForm,
            BindingResult result,
            Model model){
        //TODO add to load image
        return "redirect:/secure";
    }

    @RequestMapping(value = "/secure/event-edit", method = RequestMethod.POST)
    public String eventedit(
            RedirectAttributes redirectAttributes,
            EventEditForm eventEditForm,
            BindingResult result,
            Model model){
        Event event = new Event();
        event.setId(eventEditForm.getId());
        event.setSeason(eventEditForm.getSeason());
        event.setDatestart(eventEditForm.getDateStart());
        event.setHeaderevent(eventEditForm.getHeaderEvent());
        event.setIdrank(eventEditForm.getIdRank());
        event.setOrganizers(eventEditForm.getOrganizers());
        event.setPlace(eventEditForm.getPlace());
        eventManager.edit(event);
        return "redirect:/secure/events";
    }

    @RequestMapping(value = "/secure/event-edit", method = RequestMethod.GET)
    public String eventeditview(@RequestParam int id, Model model){
        Event event = eventManager.get(id);
        List<Rank> ranks = rankManager.getAll();
        model.addAttribute("event",event);
        model.addAttribute("ranks",ranks);
        return "secure/edit/event";
    }

    @RequestMapping(value = "/secure/dog-edit", method = RequestMethod.GET)
    public String dogeditview(@RequestParam int id, Model model){
        Dog dog = dogManager.get(id);
        model.addAttribute("dog",dog);
        return "secure/edit/dog";
    }

    @RequestMapping(value = "/secure/member-edit", method = RequestMethod.GET)
    public String membereditview(@RequestParam int id, Model model){
        Member member = memberManager.get(id);
        model.addAttribute("member",member);
        return "secure/edit/member";
    }

}
