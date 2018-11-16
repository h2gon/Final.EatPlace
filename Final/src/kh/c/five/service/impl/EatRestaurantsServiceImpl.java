package kh.c.five.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.InsertDto;
import kh.c.five.service.EatRestaurantsService;

@Service
public class EatRestaurantsServiceImpl implements EatRestaurantsService {
	
	@Autowired
	EatRestaurantsDao eatRestaurantsDao;
	
	public boolean InsertRS(InsertDto dto) {
		return eatRestaurantsDao.InsertRS(dto);
	}

}
