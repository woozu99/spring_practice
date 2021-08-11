package com.spring.myweb.freeboard.mapper;

import java.util.List;

import com.spring.myweb.command.FreeboardVO;
import com.spring.myweb.util.PageVO;

public interface IFreeBoardMapper {
	
	//글 등록
	void regist(FreeboardVO article);
	
	//글 목록
	List<FreeboardVO> getList(int start, int end, PageVO page);
	
	//총 게시물 수
	int getTotal();
	
	//상세보기
	FreeboardVO getContent(int bno);
	
	//수정
	void update(FreeboardVO article);
	
	//삭제
	void delete(int bno);
	
}
