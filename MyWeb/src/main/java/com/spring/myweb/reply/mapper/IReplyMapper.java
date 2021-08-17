package com.spring.myweb.reply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.myweb.command.ReplyVO;

public interface IReplyMapper {
	
	//댓글 등록
	int replyRegist(ReplyVO vo);
	
	//댓글 목록 요청
//	List<ReplyVO> getList(int bno);
	List<ReplyVO> getList(Map<String, Object> map);
	
	//댓글 개수
	int getTotal(int bno);
	
	//비밀번호 확인
	int pwCheck(ReplyVO vo);
	
	//댓글 수정
	void update(ReplyVO vo);
	
	//댓글 삭제
	void delete(int rno);
}
