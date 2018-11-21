package kh.c.five.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.service.EatRestaurantsService;

@Service
public class EatRestaurantsServiceImpl implements EatRestaurantsService {
	
	@Autowired
	EatRestaurantsDao eatRestaurantsDao;
	
	public boolean InsertRS(RegiDto dto) {
		return eatRestaurantsDao.InsertRS(dto);
	}

	@Override
	public List<RegiDto> getRs_List() {
		// TODO Auto-generated method stub
		return eatRestaurantsDao.getRs_List();
	}

	@Override
	public RegiDto getrs(int seq) throws Exception {
		return eatRestaurantsDao.getrs(seq);
	}

	@Override
	public RegiDto getrs2(int seq) throws Exception {
		return eatRestaurantsDao.getrs2(seq);
	}
	
	@Override
	public List<RegiDto> getRankList(RegiDto dto) {
		return eatRestaurantsDao.getRankList(dto);
	}

	@Override
	public List<ReviewDto> SelectReview(int seq) {
		return eatRestaurantsDao.SelectReview(seq);
	}

	@Override
	public void readcount(int seq) {
		eatRestaurantsDao.readcount(seq);
		
	}

	@Override
	public int getReviewNum(int seq) {
		return eatRestaurantsDao.getReviewNum(seq);
		 
	}

	@Override
	public int getLikesCount(int seq) {
		
		return eatRestaurantsDao.getLikesCount(seq);
	}
	
	

}
