package kh.c.five.model;

import java.io.Serializable;

public class ReviewDetail implements Serializable {
	
	private int rv_seq;
	private String id;
	private String nickname;
	private String rs_content;
	private String filename;
	
	public ReviewDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDetail(int rv_seq, String id, String nickname, String rs_content, String filename) {
		super();
		this.rv_seq = rv_seq;
		this.id = id;
		this.nickname = nickname;
		this.rs_content = rs_content;
		this.filename = filename;
	}
	public int getRv_seq() {
		return rv_seq;
	}
	public void setRv_seq(int rv_seq) {
		this.rv_seq = rv_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRs_content() {
		return rs_content;
	}
	public void setRs_content(String rs_content) {
		this.rs_content = rs_content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "ReviewDetail [rv_seq=" + rv_seq + ", id=" + id + ", nickname=" + nickname + ", rs_content=" + rs_content
				+ ", filename=" + filename + "]";
	}
	
	

}
