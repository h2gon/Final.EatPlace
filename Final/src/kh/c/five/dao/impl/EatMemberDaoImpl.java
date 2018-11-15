package kh.c.five.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatMemberDao;
import kh.c.five.model.MemberDto;


@Repository
public class EatMemberDaoImpl implements EatMemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "EatMember.";


	@Override
	public boolean addmember(MemberDto mem) throws Exception {
		int n = sqlSession.insert(namespace + "addmember", mem);
		
		return n>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto mem) throws Exception {
		return sqlSession.selectOne(namespace + "login", mem);
	}

	@Override
	public int getID(MemberDto mem) {
		return sqlSession.selectOne(namespace + "getID", mem);
	}

}
