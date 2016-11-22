package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by roman on 23.11.16.
 */
@Controller
public class ViewController {
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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login(Model model) {
        if(SecurityContextHolder.getContext().getAuthentication().getAuthorities().toArray()[0].toString().equals("ROLE_ANONYMOUS")){
            return "index";
        } else return "redirect:/secure";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String errorLogin(Model model) {
        model.addAttribute("error","Wrong login or password");
        return "index";
    }

    @RequestMapping(value = "/secure", method = RequestMethod.GET)
    public String home(Model model){
        List<Member> members = memberManager.getAll();
        model.addAttribute("members",members);
        return "secure/home";
    }

    @RequestMapping(value = "/secure/dogs", method = RequestMethod.GET)
    public String dogs(Model model){
        List<Dog> dogs = dogManager.getAll();
        model.addAttribute("dogs",dogs);
        return "secure/dogs";
    }

    @RequestMapping(value = "/secure/events", method = RequestMethod.GET)
    public String events(Model model){
        List<Event> events = eventManager.getAll();
        model.addAttribute("events",events);
        return "secure/events";
    }

    @RequestMapping(value = "/secure/search", method = RequestMethod.GET)
    public String search(Model model, @RequestParam String search, @RequestParam String name){
        return "secure/search";
    }

    @RequestMapping(value = "/secure/event-view", method = RequestMethod.GET)
    public String eventview(@RequestParam int id, Model model){
        Event event = eventManager.get(id);
        Rank rank = rankManager.get(event.getIdrank());
        List<Distance> distances = distanceManager.getByEventId(id);
        List<JudgeType> judgeTypes = judgeTypeManager.getAll();
        List<Judge> judges = judgeManager.getByEventId(id);
        model.addAttribute("judges",judges);
        model.addAttribute("judgeTypes",judgeTypes);
        model.addAttribute("event",event);
        model.addAttribute("rank",rank);
        model.addAttribute("distances",distances);
        return "secure/preview/event";
    }

    @RequestMapping(value = "/secure/dog-view", method = RequestMethod.GET)
    public String dogview(@RequestParam int id, Model model){
        Dog dog = dogManager.get(id);
        model.addAttribute("dog",dog);
        return "secure/preview/dog";
    }

    @RequestMapping(value = "/secure/member-view", method = RequestMethod.GET)
    public String memberview(@RequestParam int id, Model model){
        Member member = memberManager.get(id);
        model.addAttribute("member",member);
        return "secure/preview/member";
    }

    @RequestMapping(value = "/secure/classes", method = RequestMethod.GET)
    public String classes(Model model){
        List<org.mushing.reports.models.Class> classes = classManager.getAll();
        model.addAttribute("classes",classes);
        return "secure/settings/classes";
    }

    @RequestMapping(value = "/secure/breeds", method = RequestMethod.GET)
    public String breeds(Model model){
        List<Breed> breeds = breedManager.getAll();
        model.addAttribute("breeds",breeds);
        return "secure/settings/breeds";
    }

    @RequestMapping(value = "/secure/federations", method = RequestMethod.GET)
    public String federations(Model model){
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("federations",federations);
        return "secure/settings/federations";
    }

    @RequestMapping(value = "/secure/judges", method = RequestMethod.GET)
    public String judges(Model model){
        List<JudgeType> judgeTypes = judgeTypeManager.getAll();
        model.addAttribute("judgeTypes",judgeTypes);
        return "secure/settings/judges";
    }

    @RequestMapping(value = "/secure/ranks", method = RequestMethod.GET)
    public String ranks(Model model){
        List<Rank> ranks = rankManager.getAll();
        model.addAttribute("ranks",ranks);
        return "secure/settings/ranks";
    }

}
