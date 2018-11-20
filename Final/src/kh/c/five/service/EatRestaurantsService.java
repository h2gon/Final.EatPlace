package kh.c.five.service;

import java.util.List;

import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;

public interface EatRestaurantsService {
	
	public boolean InsertRS(RegiDto dto);
	
	public List<RegiDto> getRs_List();
	
	public RegiDto getrs(int seq) throws Exception;	

	public RegiDto getrs2(int seq) throws Exception;	

	public List<RegiDto> getRankList(RegiDto dto);
	
	public List<ReviewDto> SelectReview(int seq);
}
