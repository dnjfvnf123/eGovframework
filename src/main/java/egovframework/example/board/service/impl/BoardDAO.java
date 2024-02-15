package egovframework.example.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.example.board.service.BoardDefaultVO;
import egovframework.example.board.service.BoardVO;
import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;

@Repository
public class BoardDAO extends EgovAbstractDAO {

    /*글을 등록한다.*/
    public String insertBoard(BoardVO boardVO) throws Exception {
        return (String) insert("boardDAO.insertBoard", boardVO);
    }

    /*글을 수정한다.*/
    public void updateBoard(BoardVO boardVO) throws Exception {
        update("boardDAO.updateBoard", boardVO);
    }

    /*글을 삭제한다.*/
    public void deleteBoard(BoardVO boardVO) throws Exception {
        delete("boardDAO.deleteBoard", boardVO);
    }

    /*글을 조회한다.*/
    public BoardVO selectBoard(BoardVO boardVO) throws Exception {
        return (BoardVO) select("boardDAO.selectBoard", boardVO);
    }

    /*글 목록을 조회한다.*/
    public List<?> selectBoardList(BoardDefaultVO searchVO) throws Exception {
        return list("boardDAO.selectBoardList", searchVO);
    }

    /*글 총 갯수를 조회한다.*/
    public int selectBoardListTotCnt(BoardDefaultVO searchVO) {
        return (Integer) select("boardDAO.selectBoardListTotCnt", searchVO);
    }
}
