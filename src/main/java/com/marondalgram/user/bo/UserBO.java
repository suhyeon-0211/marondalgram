package com.marondalgram.user.bo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.user.dao.UserDAO;
import com.marondalgram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public int addUser(User user, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			try {
				imagePath = fileManagerService.saveFile(user.getLoginId(), file);
				user.setProfileImage(imagePath);
			} catch (IOException e) {
				imagePath = null;
			} 
		}
		return userDAO.insertUser(user);
	}
	
	public User getUserByLoginIdAndPassword(String loginId, String encryptPassword) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, encryptPassword);
	}
}
