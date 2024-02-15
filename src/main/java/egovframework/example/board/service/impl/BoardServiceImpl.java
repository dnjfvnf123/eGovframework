package egovframework.example.board.service.impl;

import java.util.List;

import egovframework.example.board.service.BoardVO;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardDefaultVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

    private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

    @Resource(name = "boardDAO")
    private BoardDAO boardDAO;

    @Resource(name = "egovIdGnrService")
    private EgovIdGnrService egovIdGnrService;

    @Override
    public String insertBoard(BoardVO boardVO) throws Exception {
        LOGGER.debug(boardVO.toString());
        String id = egovIdGnrService.getNextStringId();
        boardVO.setId(id);
        LOGGER.debug(boardVO.toString());
        boardDAO.insertBoard(boardVO);
        return id;
    }

    @Override
    public void updateBoard(BoardVO boardVO) throws Exception {
        boardDAO.updateBoard(boardVO);
    }

    @Override
    public void deleteBoard(BoardVO boardVO) throws Exception {
        boardDAO.deleteBoard(boardVO);
    }

    @Override
	public BoardVO selectBoard(BoardVO boardvo) throws Exception {
    	BoardVO resultVO = boardDAO.selectBoard(boardvo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

    @Override
    public List<?> selectBoardList(BoardDefaultVO searchVO) throws Exception {
        return boardDAO.selectBoardList(searchVO);
    }

    @Override
    public int selectBoardListTotCnt(BoardDefaultVO searchVO) {
        return boardDAO.selectBoardListTotCnt(searchVO);
    }
}
