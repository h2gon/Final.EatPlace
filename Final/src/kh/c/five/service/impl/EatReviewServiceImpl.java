package kh.c.five.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.dao.EatReviewDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.service.EatRestaurantsService;
import kh.c.five.service.EatReviewService;

@Service
public class EatReviewServiceImpl implements EatReviewService {
	
	@Autowired
	EatReviewDao eatreviewdao;
	

}
