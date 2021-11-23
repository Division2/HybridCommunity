package com.spring.cordova;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	//메인 홈페이지 & 로그인
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	//게시글 리스트 출력
	@RequestMapping("boardList")
	public String boardList() {
		return "board/boardList";
	}
	//게시글 등록 화면
	@RequestMapping("boardWriteView")
	public String boardWriteView() {
		return "board/boardWriteView";
	}
	//게시글 수정 화면
	@RequestMapping("boardModifyView")
	public String boardModifyView() {
		return "board/boardModifyView";
	}
}