package com.marondalgram.user.bo;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondalgram.common.FileManagerService;
import com.marondalgram.user.dao.UserDAO;
import com.marondalgram.user.model.User;

@Service
public class UserBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	public User getUserById(int userId) {
		return userDAO.getUserById(userId);
	}

	public void updateUserByUserId(int userId, String loginId, String ecryptPassword, String name, String nickname,
			String email, MultipartFile file) {
		// 사진 업데이트
		String imagePath = updateProfileImage(userId, loginId, file);
		
		userDAO.updateUserByUserId(userId, loginId, ecryptPassword, name, nickname, email, imagePath);
	}
	
	public String updateProfileImage(int userId, String loginId, MultipartFile file) {
		String imagePath = getUserById(userId).getProfileImage();
		if (file != null) {
			if (imagePath != null) {
				try {
					fileManagerService.deleteFile(imagePath);
				} catch (IOException e) {
					logger.error("[기존 프로필 사진 삭제] imagePath:" + imagePath);
				}
			}
			try {
				imagePath = fileManagerService.saveFile(loginId, file);
			} catch (IOException e) {
				logger.error("[프로필 사진 추가] loginId: {}" , loginId);
			}
		}
		return imagePath;
	}
}
