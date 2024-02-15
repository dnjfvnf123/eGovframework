package egovframework.example.board.web;

import java.util.List;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.board.service.BoardDefaultVO;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.BoardVO;

@Controller
public class BoardController {
	/** EgovSampleService */
	@Resource(name = "boardService")
	private BoardService boardService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
/* ---------------------------------------------------------------------------------------- */
	/*글 목록을 조회한다. (pageing)*/
	@RequestMapping(value = "/BoardList.do")
	public String selectBoardList(@ModelAttribute("searchVO") BoardDefaultVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> sampleList = boardService.selectBoardList(searchVO);
		model.addAttribute("resultList", sampleList);

		int totCnt = boardService.selectBoardListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "board/BoardList";
	}
	/* ---------------------------------------------------------------------------------------- */
	/*글 등록 화면을 조회한다.*/
	@RequestMapping(value = "/addBoard.do", method = RequestMethod.GET)
	public String addSampleView(@ModelAttribute("searchVO") BoardDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("boardVO", new BoardVO());
		return "board/BoardRegister";
	}
	/* ---------------------------------------------------------------------------------------- */
	/*글을 등록한다.*/
	@RequestMapping(value = "/addBoard.do", method = RequestMethod.POST)
	public String addBoard(@ModelAttribute("searchVO") BoardDefaultVO searchVO, BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		// Server-Side Validation
		beanValidator.validate(boardVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("boardVO", boardVO);
			return "board/BoardRegister";
		}

		boardService.insertBoard(boardVO);
		status.setComplete();
		return "forward:/BoardList.do";
	}
	/* ---------------------------------------------------------------------------------------- */
	/*글 수정화면을 조회한다.*/
	@RequestMapping("/updateBoardView.do")
	public String updateSampleView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") BoardDefaultVO searchVO, Model model) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setId(id);
		// 변수명은 CoC 에 따라 sampleVO
		model.addAttribute(selectBoard(boardVO, searchVO));
		return "board/BoardRegister";
	}
	/* ---------------------------------------------------------------------------------------- */
	/*글을 조회한다.*/
	public BoardVO selectBoard(BoardVO boardVO, @ModelAttribute("searchVO") BoardDefaultVO searchVO) throws Exception {
		return boardService.selectBoard(boardVO);
	}
	/* ---------------------------------------------------------------------------------------- */
	/*글을 수정한다.*/
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("searchVO") BoardDefaultVO searchVO, BoardVO boardVO, BindingResult bindingResult, Model model, SessionStatus status)
	        throws Exception {

	    beanValidator.validate(boardVO, bindingResult);

	    if (bindingResult.hasErrors()) {
	        model.addAttribute("boardVO", boardVO);
	        return "board/BoardRegister";
	    }

	    boardService.updateBoard(boardVO);
	    status.setComplete();
	    return "forward:/BoardList.do";
	}

	/* ---------------------------------------------------------------------------------------- */
	/*글을 삭제한다.*/
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO boardVO, @ModelAttribute("searchVO") BoardDefaultVO searchVO, SessionStatus status) throws Exception {
	    boardService.deleteBoard(boardVO);
	    status.setComplete();
	    return "forward:/BoardList.do";
	}

}
