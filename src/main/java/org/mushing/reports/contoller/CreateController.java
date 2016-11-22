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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/secure/dog-create", method = RequestMethod.GET)
    public String dogcreateview(Model model){
        return "/secure/create/dog";
    }

    @RequestMapping(value = "/secure/member-create", method = RequestMethod.GET)
    public String membercreateview(Model model){
        return "/secure/create/member";
    }

    @RequestMapping(value = "/secure/event-create", method = RequestMethod.GET)
    public String eventcreateview(Model model){
        List<Rank> ranks = rankManager.getAll();
        model.addAttribute("ranks",ranks);
        return "/secure/create/event";
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
            HttpServletRequest request,
            RedirectAttributes redirectAttributes,
            MemberCreateForm memberCreateForm,
            BindingResult result,
            Model model){
        Member member = new Member();
        member.setFio(memberCreateForm.getFio());
        member.setDatebirth(memberCreateForm.getDatebirth());
        member.setDateenter(new java.sql.Date(new java.util.Date().getDate()));
        member.setEmail(memberCreateForm.getEmail());
        member.setPhonenumber(memberCreateForm.getPhonenumber());
        member.setSex(memberCreateForm.getSex());
        //// TODO: 22.11.16
        System.out.println(request.getParameter("data"));
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

}
