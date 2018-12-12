package kh.c.five.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.c.five.model.EatMemberDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.ReviewDetail;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.WildCard;
import kh.c.five.model.fileDto;
import kh.c.five.service.EatMemberService;
import kh.c.five.service.EatRestaurantsService;
import kh.c.five.service.EatReviewService;
import kh.c.five.util.FUpUtil;


@Controller
public class EatReviewController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(EatReviewController.class);
	
	@Autowired
	EatMemberService eatmemberservice;
	
	@Autowired
	EatRestaurantsService eatRestaurantsService;
	
	@Autowired
	EatReviewService eatReviewService;

	
	@RequestMapping(value="reviewDetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String reviewDetail(int seq, Model model, HttpServletRequest req) {
		logger.info("EatReviewController reviewDetail:"+new Date());
		
		List<ReviewDto> reviewlist = new ArrayList<ReviewDto>();
		reviewlist = eatRestaurantsService.SelectReview(seq);
		
		//model.addAttribute("rvseq", seq);
		req.setAttribute("rvseq", seq);
		model.addAttribute("reviewDetail", reviewlist);
		
		return "reviewDetail";
	}
	
	@RequestMapping(value="WriteReview.do", method={RequestMethod.GET, RequestMethod.POST})
	public String WriteReview(int seq, Model model, HttpServletRequest req) {
		
		logger.info("EatRestaurantsController WriteReview"+new Date());
		
		RegiDto dto = null;
		
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		int reviewcount =  eatReviewService.getreviewcount(login.getId());
	
		System.out.println("리뷰카운트 : " + reviewcount);
		
		try {
			dto = eatRestaurantsService.getrs(seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		model.addAttribute("reviewcount", reviewcount);
		
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
	
	@ResponseBody
	@RequestMapping(value="getRPdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getRPdetail(String filename, int rseq, Model model) {
		logger.info("EatReviewController RP"+new Date());
		
		
		fileDto fdto = new fileDto(0,null,filename, 0,rseq);
		ReviewDto reviews= eatReviewService.getReviewWPic(fdto);
		
		//model.addAttribute("review", review);
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("review", reviews);
	
		
		return rmap;
		
	}
	
	@ResponseBody
	@RequestMapping(value="getRPdetail2.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getRPdetail2(int rseq) {
		logger.info("EatReviewController getReviewDetail222"+new Date());
		
		List<String> imagelists = eatReviewService.getImageDT(rseq);
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("imagelist", imagelists);
	
		
		return rmap;
		
	}
	
	@ResponseBody	
	@RequestMapping(value="getReviewDetail.do",method= {RequestMethod.GET, RequestMethod.POST})
	public WildCard<ReviewDto,List<String>> getReviewDetail(HttpServletRequest req, Model model){
		
		//영곤짱 리턴값 위와 같이 쓸 수 있어요~ ㅎㅎ
		
		logger.info("EatReviewController getReviewDetail"+new Date());
		//seq = rv_seq
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("getReviewDetail seq:"+seq);
				
		List<fileDto> file_name_list = new ArrayList<fileDto>();	
		List<String> flist = new ArrayList<String>();
				
		ReviewDto rdto = eatReviewService.getReviewDetail(seq);
		file_name_list = eatReviewService.getImage(seq);
		
		if(flist != null) {
		for(int i = 0; i<file_name_list.size();i++) {
			System.out.println("flist=>"+file_name_list.get(i));
			flist.add(file_name_list.get(i).getFile_name());		
		 }
		}
		System.out.println(rdto.toString());
		System.out.println("flist.size: "+flist.size());
		WildCard<ReviewDto,List<String>> wildCard = new WildCard<>(rdto, flist);
		//model.addAttribute("wildCard", wildCard);
		for(int i =0;i<flist.size();i++) {
		System.out.println("wildCard: list: "+wildCard.getFlist().get(i)+" //rdto content: "+wildCard.getRdto().getRs_content());	
		}		
		return wildCard;		
	}
}
