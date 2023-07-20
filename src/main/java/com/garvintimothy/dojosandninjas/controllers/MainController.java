package com.garvintimothy.dojosandninjas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.garvintimothy.dojosandninjas.models.Dojo;
import com.garvintimothy.dojosandninjas.models.Ninja;
import com.garvintimothy.dojosandninjas.services.DojoService;
import com.garvintimothy.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	@Autowired
	DojoService dojoService;
	@Autowired
	NinjaService ninjaService;
	
	@GetMapping("/dojos/new")
		public String index(@ModelAttribute("dojo") Dojo dojo) {
			return "index.jsp";
	}
	@PostMapping("/dojos/add")
	public String main(@ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Dojo> dojos = dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			return "index.jsp";
		} else {
			dojoService.createDojo(dojo);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/dojos/{id}")
		public String viewDojo(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dojo", dojoService.findDojo(id));
		return "viewDojo.jsp";
	}
	
	@GetMapping("/ninjas/new")
	public String ninja(Model model, @ModelAttribute("ninja")Ninja ninja) {
			model.addAttribute("dojos", dojoService.allDojos());
		return "newNinja.jsp";
	}
	@PostMapping("ninjas/add")
	public String addNinja(@ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("dojos", dojoService.allDojos());
			return "newNinja.jsp";
		} else {
			ninjaService.createNinja(ninja);
			return "redirect:/dashboard";
		}
	}
	
	
	@GetMapping("/dashboard")
	public String dashboard(@ModelAttribute("dojos")Dojo dojo, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		
		model.addAttribute("dojos", dojos);
		return "dashboard.jsp";
	}
	
	
}

