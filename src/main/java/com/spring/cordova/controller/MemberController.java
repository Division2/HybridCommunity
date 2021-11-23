package com.spring.cordova.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.cordova.dto.MemberDTO;
import com.spring.cordova.service.MemberService;

@RestController
public class MemberController {

	@Inject private MemberService service;
	
	//로그인
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public MemberDTO Login(MemberDTO dto, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO member = service.LoginCheck(dto);
		
		if (member != null) {
			session.setAttribute("member", member);
		}
		return member;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>location.href='/';</script>");
		out.close();
	}
	
	//아이디 찾기
	@RequestMapping(value = "/findUserID", method = RequestMethod.POST)
	public @ResponseBody String findUserID(MemberDTO dto) throws Exception {
		
		String userId = service.findUserID(dto);
		
		return userId;
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public @ResponseBody String findPassword(MemberDTO dto) throws Exception {
		
		String password = service.findPassword(dto);
		
		return password;
	}
}