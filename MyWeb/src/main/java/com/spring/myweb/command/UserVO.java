package com.spring.myweb.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE users(
    user_id VARCHAR2(50),
    user_pw VARCHAR2(50) NOT NULL,
    user_name VARCHAR2(50) NOT NULL,
    user_phone_1 VARCHAR2(50),
    user_phone_2 VARCHAR2(50),
    user_email_1 VARCHAR2(50),
    user_email_2 VARCHAR2(50),
    addr_basic VARCHAR2(300),
    addr_detail VARCHAR2(300),
    addr_zip_num VARCHAR2(50),
    reg_date Date DEFAULT SYSDATE
);

ALTER TABLE users
ADD CONSTRAINT user_id_pk PRIMARY KEY(user_id);
 */

@Getter
@Setter
@ToString
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String userEmail1;
	private String userEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
    private Timestamp regDate;
}
