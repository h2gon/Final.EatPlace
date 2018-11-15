package kh.c.five.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.c.five.service.EatRestaurantsService;


@Controller
public class EatRestaurantsController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EatRestaurantsController.class);
	
	@Autowired
	EatRestaurantsService eatRestaurantsService;

	@RequestMapping(value="restaurantsInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String home() {
		
		return "restaurants/restaurantsInsert";
	}
	
	
}
