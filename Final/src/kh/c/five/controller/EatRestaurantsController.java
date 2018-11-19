package kh.c.five.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.fileDto;
import kh.c.five.service.EatRestaurantsService;
import kh.c.five.service.EatReviewService;
import kh.c.five.util.FUpUtil;


@Controller
public class EatRestaurantsController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EatRestaurantsController.class);
	
	@Autowired
	EatRestaurantsService eatRestaurantsService;
	
	@Autowired
	EatReviewService eatReviewService;

	@RequestMapping(value="restaurantsInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String home() {
		
		return "restaurants/restaurantsInsert";
	}
	

	
	@RequestMapping(value="insertrs.do", method={RequestMethod.GET, RequestMethod.POST})
	public String InsertRS1(RegiDto dto,HttpServletRequest req,
			@RequestParam(value="fileload", required=false)
			MultipartFile fileload) {
		
		
		logger.info("EatRestaurantsController InsertRS"+new Date());
		logger.info("InsertRS InsertDto.toString:"+dto.toString());
		
		
		
		// filename 痍⑤뱷
		dto.setRs_picture(fileload.getOriginalFilename());
		
		// upload 寃쎈줈
		// tomcat
		//String fupload = req.getServletContext().getRealPath("/upload");
		String fupload = "\\\\\\\\192.168.30.34\\\\공유\\\\tmp";
		logger.info("upload 寃쎈줈:" + fupload);
		
		// �뤃�뜑
	//	String fupload = "d:\\tmp";
		
		String f = dto.getRs_picture();
		String newFile = FUpUtil.getNewFile(f);	// �뙆�씪紐낆쓣 ���엫�뿉 �뵲�씪�꽌 蹂�寃�
		
		dto.setRs_picture(newFile);
		
		File file = new File(fupload + "/" + newFile);
		
		System.out.println("�뙆�씪:" + fupload + "/" + newFile);
		
		boolean isS = false;
		System.out.println("dto:"+dto.toString());
		
		try {			
			// �떎�젣 upload 遺�遺�
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		
			// Db�뿉 ���옣
			isS = eatRestaurantsService.InsertRS(dto);
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(isS) {
			logger.info("Insert isS:"+isS);
			return "home";
		}else {
			logger.info("Insert isS:"+isS);
			return "home";
		}	
		
	}

	@RequestMapping(value="restaurntsList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String restaurntsList(Model model) {
		
		logger.info("EatRestaurantsController restaurntsList"+new Date());
		
		List<RegiDto> rslist = eatRestaurantsService.getRs_List();
		
		model.addAttribute("rslist", rslist);
		
		for (int i = 0; i < rslist.size(); i++) {
			rslist.get(i).toString();
		}
		
		
		
		return "restaurants/restaurntsList";
	}
	
	

	//디테일
	@RequestMapping(value="rsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String details(int seq,Model model) throws Exception {
		logger.info("EatRestaurantsController detail"+new Date());
	//	logger.info("InsertRS InsertDto.toString:"+dto.toString());
		
		
		RegiDto rs=null;		
		rs=eatRestaurantsService.getrs(seq);
		
		RegiDto rs2 = null;
		rs2=eatRestaurantsService.getrs2(seq);
		
		model.addAttribute("rs", rs);
		model.addAttribute("rs2", rs2);
		
		List<String> imagelist = eatReviewService.getImage(seq);
		model.addAttribute("imagelist",imagelist);
		
		//System.out.println(rs.toString());
		//System.out.println(rs2.toString());
		
		/*return "restaurants/restaurantDetail?seq="+seq;*/
		return "restaurants/restaurantDetail";
	}

}
