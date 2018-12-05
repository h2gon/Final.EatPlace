package kh.c.five.service;

import java.util.List;

import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;


public interface EatReviewService {
	public List<fileDto> getImage(int rv_seq);
	public List<String> getImageDT(int rs_seq);
	public ReviewDto getReviewWPic (fileDto fdto);
	
	public Integer addReview(ReviewDto rdto);
	public void addFile(fileDto fdto);
	public int getreviewcount(String id);
	
	public int getRvCount(ReviewParam param);
	public int getLikeCount(ReviewParam param);
	
	public ReviewDto getReviewDetail(int rv_seq);
}
