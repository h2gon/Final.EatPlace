package kh.c.five.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.EatParam;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.wannagoDto;


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

	@Override
	public void readcount(int seq) {
		sqlSession.update(namespace+"readcount", seq);
		
	}

	@Override
	public int getReviewNum(int seq) {
		int number= sqlSession.selectOne(namespace+"getReviewNumber", seq);
		return number;
	}

	@Override
	public int getLikesCount(int seq) {
		
		return sqlSession.selectOne(namespace+"getLikesNumber",seq);
	}

	@Override
	public List<RegiDto> getSearchPagingSeq(EatParam param) {
		/*List<RegiDto> seqlist = sqlSession.selectList(namespace+"getSearchPagingSeq", param);
		
		List<RegiDto> list = new ArrayList<>();
		
		for (int i = 0; i < dto.size(); i++) {
			System.out.println(dto.get(i).toString());
		//	List<RegiDto> _list = sqlSession.selectList(namespace+"getSearchPagingList",dto.get(i));
			List<RegiDto> _list = sqlSession.selectList(namespace+"getSearchPagingList",dto.get(i));
		//	RegiDto r = sqlSession.selectOne(namespace+"getSearchPagingList",dto.get(i));
		//	list.add(r);
		//	System.out.println(list.get(i).toString());
			System.out.println("_list.size():" + _list.size());
			for (int j = 0; j < _list.size(); j++) {
				System.out.println(_list.get(j).toString());
			}
		}*/
				
		return sqlSession.selectList(namespace+"getSearchPagingSeq", param);
	}
	
	@Override
	public RegiDto getSearchPagingList(RegiDto seqlist) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getSearchPagingList", seqlist);
	}

	@Override
	public int getSearchCount(EatParam param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getSearchCount", param);
	}

	@Override
	public List<RegiDto> getCategoryList(EatParam param) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"getCategoryList", param);
	}

	@Override
	public int getCategoryCount(EatParam param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"getCategoryCount", param);
	}

	@Override
	public void getRating(int seq) {
		
		sqlSession.update(namespace+"getRating", seq);
		
	}


	//가고싶다
	
	@Override
	public boolean addwannagolist(wannagoDto dto) {
		int n= sqlSession.insert(namespace+"addwannagolist", dto);
		return n>0?true:false;
	}

	@Override
	public List<wannagoDto> getwannagolist(String id) {
		List<wannagoDto> list = sqlSession.selectList(namespace+"getwannagolist", id);
		return list;
	}

	@Override
	public int existwannago(wannagoDto dto) {
		return sqlSession.selectOne(namespace+"existwannago", dto);
	}

	@Override
	public void deletewannagolist(wannagoDto dto) {
		sqlSession.delete(namespace+"deletewannagolist", dto);
	}

	


	
	
	

}
