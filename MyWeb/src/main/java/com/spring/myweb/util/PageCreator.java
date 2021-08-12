package com.spring.myweb.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//페이지 버튼 알고리즘
@Getter
@Setter
@ToString
public class PageCreator {
	
	private int startPage;
	private int endPage;
	private int totalPage;
	private int maximumPageNum;
	
	private boolean prevPage;
	private boolean nextPage;
	
	public PageCreator() {
		startPage = 1;
		maximumPageNum = 5;
	}
	
	//전체 페이지 계산 처리
	public void calcPageCreatorVals(int total, PageVO page) {
		calcTotalPage(total, page);
		calcEndPage();
		setPrevNextPage();
	}
	
	//총 페이지 구하기
	private void calcTotalPage(int total, PageVO page) {
		totalPage = (int) Math.ceil((double)total / page.getCountPerPage());
	}
	
	//마지막 페이지 구하기
	private void calcEndPage() {
		if((totalPage - startPage) >= maximumPageNum - 1) {
			endPage = startPage + maximumPageNum - 1;			
		} else {			
			endPage = totalPage;			
		}
	}
	
	//이전, 이후 페이지 버튼 출력 여부 구하기
	private void setPrevNextPage() {
		if(startPage == 1) {
			prevPage = false;
		} else {
			prevPage = true;
		}
		
		if((startPage + maximumPageNum - 1) < totalPage) {
			nextPage = true;
		} else {
			nextPage = false;
		}
	}
	
	
//	public void 
}
