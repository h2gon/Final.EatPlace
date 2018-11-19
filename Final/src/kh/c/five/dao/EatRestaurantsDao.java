package kh.c.five.dao;

import java.util.List;

import kh.c.five.model.InsertDto;
import kh.c.five.model.RegiDto;

public interface EatRestaurantsDao {
	
	public boolean InsertRS(RegiDto dto);
	
	public List<RegiDto> getRs_List();

	public RegiDto getrs(int seq) throws Exception;
	
}
