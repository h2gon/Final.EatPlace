package kh.c.five.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.c.five.dao.EatMemberDao;
import kh.c.five.model.EatMemberDto;
import kh.c.five.service.EatMemberService;


@Service
public class EatMemberServiceImpl implements EatMemberService {
	
	@Autowired
	EatMemberDao eatmemberdao;

	@Override
	public boolean addmember(EatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return eatmemberdao.addmember(mem);
	}
	
	@Override
	public int getID(EatMemberDto mem) {
		// TODO Auto-generated method stub
		return eatmemberdao.getID(mem);
	}
	
	@Override
	public EatMemberDto login(EatMemberDto mem) throws Exception {
		// TODO Auto-generated method stub
		return eatmemberdao.login(mem);
	}

}
