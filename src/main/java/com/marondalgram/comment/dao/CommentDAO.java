package com.marondalgram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondalgram.comment.model.Comment;

@Repository
public interface CommentDAO {
	public List<Comment> selectCommentsByPostId(int postId);
	public void insertCommentByPostId(
			@Param("postId") int postId, 
			@Param("userId") int userId,
			@Param("userNickname") String userNickname,
			@Param("content") String content);
	public void deleteCommentByPostId(int postId);
	public void deleteCommentByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("id") int id);
}
