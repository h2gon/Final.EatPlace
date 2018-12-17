package kh.c.five.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import kh.c.five.model.EatMemberDto;
import kh.c.five.model.EatParam;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;
import kh.c.five.model.wannagoDto;
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
	public String restaurntsList(Model model, RegiDto dto2, HttpServletRequest req) {
		
		logger.info("EatRestaurantsController restaurntsList"+new Date());
		
		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
		
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
		
	
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		if(login != null && !login.getId().equals("")){
		List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
					model.addAttribute("wannagolist", wannagolist);
		
		}
		
		return "restaurants/restaurntsList";
	}
	
	

	//디테일
	@RequestMapping(value="rsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String details(int seq,Model model, HttpServletResponse response , HttpServletRequest req, RegiDto dto2, wannagoDto dto) throws Exception {
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

		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		
		if(login != null && !login.getId().equals("")){
			

			dto.setId(login.getId());
			dto.setRs_name(rs.getRs_name());
			dto.setRs_seq(rs.getSeq());
			
			boolean isS = false;
			
			//이미 추가했는지 확인하기
			int count = 0;
			count = eatRestaurantsService.existwannago(dto);
			
			model.addAttribute("count",count);
			List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
			model.addAttribute("wannagolist", wannagolist);

			}else {
				List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist("없는거로아무거나불러오기");
				model.addAttribute("wannagolist", wannagolist);
			}

			
	
		//쿠키생성

		String cn = URLEncoder.encode(rs.getRs_name(), "utf-8");
		
		Cookie cookie_visit_rs = new Cookie(cn, rs.getSeq()+"");
		cookie_visit_rs.setMaxAge(60*60*24*365); // 기간을 1년으로 지정
		cookie_visit_rs.setPath("/"); //모든경로에서 접근 가능하게 만듬
		response.addCookie(cookie_visit_rs);
		
		
				
				//System.out.println(rs.toString());
				//System.out.println(rs2.toString());
				
				/*return "restaurants/restaurantDetail?seq="+seq;*/
				
		//잠시 디테일 테스트용으로 test로 바꿔뒀어요
		//return "restaurants/restaurantDetail";
		
				return "restaurants/test";
	}
	
	@RequestMapping(value="clear.do", method={RequestMethod.GET, RequestMethod.POST})
	public String testCookie(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		logger.info("testCookie clear"+new Date());
		Cookie[] cookies = request.getCookies();
		
		
			for(int i=0; i< cookies.length; i++){

				String str = URLDecoder.decode(cookies[i].getName(), "utf-8");
				/*if(cookies != null){*/
				if(!str.contains("rc")){
					
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
				cookies[i].setPath("/");  
				response.addCookie(cookies[i]); // 응답 헤더에 추가

				
				}
			}
		
		Cookie[] getCookie = request.getCookies();

		if(getCookie != null){

		for(int i=0; i<getCookie.length; i++){

		Cookie c = getCookie[i];

		String name = c.getName(); // 쿠키 이름 가져오기

		String value = c.getValue(); // 쿠키 값 가져오기
		System.out.println(name + " " + value);
		}

		}
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="rc_clear.do", method={RequestMethod.GET, RequestMethod.POST})
	public String rccookie(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		logger.info("rccookie clear"+new Date());
		Cookie[] cookies = request.getCookies();
		
		
			for(int i=0; i< cookies.length; i++){

				String str = URLDecoder.decode(cookies[i].getName(), "utf-8");
				/*if(cookies != null){*/
				if(str.contains("rc")){
					
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
				cookies[i].setPath("/");  
				response.addCookie(cookies[i]); // 응답 헤더에 추가

				
				}
			}
		
		Cookie[] getCookie = request.getCookies();

		if(getCookie != null){

		for(int i=0; i<getCookie.length; i++){

		Cookie c = getCookie[i];

		String name = c.getName(); // 쿠키 이름 가져오기

		String value = c.getValue(); // 쿠키 값 가져오기
		System.out.println(name + " " + value);
		}

		}
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="home.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String getRankList(RegiDto dto, Model model, HttpServletRequest req) {
		logger.info("EatRestaurantsController getRankList"+new Date());
		
		List<RegiDto> list = eatRestaurantsService.getRankList(dto);
		
	

		//영훈 가고싶다
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		
		if(login != null && !login.getId().equals("")){
			System.out.println(login.toString());
			List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
			model.addAttribute("wannagolist", wannagolist);

		}
		else {
			List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist("없는거로아무거나불러오기");
			model.addAttribute("wannagolist", wannagolist);
		}
		
		
		model.addAttribute("RankList", list);
		            
		
		return "home";
	}
	
	@RequestMapping(value="search.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String search(String s_keyword, EatParam param, Model model, HttpServletResponse response, RegiDto dto2, HttpServletRequest req) throws Exception {
		
		System.out.println("검색어 : "+s_keyword);
		System.out.println("param: "+param.toString());
		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
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
			
			/*System.out.println(rparm.toString());
			System.out.println("seq: "+searchlist.get(i).getSeq());*/
			eatRestaurantsService.getRating(searchlist.get(i).getSeq());
		}		
	
		
		String rc = URLEncoder.encode("rc" + s_keyword, "utf-8");
		
		Cookie rcookie = new Cookie(rc, URLEncoder.encode(s_keyword, "utf-8"));
		rcookie.setMaxAge(60*60*24*365); // 기간을 1년으로 지정
		rcookie.setPath("/"); //모든경로에서 접근 가능하게 만듬
		response.addCookie(rcookie);
		
		
		model.addAttribute("rplist", rplist);
		
		model.addAttribute("searchlist", searchlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);	
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		model.addAttribute("s_keyword",param.getS_keyword());
				
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		
		if(login != null && !login.getId().equals("")){
		
		List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
					model.addAttribute("wannagolist", wannagolist);
		}
		//return "redirect:/home.do";
		return "restaurants/restaurntsSearchList";
	}
	
	@RequestMapping(value="category.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String category(String s_category,String s_keyword, EatParam param, Model model, HttpServletRequest req, 
			RegiDto dto2) {
		
		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
		
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
			
			/*System.out.println(rparm.toString());
			System.out.println("seq: "+searchlist.get(i).getSeq());*/
			eatRestaurantsService.getRating(searchlist.get(i).getSeq());
		}
		
		
		
		model.addAttribute("rplist", rplist);
		
		model.addAttribute("searchlist", searchlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);	
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		//model.addAttribute("s_keyword",param.getS_keyword());
		
		model.addAttribute("s_category",param.getS_category());
		
		
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		if(login != null && !login.getId().equals("")){
		List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
					model.addAttribute("wannagolist", wannagolist);
		}
		return "restaurants/restaurntsSearchList";
	}
	

	@RequestMapping(value="wannago.do", method={RequestMethod.GET, RequestMethod.POST})
	public String wannago(int rs_seq, String rs_name, wannagoDto dto , Model model, HttpServletRequest req) {
		
		logger.info("EatRestaurantsController wannago"+new Date());
		
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		
		
	
		System.out.println(rs_seq);
		System.out.println(rs_name);	
		
		if(login != null && !login.getId().equals("")){
		

			dto.setId(login.getId());
			dto.setRs_name(rs_name);
			dto.setRs_seq(rs_seq);
			
			boolean isS = false;
			
			//이미 추가했는지 확인하기
			int count = 0;
			count = eatRestaurantsService.existwannago(dto);
			
			//존재하지않음
			if(count==0) {
			//추가 안되어있으면 추가하기
			isS = eatRestaurantsService.addwannagolist(dto);
			}
			
			//추가되어 있으면 삭제하기
			else {
			eatRestaurantsService.deletewannagolist(dto);
			}
			
			
			logger.info("addwannagolist isS:"+isS);
			
		}
		
		System.out.println("가고싶다 추가/삭제 완료!");
		
		return "redirect:/home.do";
		
	}

	@RequestMapping(value="KFBest.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String restaurantBest(Model model, RegiDto dto, RegiDto dto2, HttpServletRequest req) {
		logger.info("EatRestaurantsController restaurantBest"+new Date());
		System.out.println("KFDTO:" + dto);
		
		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
		
		List<RegiDto> bestlist = eatRestaurantsService.bestlist(dto);
		System.out.println("KFBEST = " + bestlist);
		List<ReviewDto> reviewlist = new ArrayList<>();
		for (int i = 0; i < bestlist.size(); i++) {
			
			ReviewDto review = eatRestaurantsService.BestReview(bestlist.get(i).getSeq());
			if(review !=null) {
			System.out.println(review.toString());
			}
			reviewlist.add(review);
						
		}		

		
		
		List<ReviewParam> rplist = new ArrayList<>();
		for (int i = 0; i < bestlist.size(); i++) {
			ReviewParam rparm = new ReviewParam();
			rparm.setSeq(bestlist.get(i).getSeq());
			
			int n = eatReviewService.getRvCount(rparm);
			rparm.setReviewCount(n);
			
			int m = eatReviewService.getLikeCount(rparm);
			rparm.setLike(m);
			
			rplist.add(rparm);
		}
		
		model.addAttribute("rplist", rplist);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("bestlist", bestlist);
		model.addAttribute("category", dto);
		
		
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		if(login != null && !login.getId().equals("")){
		List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
					model.addAttribute("wannagolist", wannagolist);
		}
		return "restaurants/restaurantBest";
	}
	
	@RequestMapping(value="GuBest.do", method={RequestMethod.GET, RequestMethod.POST})
	public String GuBest(Model model, RegiDto dto, RegiDto dto2, HttpServletRequest req) {
		logger.info("EatRestaurantsController GuBest "+ new Date());
		System.out.println(dto.toString());
		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
		List<RegiDto> GuBestlist = eatRestaurantsService.Gubestlist(dto);
		List<ReviewDto> reviewlist = new ArrayList<>();
		for (int i = 0; i < GuBestlist.size(); i++) {
			ReviewDto review = eatRestaurantsService.BestReview(GuBestlist.get(i).getSeq());
			eatRestaurantsService.getRating(GuBestlist.get(i).getSeq());
			reviewlist.add(review);
			System.out.println(GuBestlist.get(i).toString());
		}
		
		List<ReviewParam> rplist = new ArrayList<>();
		for (int i = 0; i < GuBestlist.size(); i++) {
			ReviewParam rparm = new ReviewParam();
			rparm.setSeq(GuBestlist.get(i).getSeq());
			
			int n = eatReviewService.getRvCount(rparm);
			rparm.setReviewCount(n);
			
			int m = eatReviewService.getLikeCount(rparm);
			rparm.setLike(m);
			
			rplist.add(rparm);
		}
		
		model.addAttribute("rplist", rplist);
		
		/*for (int i = 0; i < reviewlist.size(); i++) {
			System.out.println(reviewlist.get(i).toString());
		}*/
		
		model.addAttribute("bestlist", GuBestlist);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("address", dto);
		
		
		EatMemberDto login = (EatMemberDto)req.getSession().getAttribute("login");
		if(login != null && !login.getId().equals("")){
		List<wannagoDto> wannagolist = eatRestaurantsService.getwannagolist(login.getId());
					model.addAttribute("wannagolist", wannagolist);
		}
		return "restaurants/restaurantBest";
	}
	
	@RequestMapping(value="keyword.do", method={RequestMethod.GET, RequestMethod.POST})
	public String keyword(Model model, RegiDto dto, RegiDto dto2) {
		logger.info("EatRestaurantsController GuBest "+ new Date());
		System.out.println(dto.toString());
		
		
		List<RegiDto> list2 = eatRestaurantsService.getRankList(dto2);
		model.addAttribute("RankList", list2);
		
		
		List<RegiDto> keywordlist = eatRestaurantsService.keywordbestlist(dto);
		List<ReviewDto> reviewlist = new ArrayList<>();
		for (int i = 0; i < keywordlist.size(); i++) {
			ReviewDto review = eatRestaurantsService.BestReview(keywordlist.get(i).getSeq());
			eatRestaurantsService.getRating(keywordlist.get(i).getSeq());
			reviewlist.add(review);
			System.out.println(keywordlist.get(i).toString());
		}
		
		List<ReviewParam> rplist = new ArrayList<>();
		for (int i = 0; i < keywordlist.size(); i++) {
			ReviewParam rparm = new ReviewParam();
			rparm.setSeq(keywordlist.get(i).getSeq());
			
			int n = eatReviewService.getRvCount(rparm);
			rparm.setReviewCount(n);
			
			int m = eatReviewService.getLikeCount(rparm);
			rparm.setLike(m);
			
			rplist.add(rparm);
		}
		
		model.addAttribute("rplist", rplist);
		
		model.addAttribute("bestlist", keywordlist);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("keyword", dto);
		
		return "restaurants/restaurantBest";
	}
	

	//레스토랑 정보 수정 view
	
			@RequestMapping(value="rsedit.do", method={RequestMethod.GET, RequestMethod.POST})
			public String rsedit(int seq,Model model, HttpServletResponse response) throws Exception {
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

					//쿠키생성
					/*
					Cookie cookie_visit_rs = new Cookie(rs.getRs_name() , rs.getSeq()+"");
					cookie_visit_rs.setMaxAge(60*60*24*365); // 기간을 1년으로 지정
					cookie_visit_rs.setPath("/"); //모든경로에서 접근 가능하게 만듬
					response.addCookie(cookie_visit_rs);
					*/
					
							
							//System.out.println(rs.toString());
							//System.out.println(rs2.toString());
							
							/*return "restaurants/restaurantDetail?seq="+seq;*/
					return "restaurants/rsedit";
			}
			

			@RequestMapping(value="rseditAF_1.do", method={RequestMethod.GET, RequestMethod.POST})
			public String rseditAF_1(int seq, HttpServletRequest req) throws Exception{
				
				logger.info("EatRestaurantsController rseditAF_1"+new Date());
				
				RegiDto rs = null;
				rs=eatRestaurantsService.getrs(seq);
				
				RegiDto rs2 = null;
				rs2=eatRestaurantsService.getrs2(seq);
			
				rs.setRs_address1(req.getParameter("form1_rs_address1"));
				rs.setRs_address2(req.getParameter("form1_rs_address2"));
				rs.setRs_category(req.getParameter("form1_rs_category"));
				rs.setRs_menu(req.getParameter("form1_rs_menu"));
				rs.setRs_readcount(Integer.parseInt(req.getParameter("form1_rs_readcount")));
				rs.setRs_keyword(req.getParameter("form1_rs_keyword"));
			
				
				System.out.println(rs.toString());
					
				eatRestaurantsService.editrs(rs);
				
				return "redirect:/home.do";
			}
			
			@RequestMapping(value="rseditAF_2.do", method={RequestMethod.GET, RequestMethod.POST})
			public String rseditAF_2(int seq, HttpServletRequest req) throws Exception{
				
				logger.info("EatRestaurantsController rseditAF_2"+new Date());
				
				RegiDto rs = null;
				rs = eatRestaurantsService.getrs(seq);
				
				RegiDto rs2 = null;
				rs2=eatRestaurantsService.getrs2(seq);
				
				rs2.setSeq(seq);
				rs2.setRs_name(req.getParameter("form2_rs_name"));
				rs2.setRs_time(req.getParameter("form2_rs_time"));
				rs2.setRs_phone(req.getParameter("form2_rs_phone")); 
				rs2.setRs_price(req.getParameter("form2_rs_price"));
				rs2.setRs_parking(req.getParameter("form2_rs_parking"));
				
				System.out.println(rs2.toString());
				
				eatRestaurantsService.editrs2(rs2);
				
				return "redirect:/home.do";
			}
			
			@RequestMapping(value="header.do",  method={RequestMethod.GET, RequestMethod.POST})
			public String header(){
				return "restaurants/header";
			}
}
