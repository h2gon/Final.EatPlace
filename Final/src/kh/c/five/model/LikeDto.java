package kh.c.five.model;

import java.io.Serializable;

public class LikeDto implements Serializable {

	private int seq;
	private String id;
	private int rs_seq;
	private String rs_name;
	
	public LikeDto() {
		// TODO Auto-generated constructor stub
	}

	public LikeDto(int seq, String id, int rs_seq, String rs_name) {
		super();
		this.seq = seq;
		this.id = id;
		this.rs_seq = rs_seq;
		this.rs_name = rs_name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getID() {
		return id;
	}

	public void setID(String id) {
		this.id = id;
	}

	public int getRs_seq() {
		return rs_seq;
	}

	public void setRs_seq(int rs_seq) {
		this.rs_seq = rs_seq;
	}

	public String getRs_name() {
		return rs_name;
	}

	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}

	@Override
	public String toString() {
		return "LikeDto [seq=" + seq + ", ID=" + id + ", rs_seq=" + rs_seq + ", rs_name=" + rs_name + "]";
	}
	
	
}
