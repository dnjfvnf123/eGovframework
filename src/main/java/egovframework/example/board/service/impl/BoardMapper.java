package egovframework.example.board.service.impl;

import java.util.List;

import egovframework.example.board.service.BoardDefaultVO;
import egovframework.example.board.service.BoardVO;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {

	//글 등록
	void insertBoard(BoardVO boardVO) throws Exception;

	//글 수정
	void updateBoard(BoardVO boardVO) throws Exception;
	
	//글 삭제
	void deleteBoard(BoardVO boardVO) throws Exception;
	
	//글 조회
	BoardVO selectBoard(BoardVO boardVO) throws Exception;
	
	//글 목록 조회
	List<?> selectBoardList(BoardDefaultVO searchVO) throws Exception;
	
	//글 총 갯수 조회
	int selectBoardListTotCnt(BoardDefaultVO searchVO);
}
