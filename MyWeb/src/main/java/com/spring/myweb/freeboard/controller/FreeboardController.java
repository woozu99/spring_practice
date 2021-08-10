package com.spring.myweb.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.myweb.command.FreeboardVO;
import com.spring.myweb.freeboard.service.IFreeboardService;

@Controller
@RequestMapping("/freeBoard")
public class FreeboardController {

	@Autowired
	private IFreeboardService service;
	
	//목록화면
	@GetMapping("/freeList")
	public void freeList(Model model) {
		
		System.out.println("/freeList: GET");
		model.addAttribute("boardList", service.getList());

	}
	
	//글쓰기화면
	@GetMapping("/freeRegist")
	public void freeRegist() {
		
		System.out.println("/freeRegist: GET");
		//로그인 사용자 정보 넘기기
		
	}
	
	//글 등록
	@PostMapping("/freeRegist")
	public String regist(FreeboardVO article) {
		
		System.out.println("/freeRegist: POST");
		System.out.println(article);
		
		service.regist(article);
		
		
		return "redirect:/freeBoard/freeList";
	}
	
	//글 상세보기
	@GetMapping("/freeDetail/{bno}")
	public String freeDetail(@PathVariable int bno, Model model) {
		
		System.out.println("/freeDetail: GET");
		model.addAttribute("article", service.getContent(bno));
		
		return "/freeBoard/freeDetail";
	}
	
	//글 수정
}
