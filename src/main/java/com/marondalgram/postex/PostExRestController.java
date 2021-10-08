package com.marondalgram.postex;

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
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.comment.bo.CommentBO;
import com.marondalgram.like.bo.LikeBO;
import com.marondalgram.postex.bo.PostExBO;

@RequestMapping("/post")
@RestController
public class PostExRestController {

	@Autowired
	private PostExBO postExBO;
	
	@PostMapping("/create")
	public Map<String, Object> postCreate(
			@RequestParam("content") String content
			, @RequestParam(value="file", required = false) MultipartFile file
			, HttpServletRequest request) {
		// session 에서 userId userNickname 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userNickname = (String) session.getAttribute("userNickname");
		String userLoginId = (String) session.getAttribute("userLoginId");
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		if (userId == null) {
			result.put("result", "notLogin");
		} else {
			// DB insert
			int row = postExBO.createPost(userLoginId, userId, userNickname, content, file);
			
			if (row > 0) {
				result.put("result", "success");
			}
		}
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> postDelete(
			@RequestParam("postId") int postId) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "fail");
		postExBO.deletePost(postId);
		
		result.put("result", "success");
		return result;
	}
}
