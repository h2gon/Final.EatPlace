package kh.c.five.model;

import java.io.Serializable;
import java.util.List;

import kh.c.five.model.ReviewDto;


public class WildCard<S1, S2> implements Serializable {
	//영곤짱 이렇게도 쓸 수 있어요~ ㅎㅎ 
	private ReviewDto rdto;
	private List<String> flist;
	
	public WildCard() {}

	public WildCard(ReviewDto rdto, List<String> flist) {
		super();
		this.rdto = rdto;
		this.flist = flist;
	}

	public ReviewDto getRdto() {
		return rdto;
	}

	public void setRdto(ReviewDto rdto) {
		this.rdto = rdto;
	}

	public List<String> getFlist() {
		return flist;
	}

	public void setFlist(List<String> flist) {
		this.flist = flist;
	}
	
		

}
