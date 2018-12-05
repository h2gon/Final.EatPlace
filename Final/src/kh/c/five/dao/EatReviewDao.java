package kh.c.five.dao;

import java.util.List;

import kh.c.five.model.ReviewDto;
import kh.c.five.model.ReviewParam;
import kh.c.five.model.fileDto;


public interface EatReviewDao {
	public List<fileDto> getImage(int rv_seq);
	public List<String> getImageDT(int rs_seq); // pickup images per rests 
	ReviewDto getReviewWPic (fileDto fdto); // 이미지 파일이름과 레스토랑 번호에 해당하는 리뷰 본문 가져오기
	
	Integer addReview(ReviewDto rdto);
	
	void addFile(fileDto fdto);
	

	int getreviewcount(String id);
	
	public int getRvCount(ReviewParam param);
	
	public int getLikeCount(ReviewParam param);
	
	List<fileDto> getRv_Image(int rv_seq);
	
	public String getNickName(String id);
	public ReviewDto getReviewDetail(int rv_seq);
	

}
