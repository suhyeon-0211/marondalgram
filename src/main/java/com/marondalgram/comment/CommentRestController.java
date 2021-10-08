package com.marondalgram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondalgram.comment.bo.CommentBO;

@RequestMapping("/comment")
@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, Object> commentCreate(
			@RequestParam("content") String content,
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userNickname = (String) session.getAttribute("userNickname");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		if (userId == null) {
			result.put("result", "notLogin");
			return result;
		}
		commentBO.addCommentByPostId(postId, userId, userNickname, content);
		result.put("result", "success");
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> commentDelete(
			@RequestParam("postId") int postId,
			@RequestParam("userId") int commentUserId,
			@RequestParam("commentId") int commentId,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		if (userId != null) {
			if (userId == commentUserId) {
				commentBO.deleteCommentByPostIdAndUserId(postId, commentUserId, commentId);
				result.put("result", "success");
			}
		}
		return result;
	}
}
