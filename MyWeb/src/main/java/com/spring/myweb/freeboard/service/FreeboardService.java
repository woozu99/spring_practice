package com.spring.myweb.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myweb.command.FreeboardVO;
import com.spring.myweb.freeboard.mapper.IFreeBoardMapper;
import com.spring.myweb.util.PageVO;

@Service
public class FreeboardService implements IFreeboardService {

	@Autowired
	private IFreeBoardMapper mapper;
	
	@Override
	public void regist(FreeboardVO article) {
		mapper.regist(article);

	}

	@Override
	public List<FreeboardVO> getList(PageVO page) {
		int start, end;
		return mapper.getList(page);
	}

	@Override
	public int getTotal(PageVO page) {
		return mapper.getTotal(page);
	}

	@Override
	public FreeboardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(FreeboardVO article) {
		mapper.update(article);

	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

}
