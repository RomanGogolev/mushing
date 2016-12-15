package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.forms.*;
import org.mushing.reports.models.*;
import org.mushing.reports.models.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
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
    FciGroupManager fciGroupManager;

    @RequestMapping(value = "/secure/dog-edit", method = RequestMethod.POST)
    public String dogedit(
            RedirectAttributes redirectAttributes,
            DogEditForm dogEditForm,
            BindingResult result,
            Model model){
        Dog dog = new Dog();
        dog.setId(dogEditForm.getId());
        dog.setDatebirth(dogEditForm.getDateBirth());
        dog.setIdfcigroup(dogEditForm.getIdfciGroup());
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
        Member member = new Member();
        member.setId(memberEditForm.getId());
        member.setName(memberEditForm.getName());
        member.setSurname(memberEditForm.getSurname());
        member.setFathername(memberEditForm.getFathername());
        member.setDatebirth(memberEditForm.getDatebirth());
        member.setDateenter(new java.sql.Date(new java.util.Date().getDate()));
        member.setEmail(memberEditForm.getEmail());
        member.setPhonenumber(memberEditForm.getPhonenumber());
        member.setSex(memberEditForm.getSex());
        member.setDateenter(memberEditForm.getDateenter());
        member.setCity(memberEditForm.getCity());
        MultipartFile data = memberEditForm.getData();
        String [] format = data.getOriginalFilename().split("\\.");
        File file = new File("images/"+memberEditForm.getEmail()+"."+format[format.length-1]);
        if(file.exists()){
            file.delete();
        }
        file.mkdirs();
        try {
            file.createNewFile();
            data.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        member.setImg(file.getAbsolutePath());
        memberManager.edit(member);
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
        List<Fcigroup> fcigroups = fciGroupManager.getAll();
        model.addAttribute("fcigroups",fcigroups);
        model.addAttribute("dog",dog);
        return "secure/edit/dog";
    }

    @RequestMapping(value = "/secure/member-edit", method = RequestMethod.GET)
    public String membereditview(@RequestParam int id, Model model){
        Member member = memberManager.get(id);
        model.addAttribute("member",member);
        return "secure/edit/member";
    }

    @RequestMapping(value = "/secure/memberevent-edit", method = RequestMethod.GET)
    public String membereventeditview(@RequestParam int id, Model model){
        MemberEvent memberEvent = memberEventManager.get(id);
        List<Class> classes = classManager.getAll();
        Event event = eventManager.get(memberEvent.getIdevent());
        model.addAttribute("memberevent",memberEvent);
        model.addAttribute("classes",classes);
        model.addAttribute("event",event);
        return "secure/edit/memberevent";
    }

    @RequestMapping(value = "/secure/memberevent-edit", method = RequestMethod.POST)
    public String membereventedit(
            RedirectAttributes redirectAttributes,
            MemberEventEditForm memberEventEditForm,
            BindingResult result,
            Model model){
        MemberEvent memberEvent = new MemberEvent();
        memberEvent.setName(memberEventEditForm.getName());
        memberEvent.setSurname(memberEventEditForm.getSurname());
        memberEvent.setFathername(memberEventEditForm.getFathername());
        memberEvent.setId(memberEventEditForm.getId());
        memberEvent.setNumberphone(memberEventEditForm.getNumberphone());
        memberEvent.setIdclassrace(memberEventEditForm.getIdclassrace());
        memberEvent.setEmail(memberEventEditForm.getEmail());
        memberEvent.setCity(memberEventEditForm.getCity());
        memberEvent.setClub(memberEventEditForm.getClub());
        memberEvent.setDatebirth(memberEventEditForm.getDatebirth());
        memberEvent.setDescr(memberEventEditForm.getDescr());
        memberEvent.setIdevent(memberEventEditForm.getIdevent());
        memberEventManager.edit(memberEvent);
        return "redirect:/secure/event-view?id="+memberEvent.getIdevent();
    }

    @RequestMapping(value = "/secure/dogevent-edit", method = RequestMethod.POST)
    public String dogeventedit(
            RedirectAttributes redirectAttributes,
            DogEventEditForm dogEventEditForm,
            BindingResult result,
            Model model){
        DogEvent dogEvent = new DogEvent();
        dogEvent.setId(dogEventEditForm.getId());
        dogEvent.setIdevent(dogEventEditForm.getIdevent());
        dogEvent.setIdbreed(dogEventEditForm.getIdbreed());
        dogEvent.setIdfederation(dogEventEditForm.getIdfederation());
        dogEvent.setIdmember(dogEventEditForm.getIdmember());
        dogEvent.setDateBirth(dogEventEditForm.getDatebirth());
        dogEvent.setFioowner(dogEventEditForm.getFioowner());
        dogEvent.setInqualification(dogEventEditForm.isInqualification());
        dogEvent.setMarknumber(dogEventEditForm.getMarknumber());
        dogEvent.setNameonpedigree(dogEventEditForm.getNameonpedigree());
        dogEvent.setNumberbookkv(dogEventEditForm.getNumberbookkv());
        dogEvent.setNumberchip(dogEventEditForm.getNumberchip());
        dogEvent.setNumberpedigree(dogEventEditForm.getNumberpedigree());
        dogEvent.setSex(dogEventEditForm.getSex());
        dogEventManager.edit(dogEvent);
        return "redirect:/secure/memberevent-view?&id="+dogEvent.getIdmember()+"&idevent="+dogEvent.getIdevent();
    }

    @RequestMapping(value = "/secure/dogevent-edit", method = RequestMethod.GET)
    public String dogeventeditview(@RequestParam int id, Model model){
        DogEvent dogEvent = dogEventManager.get(id);
        model.addAttribute("dogevent",dogEvent);
        List<Breed> breeds = breedManager.getAll();
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("federations",federations);
        model.addAttribute("breeds",breeds);
        return "secure/edit/dogevent";
    }

}
