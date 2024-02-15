package egovframework.example.board.service;

import java.util.List;

public interface BoardService {
	String insertBoard(BoardVO boardVO) throws Exception;

	/*글을 수정한다.*/
	void updateBoard(BoardVO boardVO) throws Exception;

	/*글을 삭제한다.*/
	void deleteBoard(BoardVO boardVO) throws Exception;

	/*글을 조회한다.*/
	BoardVO selectBoard(BoardVO boardVO) throws Exception;

	/*글 목록을 조회한다.*/
	List<?> selectBoardList(BoardDefaultVO searchVO) throws Exception;

	/*글 총 갯수를 조회한다.*/
	int selectBoardListTotCnt(BoardDefaultVO searchVO);
}
