package kh.c.five.dao;

import kh.c.five.model.EatMemberDto;

public interface EatMemberDao {
	
	
	boolean addmember(EatMemberDto mem) throws Exception;
	
	int getID(EatMemberDto mem);
	
	EatMemberDto login(EatMemberDto mem) throws Exception;
	
}
