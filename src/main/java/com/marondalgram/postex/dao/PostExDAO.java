package com.marondalgram.postex.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondalgram.postex.model.PostEx;

@Repository
public interface PostExDAO {
	public List<PostEx> selectPostList();
	public PostEx getPost(int postId);
	public int insertPost(
			@Param("userId") int userId, 
			@Param("userNickname") String userNickname,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	public void deletePost(int postId);
}
