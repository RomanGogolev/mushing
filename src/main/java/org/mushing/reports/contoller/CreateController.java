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

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by roman on 23.11.16.
 */
@Controller
public class CreateController {

    private String UPLOAD_DIRECTORY="/tmp";

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

    @RequestMapping(value = "/fci-create", method = RequestMethod.GET)
    public String fcicreate(Model model, @RequestParam String fci){
        Fcigroup fcigroup = new Fcigroup();
        fcigroup.setFci(fci);
        fciGroupManager.create(fcigroup);
        return "redirect:/fci";
    }


    @RequestMapping(value = "/class-create", method = RequestMethod.GET)
    public String classcreate(Model model, @RequestParam String classrace, @RequestParam String season,
                              @RequestParam String rkfname, @RequestParam String fesname){
        Class c = new Class();
        c.setClassrace(classrace);
        c.setFesname(fesname);
        c.setRkfname(rkfname);
        c.setSeason(season);
        classManager.create(c);
        return "redirect:/classes";
    }

    @RequestMapping(value = "/breed-create", method = RequestMethod.GET)
    public String breedcreate(Model model, @RequestParam String breed){
        Breed b = new Breed();
        b.setBreed(breed);
        breedManager.create(b);
        return "redirect:/breeds";
    }

    @RequestMapping(value = "/federation-create", method = RequestMethod.GET)
    public String federationcreate(Model model, @RequestParam String federation){
        Federation f = new Federation();
        f.setFederation(federation);
        federationManager.create(f);
        return "redirect:/federations";
    }

    @RequestMapping(value = "/judge-create", method = RequestMethod.GET)
    public String judgecreate(Model model, @RequestParam String type){
        JudgeType judgeType = new JudgeType();
        judgeType.setType(type);
        judgeTypeManager.create(judgeType);
        return "redirect:/judges";
    }

    @RequestMapping(value = "/rank-create", method = RequestMethod.GET)
    public String rankcreate(Model model, @RequestParam String rank){
        Rank r = new Rank();
        r.setRank(rank);
        rankManager.create(r);
        return "redirect:/ranks";
    }

    @RequestMapping(value = "/distance-create", method = RequestMethod.POST)
    public String distancecreate(
            RedirectAttributes redirectAttributes,
            DistanceCreateForm distanceCreateForm,
            BindingResult result,
            Model model){
        Distance distance = new Distance();
        distance.setCountround(distanceCreateForm.getCountRound());
        distance.setEvent(eventManager.get(distanceCreateForm.getIdEvent()));
        distance.setLengthround(distanceCreateForm.getLengthRound());
        distance.setLowerdot(distanceCreateForm.getLowerDot());
        distance.setStadion(distanceCreateForm.getStadion());
        distance.setTair(distanceCreateForm.getTair());
        distance.setTsnow(distanceCreateForm.getTsnow());
        distance.setUpperdot(distanceCreateForm.getUpperDot());
        distance.setView(distanceCreateForm.getView());
        distance.setWeather(distanceCreateForm.getWeather());
        distanceManager.create(distance);
        return "redirect:/event-view?id="+distance.getEvent().getId();
    }

    @RequestMapping(value = "/judge-create", method = RequestMethod.POST)
    public String judgecreate(
            RedirectAttributes redirectAttributes,
            JudgeCreateForm judgeCreateForm,
            BindingResult result,
            Model model){
        Judge judge = new Judge();
        judge.setFio(judgeCreateForm.getFio());
        judge.setEvent(eventManager.get(judgeCreateForm.getIdEvent()));
        judge.setJudgefrom(judgeCreateForm.getJudgeFrom());
        judge.setType(judgeTypeManager.get(judgeCreateForm.getTypeId()));
        judgeManager.create(judge);
        return "redirect:/event-view?id="+judge.getEvent().getId();
    }

    @RequestMapping(value = "/dog-create", method = RequestMethod.POST)
    public String dogcreate(
            RedirectAttributes redirectAttributes,
            DogCreateForm dogCreateForm,
            BindingResult result,
            Model model){
        Dog dog = new Dog();
        dog.setDatebirth(dogCreateForm.getDateBirth());
        dog.setFcigroup(fciGroupManager.get(dogCreateForm.getIdfciGroup()));
        dog.setFullname(dogCreateForm.getFullName());
        dog.setHomename(dogCreateForm.getHomeName());
        dog.setMarknumber(dogCreateForm.getMarkNumber());
        dog.setNumberchip(dogCreateForm.getNumberChip());
        dog.setNumberpedigree(dogCreateForm.getNumberPedigree());
        dog.setOwnername(dogCreateForm.getOwnerName());
        if(dogCreateForm.getIdfederation()!=null){
            dog.setInFeder(false);
            dog.setFederation(federationManager.get(dogCreateForm.getIdfederation()));
        } else {
            dog.setInFeder(true);
        }
        dogManager.create(dog);
        return "redirect:/dogs";
    }

    @Autowired
    HttpServletRequest request;

    @RequestMapping(value = "/member-create", method = RequestMethod.POST)
    public String membercreate(
            RedirectAttributes redirectAttributes,
            MemberCreateForm memberCreateForm,
            BindingResult result,
            Model model){
        Member member = new Member();
        member.setName(memberCreateForm.getName());
        member.setSurname(memberCreateForm.getSurname());
        member.setFathername(memberCreateForm.getFathername());
        member.setDatebirth(memberCreateForm.getDatebirth());
        member.setDateenter(new java.sql.Date(new java.util.Date().getTime()));
        member.setEmail(memberCreateForm.getEmail());
        member.setPhonenumber(memberCreateForm.getPhonenumber());
        member.setSex(memberCreateForm.getSex());
        member.setCity(memberCreateForm.getCity());
        if(memberCreateForm.getIdfederation()!=null){
            member.setFederation(federationManager.get(memberCreateForm.getIdfederation()));
            member.setInFeder(false);
        } else {
            MultipartFile data = memberCreateForm.getData();
            String [] format = data.getOriginalFilename().split("\\.");
            try {
                if(!data.isEmpty()) {
                    if(! new File(UPLOAD_DIRECTORY).exists())
                    {
                        new File(UPLOAD_DIRECTORY).mkdir();
                    }
                    String filePath = UPLOAD_DIRECTORY + memberCreateForm.getEmail() + "." + format[format.length - 1];
                    File dest = new File(filePath);
                    data.transferTo(dest);
                    member.setImg(dest.getAbsolutePath());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            member.setInFeder(true);
        }
        memberManager.create(member);
        return "redirect:";
    }

    @RequestMapping(value = "/event-create", method = RequestMethod.POST)
    public String eventcreate(
            RedirectAttributes redirectAttributes,
            EventCreateForm eventCreateForm,
            BindingResult result,
            Model model){
        Event event = new Event();
        event.setSeason(eventCreateForm.getSeason());
        event.setDatestart(eventCreateForm.getDateStart());
        event.setHeaderevent(eventCreateForm.getHeaderEvent());
        event.setOrganizers(eventCreateForm.getOrganizers());
        event.setPlace(eventCreateForm.getPlace());
        eventManager.create(event);
        return "redirect:/events";
    }

    @RequestMapping(value = "/memberevent-create", method = RequestMethod.POST)
    public String membereventcreate(
            RedirectAttributes redirectAttributes,
            MemberEventCreateForm memberEventCreateForm,
            BindingResult result,
            Model model){
        MemberEvent memberEvent = new MemberEvent();
        memberEvent.setName(memberEventCreateForm.getName());
        memberEvent.setSurname(memberEventCreateForm.getSurname());
        memberEvent.setFathername(memberEventCreateForm.getFathername());
        memberEvent.setEvent(eventManager.get(memberEventCreateForm.getIdevent()));
        memberEvent.setCity(memberEventCreateForm.getCity());
        memberEvent.setClub(memberEventCreateForm.getClub());
        memberEvent.setDatebirth(memberEventCreateForm.getDatebirth());
        memberEvent.setDescr(memberEventCreateForm.getDescr());
        memberEvent.setEmail(memberEventCreateForm.getEmail());
        memberEvent.setClazz(classManager.get(memberEventCreateForm.getIdclassrace()));
        memberEvent.setNumberphone(memberEventCreateForm.getNumberphone());
        memberEventManager.create(memberEvent);
        return "redirect:/event-view?id="+memberEvent.getEvent().getId();
    }

    @RequestMapping(value = "/dogevent-create", method = RequestMethod.POST)
    public String dogeventcreate(
            RedirectAttributes redirectAttributes,
            DogEventCreateForm dogEventCreateForm,
            BindingResult result,
            Model model){
        DogEvent dogEvent = new DogEvent();
        dogEvent.setEvent(eventManager.get(dogEventCreateForm.getIdevent()));
        dogEvent.setBreed(breedManager.get(dogEventCreateForm.getIdbreed()));
        dogEvent.setFederation(federationManager.get(dogEventCreateForm.getIdfederation()));
        dogEvent.setMember(memberManager.get(dogEventCreateForm.getIdmember()));
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
        return "redirect:/memberevent-view?id="+dogEvent.getMember().getId()+"&idevent="+dogEvent.getEvent().getId();
    }

}
