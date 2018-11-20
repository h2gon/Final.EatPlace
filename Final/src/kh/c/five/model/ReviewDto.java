package kh.c.five.model;

import java.io.Serializable;

public class ReviewDto implements Serializable {
	
	private int seq;
	private String id;
	private int rs_seq;
	private String rs_content;
	private int rs_rating;
	
	public ReviewDto() {}

	public ReviewDto(int seq, String id, int rs_seq, String rs_content, int rs_rating) {
		super();
		this.seq = seq;
		this.id = id;
		this.rs_seq = rs_seq;
		this.rs_content = rs_content;
		this.rs_rating = rs_rating;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRs_seq() {
		return rs_seq;
	}

	public void setRs_seq(int rs_seq) {
		this.rs_seq = rs_seq;
	}

	public String getRs_content() {
		return rs_content;
	}

	public void setRs_content(String rs_content) {
		this.rs_content = rs_content;
	}

	public int getRs_rating() {
		return rs_rating;
	}

	public void setRs_rating(int rs_rating) {
		this.rs_rating = rs_rating;
	}

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", id=" + id + ", rs_seq=" + rs_seq + ", rs_content=" + rs_content
				+ ", rs_rating=" + rs_rating + "]";
	}
	
	

}
