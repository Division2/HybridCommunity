package com.spring.cordova.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.cordova.dao.BoardDAO;
import com.spring.cordova.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject private BoardDAO dao;
	
	//게시글 리스트 출력
	@Override
	public List<BoardDTO> boardList(HashMap<String, Integer> boardListMap) throws Exception {
		return dao.boardList(boardListMap);
	}
	
	//게시글 검색 리스트 출력
	@Override
	public List<BoardDTO> boardSearchList(HashMap<String, Object> boardSearchListMap) throws Exception {
		return dao.boardSearchList(boardSearchListMap);
	}

	//게시글 총 갯수 조회
	@Override
	public int boardListCount() throws Exception {
		return dao.boardListCount();
	}
	
	//게시글 검색 총 갯수 조회
	@Override
	public int boardSearchListCount(HashMap<String, Object> boardSearchListMap) throws Exception {
		return dao.boardSearchListCount(boardSearchListMap);
	}

	//게시글 조회
	@Override
	public BoardDTO boardView(int bno) throws Exception {
		return dao.boardView(bno);
	}

	//게시글 등록
	@Override
	public int boardWrite(BoardDTO dto) throws Exception {
		return dao.boardWrite(dto);
	}
	
	//게시글 수정
	@Override
	public int boardModify(BoardDTO dto) throws Exception {
		return dao.boardModify(dto);
	}
	
	//게시글 삭제
	@Override
	public int boardDelete(int bno) throws Exception {
		return dao.boardDelete(bno);
	}

	//게시글 첨부파일 조회
	@Override
	public String boardFileSearch(int bno) throws Exception {
		return dao.boardFileSearch(bno);
	}
}