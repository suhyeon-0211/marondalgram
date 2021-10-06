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
	
	public boolean existLike(int userId, int postId) {
		return likeDAO.existLike(userId, postId);
	}
}
