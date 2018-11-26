package kh.c.five.dao;

import java.util.List;

import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;

public interface EatReviewDao {
	public List<String> getImage(int rv_seq);
	public List<String> getImageDT(int rs_seq); // pickup images per rests 
	Integer addReview(ReviewDto rdto);
	
	void addFile(fileDto fdto);
	

	int getreviewcount(String id);
	
	public int getRvCount(ReviewParam param);
	
	public int getLikeCount(ReviewParam param);
	
	List<fileDto> getRv_Image(int rv_seq);
	
}
