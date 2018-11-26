package kh.c.five.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.dao.EatReviewDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;
import kh.c.five.service.EatRestaurantsService;
import kh.c.five.service.EatReviewService;

@Service
public class EatReviewServiceImpl implements EatReviewService {
	
	@Autowired
	EatReviewDao eatreviewdao;

	@Override
	public List<String> getImage(int rv_seq) {
		
		return eatreviewdao.getImage(rv_seq);
	}

	@Override
	public Integer addReview(ReviewDto rdto) {
		// TODO Auto-generated method stub
		return eatreviewdao.addReview(rdto);
	}

	@Override
	public void addFile(fileDto fdto) {
		// TODO Auto-generated method stub
		eatreviewdao.addFile(fdto);
	}
	

	@Override
	public int getreviewcount(String id) {
		return eatreviewdao.getreviewcount(id);
	}

	@Override
	public int getRvCount(ReviewParam param) {
		return eatreviewdao.getRvCount(param);
	}

	@Override
	public int getLikeCount(ReviewParam param) {
		return eatreviewdao.getLikeCount(param);
	}

	@Override
	public List<String> getImageDT(int rs_seq) {
		return eatreviewdao.getImageDT(rs_seq);
	}
	
}
