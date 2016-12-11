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
    ResultManager resultManager;

    @Autowired
    TimeManager timeManager;

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
        List<Member> birthmembers = memberManager.birthMembers();
        Collections.sort(birthmembers, new Comparator<Member>() {
            @Override
            public int compare(Member member, Member t1) {
                return member.getDatebirth().compareTo(t1.getDatebirth());
            }
        });
        List<Member> members = memberManager.getAll();
        Date date = new Date(new java.util.Date().getTime());
        model.addAttribute("day", date.getDay());
        model.addAttribute("month",date.getMonth()+1);
        model.addAttribute("birthmembers", birthmembers);
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

    @RequestMapping(value = "/secure/event-view", method = RequestMethod.GET)
    public String eventview(@RequestParam int id, Model model){
        Event event = eventManager.get(id);
        Rank rank = rankManager.get(event.getIdrank());
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


    @RequestMapping(value = "/secure/dog-create", method = RequestMethod.GET)
    public String dogcreateview(Model model){
        return "secure/create/dog";
    }

    @RequestMapping(value = "/secure/member-create", method = RequestMethod.GET)
    public String membercreateview(Model model){
        return "secure/create/member";
    }

    @RequestMapping(value = "/secure/event-create", method = RequestMethod.GET)
    public String eventcreateview(Model model){
        List<Rank> ranks = rankManager.getAll();
        model.addAttribute("ranks",ranks);
        return "secure/create/event";
    }

    @RequestMapping(value = "/secure/dogevent-create", method = RequestMethod.GET)
    public String dogeventcreateview(@RequestParam int idmember, Model model){
        List<Breed> breeds = breedManager.getAll();
        model.addAttribute("breeds",breeds);
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("federations",federations);
        MemberEvent memberEvent = memberEventManager.get(idmember);
        model.addAttribute("memberevent",memberEvent);
        return "secure/create/dogevent";
    }

    @RequestMapping(value = "/secure/memberevent-view", method = RequestMethod.GET)
    public String membereventview(@RequestParam int id, @RequestParam int idevent,Model model){
        MemberEvent memberEvent = memberEventManager.get(id);
        Class clazz = classManager.get(memberEvent.getIdclassrace());
        List<DogEvent> dogEvents = dogEventManager.getByIdMember(id);
        List<Breed> breeds = breedManager.getAll();
        List<Federation> federations = federationManager.getAll();
        model.addAttribute("federations",federations);
        model.addAttribute("dogevents",dogEvents);
        model.addAttribute("breeds",breeds);
        model.addAttribute("memberevent",memberEvent);
        model.addAttribute("clazz", clazz);
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
