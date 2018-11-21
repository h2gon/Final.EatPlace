package kh.c.five.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.dao.EatReviewDao;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.fileDto;


@Repository
public class EatReviewDaoImpl implements EatReviewDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace ="EatReview.";

	@Override
	public List<String> getImage(int rv_seq) {
		List<String> list = new ArrayList<>();
		list = sqlSession.selectList(namespace+"getImage", rv_seq);
		
		return list;
	}

	@Override
	public Integer addReview(ReviewDto rdto) {
		int n = sqlSession.insert(namespace+"addReview", rdto);
		return rdto.getSeq();
	}

	@Override
	public void addFile(fileDto fdto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+"addFile", fdto);
	}


	
	

}
