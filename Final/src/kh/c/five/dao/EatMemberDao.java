package kh.c.five.dao;

import kh.c.five.model.MemberDto;

public interface EatMemberDao {
	
	
	boolean addmember(MemberDto mem) throws Exception;
	
	MemberDto login(MemberDto mem) throws Exception;
	
	int getID(MemberDto mem);

}
