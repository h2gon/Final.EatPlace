package kh.c.five.model;

import java.io.Serializable;

public class ReviewParam implements Serializable {
	
	private int seq;
	private int reviewCount;
	private int like;
	
	public ReviewParam() {}

	public ReviewParam(int seq, int reviewCount, int like) {
		super();
		this.seq = seq;
		this.reviewCount = reviewCount;
		this.like = like;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "ReviewParam [seq=" + seq + ", reviewCount=" + reviewCount + ", like=" + like + "]";
	}

	

}
