package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.models.*;
import org.mushing.reports.models.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.Collections;
import java.util.Comparator;
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
    TimeManager timeManager;

    @Autowired
    FciGroupManager fciGroupManager;

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

    @RequestMapping(value = "/secure/classesinfo", method = RequestMethod.GET)
    public String classesinfoview(Model model) {
        return "secure/documents/classesinfo";
    }

    @RequestMapping(value = "/secure/reports", method = RequestMethod.GET)
    public String reportsview(Model model) {
        return "secure/documents/reports";
    }

    @RequestMapping(value = "/secure/rules", method = RequestMethod.GET)
    public String rulesview(Model model) {
        return "secure/documents/rules";
    }

    @RequestMapping(value = "/secure/statements", method = RequestMethod.GET)
    public String statementsview(Model model) {
        return "secure/documents/statements";
    }

    @RequestMapping(value = "/secure/blanks", method = RequestMethod.GET)
    public String blanksview(Model model) {
        return "secure/documents/blanks";
    }

    @RequestMapping(value = "/secure/anothermembers", method = RequestMethod.GET)
    public String anothermembersview(Model model) {
        List<Federation> federations = federationManager.getAll();
        List<Member> members = memberManager.getAllFromNotFeder();
        Date date = new Date(new java.util.Date().getTime());
        model.addAttribute("federations",federations);
        model.addAttribute("day", date.getDate());
        model.addAttribute("month",date.getMonth()+1);
        model.addAttribute("members",members);
        return "secure/home";
    }

    @RequestMapping(value = "/secure/anotherdogs", method = RequestMethod.GET)
    public String anotherdogsview(Model model) {
        List<Dog> dogs = dogManager.getAllFromNotFeder();
        List<Fcigroup> fcigroups = fciGroupManager.getAll();
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("federations",federations);
        model.addAttribute("fcigroups",fcigroups);
        model.addAttribute("dogs",dogs);
        return "secure/dogs";
    }

    @RequestMapping(value = "/secure", method = RequestMethod.GET)
    public String home(Model model){
        List<Member> birthmembers = memberManager.birthMembers();
        Collections.sort(birthmembers, new Comparator<Member>() {
            @Override
            public int compare(Member t1, Member t2) {
                return t1.getDatebirth().getDate() > t2.getDatebirth().getDate() ? 1 : (t1.getDatebirth().getDate() < t2.getDatebirth().getDate() ) ? -1 : 0;
            }
        });
        List<Member> members = memberManager.getAllFromFeder();
        Date date = new Date(new java.util.Date().getTime());
        model.addAttribute("day", date.getDate());
        model.addAttribute("month",date.getMonth()+1);
        model.addAttribute("birthmembers", birthmembers);
        model.addAttribute("members",members);
        return "secure/home";
    }

    @RequestMapping(value = "/secure/dogs", method = RequestMethod.GET)
    public String dogs(Model model){
        List<Dog> dogs = dogManager.getAllFromFeder();
        List<Fcigroup> fcigroups = fciGroupManager.getAll();
        model.addAttribute("fcigroups",fcigroups);
        model.addAttribute("dogs",dogs);
        return "secure/dogs";
    }

    @RequestMapping(value = "/secure/events", method = RequestMethod.GET)
    public String events(Model model){
        List<Event> events = eventManager.getAll();
        model.addAttribute("events",events);
        return "secure/events";
    }

    @RequestMapping(value = "/secure/event-view", method = RequestMethod.GET)
    public String eventview(@RequestParam int id, Model model){
        Event event = eventManager.get(id);
        List<Distance> distances = distanceManager.getByEventId(id);
        List<JudgeType> judgeTypes = judgeTypeManager.getAll();
        List<Judge> judges = judgeManager.getByEventId(id);
        List<Class> classes = classManager.getAll();
        List<MemberEvent> memberEvents = memberEventManager.getByEventId(id);
        model.addAttribute("classes",classes);
        model.addAttribute("memberEvents",memberEvents);
        model.addAttribute("judges",judges);
        model.addAttribute("judgeTypes",judgeTypes);
        model.addAttribute("event",event);
        model.addAttribute("distances",distances);
        return "secure/preview/event";
    }

    @RequestMapping(value = "/secure/dog-view", method = RequestMethod.GET)
    public String dogview(@RequestParam int id, Model model){
        Dog dog = dogManager.get(id);
        List<Fcigroup> fcigroups = fciGroupManager.getAll();
        model.addAttribute("fcigroups",fcigroups);
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

    @RequestMapping(value = "/secure/fci", method = RequestMethod.GET)
    public String fci(Model model){
        List<Fcigroup> fcigroups = fciGroupManager.getAll();
        model.addAttribute("fcigroups",fcigroups);
        return "secure/settings/fcigroups";
    }

    @RequestMapping(value = "/secure/memberevent-view", method = RequestMethod.GET)
    public String membereventview(@RequestParam int id, @RequestParam int idevent,Model model){
        MemberEvent memberEvent = memberEventManager.get(id);
        List<DogEvent> dogEvents = dogEventManager.getByIdMember(id);
        List<Breed> breeds = breedManager.getAll();
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("federations",federations);
        model.addAttribute("dogevents",dogEvents);
        model.addAttribute("breeds",breeds);
        model.addAttribute("memberevent",memberEvent);
        return "secure/preview/memberevent";
    }

    @RequestMapping(value = "/secure/dogevent-view", method = RequestMethod.GET)
    public String dogeventview(@RequestParam int id,Model model){
        DogEvent dogEvent = dogEventManager.get(id);
        List<Breed> breeds = breedManager.getAll();
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("dogevent",dogEvent);
        model.addAttribute("federations",federations);
        model.addAttribute("breeds",breeds);
        return "secure/preview/dogevent";
    }

}
