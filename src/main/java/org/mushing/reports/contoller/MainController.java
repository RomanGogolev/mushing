package org.mushing.reports.contoller;

import org.mushing.reports.dao.*;
import org.mushing.reports.forms.DogCreateForm;
import org.mushing.reports.forms.EventCreateForm;
import org.mushing.reports.forms.MemberCreateForm;
import org.mushing.reports.models.*;
import org.mushing.reports.models.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

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

	//View

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
		model.addAttribute("event",event);
		model.addAttribute("rank",rank);
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

	//view settings

	@RequestMapping(value = "/secure/classes", method = RequestMethod.GET)
	public String classes(Model model){
		List<Class> classes = classManager.getAll();
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

	//create

	@RequestMapping(value = "/secure/class-create", method = RequestMethod.GET)
	public String classcreate(Model model,@RequestParam String classrace, @RequestParam String season){
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
		//TODO add to load image
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
		Event event1 = eventManager.create(event);
		System.out.println(event1.getHeaderevent()+" "+event1.getIdrank());
		return "redirect:/secure/events";
	}

	//edit



	//delete

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

}
