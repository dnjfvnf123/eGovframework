package egovframework.example.sample.web;

import javax.swing.border.TitledBorder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.impl.boardVO;

// 어노테이션 - 기능구현
// @ : 주석
@Controller
public class BoardController {

	@RequestMapping(value="/boardWrite.do")
	public String boardWrite(){
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/boardWriteSave.do")
	public String boardWriteSave(boardVO vo){
		
		System.out.println("게시글 번호 : " + vo.getDeptno());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("내용 : " + vo.getContent());
		
		return "";
	}	
	
}