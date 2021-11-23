package com.spring.cordova.dao;

import org.springframework.stereotype.Repository;

import com.spring.cordova.dto.MemberDTO;

@Repository
public interface MemberDAO {
	
	//로그인
	public MemberDTO LoginCheck(MemberDTO dto) throws Exception;
	
	//아이디 찾기
	public String findUserID(MemberDTO dto) throws Exception;
	
	//비밀번호 찾기
	public String findPassword(MemberDTO dto) throws Exception;
}