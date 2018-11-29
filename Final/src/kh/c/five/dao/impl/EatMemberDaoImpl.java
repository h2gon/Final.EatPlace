package kh.c.five.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.c.five.dao.EatMemberDao;
import kh.c.five.model.EatMemberDto;
import kh.c.five.model.LikeDto;


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

	@Override
	public boolean insertLike(LikeDto dto) {
		int n = sqlSession.insert(namespace+"insertLike", dto);
		return n>0?true:false;
	}

	@Override
	public boolean getLike(LikeDto dto) {
		LikeDto dt = sqlSession.selectOne(namespace+"getLike", dto);
		int n=0;
		if(dt==null) { // 검색 걸리는게 없음. 좋아요 안 해둠.
			n=0;
		}else if(dt!=null) {
			n=1; // 검색 걸리는게 있음. 좋아요 해둠.
		}
		return n>0?true:false;
	}

}
