package kh.c.five.service;

import java.util.List;

import kh.c.five.model.ReviewDto;
import kh.c.five.model.fileDto;

public interface EatReviewService {
	public List<String> getImage(int rv_seq);
	
	public Integer addReview(ReviewDto rdto);
	public void addFile(fileDto fdto);

}
