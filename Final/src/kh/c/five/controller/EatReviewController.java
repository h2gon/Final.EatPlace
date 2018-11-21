package kh.c.five.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.fileDto;
import kh.c.five.service.EatRestaurantsService;
import kh.c.five.service.EatReviewService;
import kh.c.five.util.FUpUtil;


@Controller
public class EatReviewController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EatReviewController.class);
	
	@Autowired
	EatRestaurantsService eatRestaurantsService;
	
	@Autowired
	EatReviewService eatReviewService;

	
	
	@RequestMapping(value="WriteReview.do", method={RequestMethod.GET, RequestMethod.POST})
	public String WriteReview(int seq, Model model) {
		
		logger.info("EatRestaurantsController WriteReview"+new Date());
		
		RegiDto dto = null;
		
		try {
			dto = eatRestaurantsService.getrs(seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		
		return "restaurants/WriteReview";
	}
	
	@RequestMapping(value="writeReviewAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String WriteReviewAf(ReviewDto rdto, Model model,MultipartHttpServletRequest mtfRequest) {
		logger.info("EatRestaurantsController writeReviewAf"+new Date());
		
		List<MultipartFile> mf = mtfRequest.getFiles("file");
		
		String fupload = "\\\\\\\\192.168.30.34\\\\공유\\\\tmp";
		
		
		int isS = 0;
		
		 if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			 isS = eatReviewService.addReview(rdto);
			 System.out.println("==========add후 currval확인======== : "+isS);
	        } else {
	        	isS = eatReviewService.addReview(rdto);
	        	System.out.println("==========add후 currval확인======== : "+isS);
	            for (int i = 0; i < mf.size(); i++) {
	                // 파일 중복명 처리
	                //String genId = UUID.randomUUID().toString();
	                // 본래 파일명
	                String originalfileName = mf.get(i).getOriginalFilename();
	                 
	                String saveFileName = FUpUtil.getNewFile(originalfileName);
	                // 저장되는 파일 이름
	                
	                File file = new File(fupload + "/" + saveFileName);
	                // 저장 될 파일 경로
	 
	                long fileSize = mf.get(i).getSize(); // 파일 사이즈
	 
	                try {
						mf.get(i).transferTo(file);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // 파일 저장
	                fileDto fdto = new fileDto(isS, originalfileName, saveFileName, fileSize, rdto.getRs_seq());
	                // isS == addreview 의 sequence currval 
	          
	    
	                eatReviewService.addFile(fdto);
	               
	            }
	        }
		 
	
		/*
		for (MultipartFile mf : filelist) {
			fdto.setO_name(mf.getOriginalFilename());
		}*/
		
		

		
		System.out.println(rdto.toString());
		
		
		if (isS>0) {
			System.out.println("트루");
		}else System.out.println("false~~");
		
		
		
		return "redirect:/home.do";
	}
	

}
