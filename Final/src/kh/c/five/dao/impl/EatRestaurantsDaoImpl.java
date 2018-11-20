package kh.c.five.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;


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

	@Override
	public List<RegiDto> getRs_List() {
		
		return sqlSession.selectList(namespace+"getList");
	}

	@Override
	public RegiDto getrs(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getrs",seq);
	}

	@Override
	public RegiDto getrs2(int seq) throws Exception {
		return sqlSession.selectOne(namespace+"getrs2",seq);
	}
	
	@Override
	public List<RegiDto> getRankList(RegiDto dto) {
		return sqlSession.selectList(namespace + "getRankList", dto);
	}

	@Override
	public List<ReviewDto> SelectReview(int seq) {
		List<ReviewDto> list = sqlSession.selectList(namespace+"SelectReview", seq);
		return list;
	}
	
	
	

}
