package com.stallionscc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/welcome")
public class HomeController {

	@GetMapping("/")
	public String showWelcome() {
		return "welcome";
	}
}
