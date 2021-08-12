package com.spring.myweb.freeboard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myweb.command.FreeboardVO;
import com.spring.myweb.freeboard.mapper.IFreeBoardMapper;
import com.spring.myweb.util.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class FreeBoardMapperTest {
	
	@Autowired
	private IFreeBoardMapper mapper;
	
	@Test
	public void registTest() {
		
		for(int i = 1; i <= 320; i++) {
			FreeboardVO vo = new FreeboardVO();
			vo.setTitle("테스트 글쓰기 " + i);
			vo.setWriter("테스트 등록자" + i);
			vo.setContent("테스트 내용" + i);
			mapper.regist(vo);
		}
	}
	
	@Test
	public void getListTest() {
		PageVO vo = new PageVO();
		mapper.getList(vo).forEach(v -> System.out.println(v));
	}
	
	@Test
	public void getTotalTest() {
		PageVO vo = new PageVO();
		System.out.println(mapper.getTotal(vo));
	}
	
	@Test
	public void getContentTest() {
		System.out.println(mapper.getContent(30));
	}
	
	@Test
	public void updateTest() {
		FreeboardVO vo = new FreeboardVO();
		vo.setBno(300);
		vo.setContent("수정된 내용");
		vo.setTitle("수정된 제목");
		mapper.update(vo);
		System.out.println(mapper.getContent(300));
	}
	
	@Test
	public void deleteTest() {
		mapper.delete(1);
		PageVO vo = new PageVO();
		System.out.println(mapper.getTotal(vo));
	}
}
