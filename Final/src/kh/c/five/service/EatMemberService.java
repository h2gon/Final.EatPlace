package kh.c.five.service;

import kh.c.five.dao.EatMemberDao;
import kh.c.five.model.EatMemberDto;

public interface EatMemberService {
	
	public boolean addmember(EatMemberDto mem) throws Exception;
	
	public int getID(EatMemberDto mem);
	
	public int getNickName(EatMemberDto mem);
	
	public EatMemberDto login(EatMemberDto mem) throws Exception;
	
}
