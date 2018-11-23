package kh.c.five.dao;

import java.util.List;

import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;

public interface EatReviewDao {
	public List<String> getImage(int rv_seq);
	
	Integer addReview(ReviewDto rdto);
	
	void addFile(fileDto fdto);
	

	int getreviewcount(String id);
	
	public int getRvCount(ReviewParam param);
	
	public int getLikeCount(ReviewParam param);
}
