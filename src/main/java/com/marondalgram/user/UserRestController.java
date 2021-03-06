package com.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.EncryptUtils;
import com.marondalgram.user.bo.UserBO;
import com.marondalgram.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복확인
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Boolean> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", userBO.existLoginId(loginId));
		return result;
	}
	
	
	//TODO jsp에서 ajax까지해서 사진 파일 넘겼고 나머지 처리 하면 됨
	/**
	 * 회원가입
	 * @param user
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@ModelAttribute User user,
			@RequestParam("file") MultipartFile file) {
		// password hashing
		user.setPassword(EncryptUtils.md5(user.getPassword()));
		
		Map<String, Object> result = new HashMap<>();
		int insertCnt = userBO.addUser(user, file);
		if (insertCnt > 0) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		// 비밀번호 해싱
		String encryptPassword = EncryptUtils.md5(password);
		
		// DB SELECT
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userProfileImage", user.getProfileImage());
			session.setAttribute("userNickname", user.getNickname());
			
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@PostMapping("/update")
	public Map<String, Object> userUpdate(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("nickname") String nickname,
			@RequestParam("email") String email,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		String ecryptPassword = EncryptUtils.md5(password);
		userBO.updateUserByUserId(userId, loginId, ecryptPassword, name, nickname, email, file);
		User user = userBO.getUserById(userId);
		session.setAttribute("userProfileImage", user.getProfileImage());
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		return result;
		
		
	}
}
