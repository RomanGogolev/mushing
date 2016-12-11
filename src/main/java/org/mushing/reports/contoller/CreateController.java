package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.forms.*;
import org.mushing.reports.models.*;
import org.mushing.reports.models.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by roman on 23.11.16.
 */
@Controller
public class CreateController {
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

    @Autowired
    TimeManager timeManager;

    @RequestMapping(value = "/secure/class-create", method = RequestMethod.GET)
    public String classcreate(Model model, @RequestParam String classrace, @RequestParam String season){
        Class c = new Class();
        c.setClassrace(classrace);
        c.setSeason(season);
        classManager.create(c);
        return "redirect:/secure/classes";
    }

    @RequestMapping(value = "/secure/breed-create", method = RequestMethod.GET)
    public String breedcreate(Model model, @RequestParam String breed){
        Breed b = new Breed();
        b.setBreed(breed);
        breedManager.create(b);
        return "redirect:/secure/breeds";
    }

    @RequestMapping(value = "/secure/federation-create", method = RequestMethod.GET)
    public String federationcreate(Model model, @RequestParam String federation){
        Federation f = new Federation();
        f.setFederation(federation);
        federationManager.create(f);
        return "redirect:/secure/federations";
    }

    @RequestMapping(value = "/secure/judge-create", method = RequestMethod.GET)
    public String judgecreate(Model model, @RequestParam String type){
        JudgeType judgeType = new JudgeType();
        judgeType.setType(type);
        judgeTypeManager.create(judgeType);
        return "redirect:/secure/judges";
    }

    @RequestMapping(value = "/secure/rank-create", method = RequestMethod.GET)
    public String rankcreate(Model model, @RequestParam String rank){
        Rank r = new Rank();
        r.setRank(rank);
        rankManager.create(r);
        return "redirect:/secure/ranks";
    }

    @RequestMapping(value = "/secure/distance-create", method = RequestMethod.POST)
    public String distancecreate(
            RedirectAttributes redirectAttributes,
            DistanceCreateForm distanceCreateForm,
            BindingResult result,
            Model model){
        Distance distance = new Distance();
        distance.setCountround(distanceCreateForm.getCountRound());
        distance.setIdevent(distanceCreateForm.getIdEvent());
        distance.setLengthround(distanceCreateForm.getLengthRound());
        distance.setLowerdot(distanceCreateForm.getLowerDot());
        distance.setStadion(distanceCreateForm.getStadion());
        distance.setTair(distanceCreateForm.getTair());
        distance.setTsnow(distanceCreateForm.getTsnow());
        distance.setUpperdot(distanceCreateForm.getUpperDot());
        distance.setView(distanceCreateForm.getView());
        distance.setWeather(distanceCreateForm.getWeather());
        distanceManager.create(distance);
        return "redirect:/secure/event-view?id="+distance.getIdevent();
    }

    @RequestMapping(value = "/secure/judge-create", method = RequestMethod.POST)
    public String judgecreate(
            RedirectAttributes redirectAttributes,
            JudgeCreateForm judgeCreateForm,
            BindingResult result,
            Model model){
        Judge judge = new Judge();
        judge.setFio(judgeCreateForm.getFio());
        judge.setIdevent(judgeCreateForm.getIdEvent());
        judge.setJudgefrom(judgeCreateForm.getJudgeFrom());
        judge.setTypeid(judgeCreateForm.getTypeId());
        judgeManager.create(judge);
        return "redirect:/secure/event-view?id="+judge.getIdevent();
    }

    @RequestMapping(value = "/secure/dog-create", method = RequestMethod.POST)
    public String dogcreate(
            RedirectAttributes redirectAttributes,
            DogCreateForm dogCreateForm,
            BindingResult result,
            Model model){
        Dog dog = new Dog();
        dog.setDatebirth(dogCreateForm.getDateBirth());
        dog.setFcigroup(dogCreateForm.getFciGroup());
        dog.setFullname(dogCreateForm.getFullName());
        dog.setHomename(dogCreateForm.getHomeName());
        dog.setMarknumber(dogCreateForm.getMarkNumber());
        dog.setNumberchip(dogCreateForm.getNumberChip());
        dog.setNumberpedigree(dogCreateForm.getNumberPedigree());
        dog.setOwnername(dogCreateForm.getOwnerName());
        dogManager.create(dog);
        return "redirect:/secure/dogs";
    }

    @RequestMapping(value = "/secure/member-create", method = RequestMethod.POST)
    public String membercreate(
            RedirectAttributes redirectAttributes,
            MemberCreateForm memberCreateForm,
            BindingResult result,
            Model model){
        Member member = new Member();
        member.setFio(memberCreateForm.getFio());
        member.setDatebirth(memberCreateForm.getDatebirth());
        member.setDateenter(new java.sql.Date(new java.util.Date().getTime()));
        member.setEmail(memberCreateForm.getEmail());
        member.setPhonenumber(memberCreateForm.getPhonenumber());
        member.setSex(memberCreateForm.getSex());
        MultipartFile data = memberCreateForm.getData();
        String [] format = data.getOriginalFilename().split("\\.");
        File file = new File("images/"+memberCreateForm.getEmail()+"."+format[format.length-1]);
        file.mkdirs();
        try {
            file.createNewFile();
            data.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        member.setImg(file.getAbsolutePath());
        memberManager.create(member);
        return "redirect:/secure";
    }

    @RequestMapping(value = "/secure/event-create", method = RequestMethod.POST)
    public String eventcreate(
            RedirectAttributes redirectAttributes,
            EventCreateForm eventCreateForm,
            BindingResult result,
            Model model){
        Event event = new Event();
        event.setSeason(eventCreateForm.getSeason());
        event.setDatestart(eventCreateForm.getDateStart());
        event.setHeaderevent(eventCreateForm.getHeaderEvent());
        event.setIdrank(eventCreateForm.getIdRank());
        event.setOrganizers(eventCreateForm.getOrganizers());
        event.setPlace(eventCreateForm.getPlace());
        eventManager.create(event);
        return "redirect:/secure/events";
    }

    @RequestMapping(value = "/secure/memberevent-create", method = RequestMethod.POST)
    public String membereventcreate(
            RedirectAttributes redirectAttributes,
            MemberEventCreateForm memberEventCreateForm,
            BindingResult result,
            Model model){
        MemberEvent memberEvent = new MemberEvent();
        memberEvent.setFio(memberEventCreateForm.getFio());
        memberEvent.setIdevent(memberEventCreateForm.getIdevent());
        memberEvent.setCity(memberEventCreateForm.getCity());
        memberEvent.setClub(memberEventCreateForm.getClub());
        memberEvent.setDatebirth(memberEventCreateForm.getDatebirth());
        memberEvent.setDescr(memberEventCreateForm.getDescr());
        memberEvent.setEmail(memberEventCreateForm.getEmail());
        memberEvent.setIdclassrace(memberEventCreateForm.getIdclassrace());
        memberEvent.setNumberphone(memberEventCreateForm.getNumberphone());
        memberEventManager.create(memberEvent);
        return "redirect:/secure/event-view?id="+memberEvent.getIdevent();
    }

    @RequestMapping(value = "/secure/dogevent-create", method = RequestMethod.POST)
    public String dogeventcreate(
            RedirectAttributes redirectAttributes,
            DogEventCreateForm dogEventCreateForm,
            BindingResult result,
            Model model){
        DogEvent dogEvent = new DogEvent();
        dogEvent.setIdevent(dogEventCreateForm.getIdevent());
        dogEvent.setIdbreed(dogEventCreateForm.getIdbreed());
        dogEvent.setIdfederation(dogEventCreateForm.getIdfederation());
        dogEvent.setIdmember(dogEventCreateForm.getIdmember());
        dogEvent.setDateBirth(dogEventCreateForm.getDatebirth());
        dogEvent.setFioowner(dogEventCreateForm.getFioowner());
        dogEvent.setInqualification(dogEventCreateForm.isInqualification());
        dogEvent.setMarknumber(dogEventCreateForm.getMarknumber());
        dogEvent.setNameonpedigree(dogEventCreateForm.getNameonpedigree());
        dogEvent.setNumberbookkv(dogEventCreateForm.getNumberbookkv());
        dogEvent.setNumberchip(dogEventCreateForm.getNumberchip());
        dogEvent.setNumberpedigree(dogEventCreateForm.getNumberpedigree());
        dogEvent.setSex(dogEventCreateForm.getSex());
        dogEventManager.create(dogEvent);
        return "redirect:/secure/memberevent-view?id="+dogEvent.getIdevent()+"&idmember="+dogEvent.getIdmember();
    }

}
