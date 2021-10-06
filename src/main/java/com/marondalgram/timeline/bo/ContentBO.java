package com.marondalgram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.comment.bo.CommentBO;
import com.marondalgram.comment.model.Comment;
import com.marondalgram.like.bo.LikeBO;
import com.marondalgram.postex.bo.PostExBO;
import com.marondalgram.postex.model.PostEx;
import com.marondalgram.timeline.model.ContentView;

@Service
public class ContentBO {

	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private PostExBO postExBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public List<ContentView> generateContentViewList() {
		List<ContentView> contentViewList = new ArrayList<>();
		List<PostEx> postExList = postExBO.getPostList();
		for (PostEx post : postExList) {
			ContentView contentView = new ContentView();
			// postEx 등록
			contentView.setPost(post);
			List<Comment> commentList = commentBO.getCommentsByPostId(post.getId());
			contentView.setCommentList(commentList);
			contentView.setLike(likeBO.existLike(post.getUserId(), post.getId()));
			contentView.setLikeCnt(likeBO.getCntOfPostLike(post.getId()));
			contentViewList.add(contentView);
		}
		
		return contentViewList;
	}
}
