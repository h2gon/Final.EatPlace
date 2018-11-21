package kh.c.five.model;

import java.io.Serializable;

public class fileDto implements Serializable {
	private int seq;
    private String o_name;
    private String file_name;
    private long file_size;
    private int rs_seq;
    
    public fileDto() {
		// TODO Auto-generated constructor stub
	}

	public fileDto(int seq, String o_name, String file_name, long file_size, int rs_seq) {
		super();
		this.seq = seq;
		this.o_name = o_name;
		this.file_name = file_name;
		this.file_size = file_size;
		this.rs_seq = rs_seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	public int getrs_seq() {
		return rs_seq;
	}

	public void setrs_seq(int rs_seq) {
		this.rs_seq = rs_seq;
	}

	@Override
	public String toString() {
		return "fileDto [seq=" + seq + ", o_name=" + o_name + ", file_name=" + file_name + ", file_size=" + file_size
				+ ", rs_seq=" + rs_seq + "]";
	}
    
    
}
