package com.marondalgram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/sign_in_view")
	public String signIn(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}
	
	/**
	 * 회원가입 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/sign_up_view")
	public String signUp(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout";
	}
	
	/**
	 * 로그아웃
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userProfileImage");
		session.removeAttribute("userNickName");
		return "redirect:/timeline/list_view";
	}
}
