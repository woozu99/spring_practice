package com.spring.myweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myweb.user.service.UserService;

//주소api 승인 키(~2021-08-24)
//devU01TX0FVVEgyMDIxMDgxNzE1NDQzMDExMTUzNDk=

@Controller
@RequestMapping("/user")
public class UserController {
	
	//서비스 객체 주입
	@Autowired
	UserService service;
	
	@GetMapping("/userJoin")
	public String userJoin() {
		return "/user/userJoin";
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		if(service.idCheck(userId) == 1) {
			return "isId";
		} else {
			return "isNotId";
		}
	}
}
