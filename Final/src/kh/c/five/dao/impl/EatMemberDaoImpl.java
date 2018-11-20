package kh.c.five.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatMemberDao;
import kh.c.five.model.EatMemberDto;


@Repository
public class EatMemberDaoImpl implements EatMemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "EatMember.";


	@Override
	public boolean addmember(EatMemberDto mem) throws Exception {
		int n = sqlSession.insert(namespace + "addmember", mem);
		
		return n>0?true:false;
	}
	
	@Override
	public int getID(EatMemberDto mem) {
		return sqlSession.selectOne(namespace + "getID", mem);
	}
	
	@Override
	public int getNickName(EatMemberDto mem) {
		return sqlSession.selectOne(namespace + "getNickName", mem);
	}
	
	@Override
	public EatMemberDto login(EatMemberDto mem) throws Exception {
		return sqlSession.selectOne(namespace + "login", mem);
	}

}
