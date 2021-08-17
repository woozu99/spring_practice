package com.spring.myweb.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE freereply(
    rno NUMBER(10, 0), -- 댓글번호
    bno NUMBER(10, 0), -- 글번호
    reply VARCHAR2(1000), -- 내용
    reply_id VARCHAR2(50), -- 글쓴이
    reply_pw VARCHAR2(50), -- 비밀번호
    reply_date DATE DEFAULT SYSDATE, --등록일
    update_date DATE DEFAULT NULL
);

ALTER TABLE freereply
ADD CONSTRAINT freereply_pk PRIMARY KEY(rno);

# ON DELETE CASCADE: 부모테이블이 삭제되면 자식요소들 다 삭제
# ON DELETE SET NULL: 데이터는 남기고 부모테이블을 null로 설정

(외래키를 설정하면 참조무결성 규칙이 발동된다. 참조 무결성: 참조 관계에 있는 두 테이블의 데이터는 항상 일관된 값을 가져야 한다.)
데이터베이스 구조가 많이 복잡하지 않는다면 논리적 모델링까지는 fk를 설정하지만 물리적에서는 생략하는 경우도 있다.

ALTER TABLE freereply
ADD CONSTRAINT freereply_fk FOREIGN KEY(bno)
REFERENCES freeboard(bno) ON DELETE CASCADE;

CREATE SEQUENCE freereply_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 1000
NOCACHE
NOCYCLE;
 */

@Setter
@Getter
@ToString
public class ReplyVO {
	
	private int rno;
	private int bno;
	
	private String reply;
	private String replyId;
	private String replyPw;
	private Timestamp replyDate;
	private Timestamp updateDate;
	
}
