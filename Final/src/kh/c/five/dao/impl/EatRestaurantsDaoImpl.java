package kh.c.five.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;


@Repository
public class EatRestaurantsDaoImpl implements EatRestaurantsDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace ="EatRestaurant.";

	@Override
	public boolean InsertRS(RegiDto dto) {
		
		int n1 = sqlSession.insert(namespace + "InsertRS", dto);
		int n2 = sqlSession.insert(namespace+"InsertDetail", dto);
		return n1>0 && n2>0?true:false;
	}
	
	

}
