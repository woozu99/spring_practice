package com.spring.myweb.reply;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myweb.command.ReplyVO;
import com.spring.myweb.reply.mapper.IReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class replyDBTest {
	
	@Autowired
	IReplyMapper mapper;
	
	@Test
	public void replyInsertTest() {
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(200);
		vo.setReply("rerere");
		vo.setReplyId("ididid");
		vo.setReplyPw("pwpwpw");
		mapper.replyRegist(vo);
	}
	
}
