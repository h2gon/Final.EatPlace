package kh.c.five.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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

import kh.c.five.model.EatParam;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
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
		List<ReviewParam> rplist = new ArrayList<>();
		for (int i = 0; i < rslist.size(); i++) {
			ReviewParam rparm = new ReviewParam();
			rparm.setSeq(rslist.get(i).getSeq());
			
			int n = eatReviewService.getRvCount(rparm);
			rparm.setReviewCount(n);
			
			int m = eatReviewService.getLikeCount(rparm);
			rparm.setLike(m);
			
			rplist.add(rparm);
			
			System.out.println(rparm.toString());
			System.out.println("seq: "+rslist.get(i).getSeq());
			eatRestaurantsService.getRating(rslist.get(i).getSeq());
		}
		
		
		
		model.addAttribute("rplist", rplist);
		model.addAttribute("rslist", rslist);
		
	
		
		
		
		
		return "restaurants/restaurntsList";
	}
	
	

	//디테일
	@RequestMapping(value="rsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String details(int seq,Model model) throws Exception {
		logger.info("EatRestaurantsController detail"+new Date());
	//	logger.info("InsertRS InsertDto.toString:"+dto.toString());
		
		//readcount
		eatRestaurantsService.readcount(seq);
		//review count
		int reviewcount =eatRestaurantsService.getReviewNum(seq);
		model.addAttribute("reviewcount", reviewcount);
		//likes count
		int likescount = eatRestaurantsService.getLikesCount(seq);
		model.addAttribute("likescount",likescount);
		
		RegiDto rs=null;		
		rs=eatRestaurantsService.getrs(seq);
		
		RegiDto rs2 = null;
		rs2=eatRestaurantsService.getrs2(seq);
		
		//review-----
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		list = eatRestaurantsService.SelectReview(seq);
		logger.info("Reviewlist:"+list);
		model.addAttribute("reviewlist", list);
		//---------
		model.addAttribute("rs", rs);
		model.addAttribute("rs2", rs2);
		
		/*List<String> imagelist = eatReviewService.getImage(seq);
		model.addAttribute("imagelist",imagelist);*/
		List<String> imagelist = eatReviewService.getImageDT(seq);
		model.addAttribute("imagelist",imagelist);
		
		//System.out.println(rs.toString());
		//System.out.println(rs2.toString());
		
		/*return "restaurants/restaurantDetail?seq="+seq;*/
		return "restaurants/restaurantDetail";
	}
	
	@RequestMapping(value="home.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String getRankList(RegiDto dto, Model model) {
		logger.info("EatRestaurantsController getRankList"+new Date());
		
		List<RegiDto> list = eatRestaurantsService.getRankList(dto);
		
		
		
		model.addAttribute("RankList", list);
		            
		
		return "home";
	}
	
	@RequestMapping(value="search.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String search(String s_keyword, EatParam param, Model model) {
		
		System.out.println("검색어 : "+s_keyword);
		System.out.println("param: "+param.toString());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
				
		param.setStart(start);
		param.setEnd(end);
		
		List<RegiDto> seqlist = eatRestaurantsService.getSearchPagingSeq(param);
		List<RegiDto> searchlist = new ArrayList<>();
		for (int i = 0; i < seqlist.size(); i++) {
			
			RegiDto dto = (RegiDto) eatRestaurantsService.getSearchPagingList(seqlist.get(i));
			searchlist.add(dto);
			
		}
		int totalRecordCount = eatRestaurantsService.getSearchCount(param);
		
		List<ReviewParam> rplist = new ArrayList<>();
		for (int i = 0; i < searchlist.size(); i++) {
			ReviewParam rparm = new ReviewParam();
			rparm.setSeq(searchlist.get(i).getSeq());
			
			int n = eatReviewService.getRvCount(rparm);
			rparm.setReviewCount(n);
			
			int m = eatReviewService.getLikeCount(rparm);
			rparm.setLike(m);
			
			rplist.add(rparm);
			
			System.out.println(rparm.toString());
			System.out.println("seq: "+searchlist.get(i).getSeq());
			eatRestaurantsService.getRating(searchlist.get(i).getSeq());
		}
		
		
		
		model.addAttribute("rplist", rplist);
		
		model.addAttribute("searchlist", searchlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 9);	
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_keyword",param.getS_keyword());
				
		
		
		//return "redirect:/home.do";
		return "restaurants/restaurntsSearchList";
	}
	
	@RequestMapping(value="category.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String category(String s_category, EatParam param, Model model) {
		
		System.out.println("category : "+s_category);
		param.setS_category(s_category);
		System.out.println("param: "+param.toString());
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
				
		param.setStart(start);
		param.setEnd(end);
		
		List<RegiDto> searchlist =eatRestaurantsService.getCategoryList(param);
		
		int totalRecordCount = eatRestaurantsService.getCategoryCount(param);
		System.out.println("totalRecordCount = "+totalRecordCount);
		for (int i = 0; i < searchlist.size(); i++) {
			System.out.println(searchlist.get(i).toString());
			
		}
		
		List<ReviewParam> rplist = new ArrayList<>();
		for (int i = 0; i < searchlist.size(); i++) {
			ReviewParam rparm = new ReviewParam();
			rparm.setSeq(searchlist.get(i).getSeq());
			
			int n = eatReviewService.getRvCount(rparm);
			rparm.setReviewCount(n);
			
			int m = eatReviewService.getLikeCount(rparm);
			rparm.setLike(m);
			
			rplist.add(rparm);
			
			System.out.println(rparm.toString());
			System.out.println("seq: "+searchlist.get(i).getSeq());
			eatRestaurantsService.getRating(searchlist.get(i).getSeq());
		}
		
		
		
		model.addAttribute("rplist", rplist);
		
		model.addAttribute("searchlist", searchlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 9);	
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		//model.addAttribute("s_keyword",param.getS_keyword());
		
		model.addAttribute("s_category",param.getS_category());
		
		
		return "restaurants/restaurntsSearchList";
	}
	
	

}
