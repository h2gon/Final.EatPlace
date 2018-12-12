package kh.c.five.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.c.five.model.EatMemberDto;
import kh.c.five.model.LikeDto;
import kh.c.five.model.YesMember;
import kh.c.five.model.YesNickName;
import kh.c.five.service.EatMemberService;



@Controller
public class EatMembercontroller {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EatMembercontroller.class);
	
	@Autowired
	EatMemberService eatmemberservice;

	/*@RequestMapping(value="home.do", method={RequestMethod.GET, RequestMethod.POST})
	public String home() {
		return "home";
	}*/
	
	@RequestMapping(value="regi.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regi() {
		logger.info("EatMembercontroller regi " + new Date());
		
		return "regi";
	}
	
	@RequestMapping(value="regiAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regiAf(EatMemberDto mem) throws Exception {
		logger.info("EatMembercontroller regiAf " + new Date());		
		logger.info(mem.toString());
		String result = "";
		boolean b = eatmemberservice.addmember(mem);
		if(b) {
			System.out.println("회원가입성공!!");
			result ="redirect:/home.do";
		}else {
			System.out.println("회원가입실패!!");
			result ="redirect:/regi.do";
		}
		return result.trim();
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
	
	@ResponseBody
	@RequestMapping(value="getNickName.do", method={RequestMethod.GET, RequestMethod.POST})
	public YesNickName getNickName(EatMemberDto mem) {
		logger.info("EatMembercontroller getNickName " + new Date());
		
		int count = eatmemberservice.getNickName(mem);
		
		YesNickName yes = new YesNickName();
		if(count > 0) {
			yes.setMessage("YES");
		}else {
			yes.setMessage("NO");
		}
		return yes;	
		
	}
	
	@RequestMapping(value="login.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login() {
		logger.info("KhMemberController login " + new Date());
		
		return "login";
	}
	
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(HttpServletRequest req, EatMemberDto mem)throws Exception {
		logger.info("EatMembercontroller loginAf " + new Date());
		logger.info("EatMembercontroller loginAf " + mem.toString());
		String id = req.getParameter("_userid");
		String pwd = req.getParameter("_pwd");
		
		mem.setId(id);
		mem.setPwd(pwd);
		logger.info("EatMembercontroller loginAf " + mem.toString());
		EatMemberDto login = eatmemberservice.login(mem);
		
		if(login != null && !login.getId().equals("")) {			
			req.getSession().setAttribute("login", login);

			return "redirect:/home.do";
		}/*else {
			return "login";
			"redirect:/bbslist.do"
		}	*/		
		return "redirect:/home.do";
	}
	
	
	@RequestMapping(value="logout.do", method={RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest req) {
		logger.info("EatMembercontroller login " + new Date());
		
		req.getSession().invalidate(); 

		return "redirect:/home.do";
	}
	
	@RequestMapping(value="insertLike.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insertLike(int rs_seq, String rs_name, String id) {
		logger.info("EatMembercontroller insertLike " + new Date());
		LikeDto dto=new LikeDto(0, id, rs_seq, rs_name);
		boolean b = eatmemberservice.insertLike(dto);
		
		if(b) {
			return "redirect:/rsdetail.do?seq="+rs_seq;
			//return "rsdetail.do?seq="+rs_seq;
		}else {
			return "home";
		}
		
	}
	
	
}
