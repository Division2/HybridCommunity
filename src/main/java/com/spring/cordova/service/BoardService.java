package com.spring.cordova.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.cordova.dto.BoardDTO;

@Service
public interface BoardService {
	//게시글 리스트 출력
	public List<BoardDTO> boardList(HashMap<String, Integer> boardListMap) throws Exception;
	//게시글 검색 리스트 출력
	public List<BoardDTO> boardSearchList(HashMap<String, Object> boardSearchListMap) throws Exception;
	//게시글 총 갯수 조회
	public int boardListCount() throws Exception;
	//게시글 검색 총 갯수 조회
	public int boardSearchListCount(HashMap<String, Object> boardSearchListMap) throws Exception;
	//게시글 조회
	public BoardDTO boardView(int bno) throws Exception;
	//게시글 등록
	public int boardWrite(BoardDTO dto) throws Exception;
	//게시글 수정
	public int boardModify(BoardDTO dto) throws Exception;
	//게시글 삭제
	public int boardDelete(int bno) throws Exception;
	//게시글 첨부파일 조회
	public String boardFileSearch(int bno) throws Exception;
}