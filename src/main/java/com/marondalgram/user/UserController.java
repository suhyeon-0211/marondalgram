package com.marondalgram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondalgram.user.bo.UserBO;

@Controller
public class UserController {

	@Autowired
	private UserBO userBO;
	
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
	
	@RequestMapping("/user/user_update_view")
	public String userUpdate(Model model, HttpServletRequest request) {
		model.addAttribute("viewName", "user/user_update_view");
		return "template/layout";
	}
}
