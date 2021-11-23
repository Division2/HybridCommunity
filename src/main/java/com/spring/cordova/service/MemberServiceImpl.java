package com.spring.cordova.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.cordova.dao.MemberDAO;
import com.spring.cordova.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject private MemberDAO dao;

	//로그인
	@Override
	public MemberDTO LoginCheck(MemberDTO dto) throws Exception {
		return dao.LoginCheck(dto);
	}

	//아이디 찾기
	@Override
	public String findUserID(MemberDTO dto) throws Exception {
		return dao.findUserID(dto);
	}

	//비밀번호 찾기
	@Override
	public String findPassword(MemberDTO dto) throws Exception {
		return dao.findPassword(dto);
	}
}