package kh.c.five.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.c.five.model.InsertDto;
import kh.c.five.service.EatRestaurantsService;
import kh.c.five.util.FUpUtil;


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
	
	@RequestMapping(value="InsertRS.do", method={RequestMethod.GET, RequestMethod.POST})
	public String InsertRS(InsertDto dto,HttpServletRequest req,
			@RequestParam(value="rs_picture", required=false)
			MultipartFile rs_picture) {
		
		
		logger.info("EatRestaurantsController InsertRS"+new Date());
		logger.info("InsertRS InsertDto.toString:"+dto.toString());
		
		
		
		// filename 취득
		dto.setRs_picture(rs_picture.getOriginalFilename());
		
		// upload 경로
		// tomcat
		//String fupload = req.getServletContext().getRealPath("/upload");
		String fupload = "\\\\\\\\192.168.30.34\\\\공유\\\\tmp";
		logger.info("upload 경로:" + fupload);
		
		// 폴더
	//	String fupload = "d:\\tmp";
		
		String f = dto.getRs_picture();
		String newFile = FUpUtil.getNewFile(f);	// 파일명을 타임에 따라서 변경
		
		dto.setRs_picture(newFile);
		
		File file = new File(fupload + "/" + newFile);
		
		System.out.println("파일:" + fupload + "/" + newFile);
		
		boolean isS = false;
		
		try {			
			// 실제 upload 부분
			FileUtils.writeByteArrayToFile(file, rs_picture.getBytes());
			
			// Db에 저장
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
	
	
}
