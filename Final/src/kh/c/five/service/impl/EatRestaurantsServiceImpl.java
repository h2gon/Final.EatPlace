package kh.c.five.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
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

}
