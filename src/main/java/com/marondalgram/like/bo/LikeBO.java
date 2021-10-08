package com.marondalgram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int getCntOfPostLike(int postId) {
		return likeDAO.selectCntOfPostLike(postId);
	}
	
	public boolean existLikeByUserIdAndPostId(int userId, int postId) {
		return likeDAO.existLike(userId, postId);
	}
	
	public void deleteLike(int postId) {
		likeDAO.deleteLike(postId);
	}
	
	public void toggleLike(int postId, int userId) {
		if (existLikeByUserIdAndPostId(userId, postId)) {
			likeDAO.deleteLikeByPostIdAndUserId(postId, userId);
		} else {
			likeDAO.insertLikeByPostIdAndUserId(postId, userId);
		}
	}
}
