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
}
