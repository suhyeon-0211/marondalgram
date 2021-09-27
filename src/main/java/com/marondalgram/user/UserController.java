package com.marondalgram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping("/user/sign_in_view")
	public String signIn() {
		return "user/sign_in_view";
	}
	
	@RequestMapping("/user/sign_up_view")
	public String signUp() {
		return "user/sign_up_view";
	}
}
