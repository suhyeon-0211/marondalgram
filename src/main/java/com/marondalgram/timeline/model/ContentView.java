package com.marondalgram.timeline.model;

import java.util.List;

import com.marondalgram.comment.model.Comment;
import com.marondalgram.post.model.Post;
import com.marondalgram.postex.model.PostEx;

public class ContentView {
	// 글 1개
	private PostEx post;
	
	// 댓글 N개
	private List<Comment> commentList;
	
	// 내가 한 좋아요
	private boolean like;
	
	// 좋아요 총 개수
	private int likeCnt;

	public PostEx getPost() {
		return post;
	}

	public void setPost(PostEx post) {
		this.post = post;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public boolean isLike() {
		return like;
	}

	public void setLike(boolean like) {
		this.like = like;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
}
