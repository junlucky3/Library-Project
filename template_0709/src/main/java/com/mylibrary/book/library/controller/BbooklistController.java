package com.mylibrary.book.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mylibrary.book.library.service.BbooklistService;
import com.mylibrary.book.library.vo.PagingVO;

@Controller
@RequestMapping("/user")
public class BbooklistController {
	
	@Autowired
	BbooklistService Bbooklistservice;
		
	@RequestMapping("/BbooklistMain")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = Bbooklistservice.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("bbooklist", Bbooklistservice.selectBoard(vo));
		model.addAttribute("paging", vo);
//		model.addAttribute("viewAll", Bbooklistservice.selectBoard(vo));
		return "library/books-media-list-view";
	}
}