package kh.c.five.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Eatcontroller {

	@RequestMapping(value="home.do", method={RequestMethod.GET, RequestMethod.POST})
	public String home() {
		return "home";
	}
	
	
}
