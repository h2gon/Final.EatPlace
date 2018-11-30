package kh.c.five.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatRestaurantsDao;
import kh.c.five.model.EatParam;
import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;
import kh.c.five.model.RestaurantDto;
import kh.c.five.model.ReviewDto;
import kh.c.five.model.wannagoDto;
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

	@Override
	public List<RegiDto> getSearchPagingSeq(EatParam param) {
		// TODO Auto-generated method stub
		return eatRestaurantsDao.getSearchPagingSeq(param);
	}

	@Override
	public int getSearchCount(EatParam param) {
		// TODO Auto-generated method stub
		return eatRestaurantsDao.getSearchCount(param);
	}

	@Override
	public RegiDto getSearchPagingList(RegiDto seqlist) {
		// TODO Auto-generated method stub
		return eatRestaurantsDao.getSearchPagingList(seqlist);
	}

	@Override
	public List<RegiDto> getCategoryList(EatParam param) {
		// TODO Auto-generated method stub
		return eatRestaurantsDao.getCategoryList(param);
	}

	@Override
	public int getCategoryCount(EatParam param) {
		// TODO Auto-generated method stub
		return eatRestaurantsDao.getCategoryCount(param);
	}

	@Override
	public void getRating(int seq) {
		eatRestaurantsDao.getRating(seq);
		
	}
	

	//가고싶다
	@Override
	public boolean addwannagolist(wannagoDto dto) {
		return eatRestaurantsDao.addwannagolist(dto);
	}

	//가고싶다
		@Override
		public List<wannagoDto> getwannagolist(String id) {
			return eatRestaurantsDao.getwannagolist(id);
		}

		@Override
		public int existwannago(wannagoDto dto) {
			return eatRestaurantsDao.existwannago(dto);
		}

		@Override
		public void deletewannagolist(wannagoDto dto) {
			eatRestaurantsDao.deletewannagolist(dto);
		}

		@Override
		public List<RegiDto> bestlist(RegiDto dto) {
			return eatRestaurantsDao.bestlist(dto);
		}

		@Override
		public ReviewDto BestReview(int seq) {
			return eatRestaurantsDao.BestReview(seq);
		}

		@Override
		public List<RegiDto> Gubestlist(RegiDto dto) {
			return eatRestaurantsDao.Gubestlist(dto);
		}

		@Override
		public List<RegiDto> keywordbestlist(RegiDto dto) {
			return eatRestaurantsDao.keywordbestlist(dto);
		}

	

}
