package com.spring.cordova.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.cordova.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject private SqlSession sqlSession;
	private static final String namespace = "com.spring.cordova.BoardMapper";
	
	//게시글 리스트 출력
	@Override
	public List<BoardDTO> boardList(HashMap<String, Integer> boardListMap) throws Exception {
		return sqlSession.selectList(namespace + ".BoardList", boardListMap);
	}
	
	//게시글 검색 리스트 출력
	@Override
	public List<BoardDTO> boardSearchList(HashMap<String, Object> boardSearchListMap) throws Exception {
		return sqlSession.selectList(namespace + ".BoardSearchList", boardSearchListMap);
	}
	
	//게시글 총 갯수 조회
	@Override
	public int boardListCount() throws Exception {
		return sqlSession.selectOne(namespace + ".BoardListCount");
	}
	
	//게시글 검색 총 갯수 조회
	@Override
	public int boardSearchListCount(HashMap<String, Object> boardSearchListMap) throws Exception {
		return sqlSession.selectOne(namespace + ".BoardSearchListCount", boardSearchListMap);
	}

	//게시글 조회
	@Override
	public BoardDTO boardView(int bno) throws Exception {
		return sqlSession.selectOne(namespace + ".BoardView", bno);
	}

	//게시글 등록
	public int boardWrite(BoardDTO dto) throws Exception {
		return sqlSession.insert(namespace + ".BoardWrite", dto);
	}
	
	//게시글 수정
	@Override
	public int boardModify(BoardDTO dto) throws Exception {
		return sqlSession.update(namespace + ".BoardModify", dto);
	}

	//게시글 삭제
	@Override
	public int boardDelete(int bno) throws Exception {
		return sqlSession.delete(namespace + ".BoardDelete", bno);
	}

	//게시글 첨부파일 조회
	@Override
	public String boardFileSearch(int bno) throws Exception {
		return sqlSession.selectOne(namespace + ".BoardFileSearch", bno);
	}
}