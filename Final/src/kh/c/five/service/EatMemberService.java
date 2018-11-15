package kh.c.five.service;

import kh.c.five.model.MemberDto;

public interface EatMemberService {
	
public boolean addmember(MemberDto mem) throws Exception;
	
	public MemberDto login(MemberDto mem) throws Exception;
	
	public int getID(MemberDto mem);

}
