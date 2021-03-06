package kh.c.five.dao;

import kh.c.five.model.EatMemberDto;
import kh.c.five.model.LikeDto;

public interface EatMemberDao {
	
	
	boolean addmember(EatMemberDto mem) throws Exception;
	
	int getID(EatMemberDto mem);
	
	int getNickName(EatMemberDto mem);
	
	EatMemberDto login(EatMemberDto mem) throws Exception;
	
	boolean insertLike(LikeDto dto);
	boolean getLike(LikeDto dto);
	
}
