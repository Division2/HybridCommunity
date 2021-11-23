package com.spring.cordova.service;

import org.springframework.stereotype.Service;

import com.spring.cordova.dto.MemberDTO;

@Service
public interface MemberService {
	
	//로그인
	public MemberDTO LoginCheck(MemberDTO dto) throws Exception;
	
	//아이디 찾기
	public String findUserID(MemberDTO dto) throws Exception;
	
	//비밀번호 찾기
	public String findPassword(MemberDTO dto) throws Exception;
}