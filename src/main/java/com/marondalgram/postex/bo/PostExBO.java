package com.marondalgram.postex.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.postex.dao.PostExDAO;
import com.marondalgram.postex.model.PostEx;

@Service
public class PostExBO {
	
	@Autowired
	private PostExDAO postExDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public List<PostEx> getPostList() {
		return postExDAO.selectPostList();
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
}
