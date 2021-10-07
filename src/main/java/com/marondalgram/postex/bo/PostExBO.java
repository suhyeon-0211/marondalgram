package com.marondalgram.postex.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.postex.dao.PostExDAO;
import com.marondalgram.postex.model.PostEx;

@Service
public class PostExBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostExDAO postExDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public List<PostEx> getPostList() {
		return postExDAO.selectPostList();
	}
	
	public PostEx getPost(int postId) {
		return postExDAO.getPost(postId);
	}
	
	public int createPost(String userLoginId, int userId, String userNickname, String content, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			try {
				imagePath = fileManagerService.saveFile(userLoginId, file);
			} catch (IOException e) {
				imagePath = null;
			}
		}
		return postExDAO.insertPost(userId, userNickname, content, imagePath);
	}
	
	public void deletePost(int postId) {
		PostEx post = getPost(postId);
		String imagePath = post.getImagePath();
		if (imagePath != null) {
			try {
				fileManagerService.deleteFile(imagePath);
			} catch (IOException e) {
				logger.error("[delete post] 파일 삭제 시리패 postId: {}, path:{}", postId, post.getImagePath());
			}
		}
		postExDAO.deletePost(postId);
	}
}
