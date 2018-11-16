package kh.c.five.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.c.five.model.EatMemberDto;
import kh.c.five.model.YesMember;
import kh.c.five.service.EatMemberService;



@Controller
public class EatMembercontroller {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EatMembercontroller.class);
	
	@Autowired
	EatMemberService eatmemberservice;

	@RequestMapping(value="home.do", method={RequestMethod.GET, RequestMethod.POST})
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="regi.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regi() {
		logger.info("EatMembercontroller regi " + new Date());
		
		return "regi";
	}
	
	@RequestMapping(value="regiAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regiAf(EatMemberDto mem) throws Exception {
		logger.info("EatMembercontroller regiAf " + new Date());
		
		logger.info(mem.toString());
				
		boolean b = eatmemberservice.addmember(mem);
		if(b) {
			return "home";
		}else {
			return "regi";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="getID.do", method={RequestMethod.GET, RequestMethod.POST})
	public YesMember getID(EatMemberDto mem) {
		logger.info("EatMembercontroller getID " + new Date());
		
		int count = eatmemberservice.getID(mem);
		
		YesMember yes = new YesMember();
		if(count > 0) {
			yes.setMessage("YES");
		}else {
			yes.setMessage("NO");
		}
		return yes;		
	}
	/*
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req, EatMemberDto mem)throws Exception {
		logger.info("EatMembercontroller loginAf " + new Date());
		
		EatMemberDto login = eatmemberservice.login(mem);
		
		if(login != null && !login.getId().equals("")) {			
			req.getSession().setAttribute("login", login);
			// bbslist로 이동	
			return "home";
		}else {
			return "login";
		}				
	}
	
	
	
	
	@RequestMapping(value="logout.do", method={RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest req) {
		logger.info("EatMembercontroller login " + new Date());
		
		req.getSession().invalidate(); 

		
		return "login";
	}*/
	
}
