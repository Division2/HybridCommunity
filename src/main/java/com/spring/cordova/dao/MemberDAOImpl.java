package com.spring.cordova.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.cordova.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject private SqlSession sqlSession;
	private static final String namespace = "com.spring.cordova.MemberMapper";
	
	//로그인
	@Override
	public MemberDTO LoginCheck(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".LoginCheck", dto);
	}

	//아이디 찾기
	@Override
	public String findUserID(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".findUserID", dto);
	}

	//비밀번호 찾기
	@Override
	public String findPassword(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".findPassword", dto);
	}
}