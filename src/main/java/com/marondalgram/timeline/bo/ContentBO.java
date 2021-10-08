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
	
	public List<ContentView> generateContentViewList(Integer userId) {
		List<ContentView> contentViewList = new ArrayList<>();
		List<PostEx> postExList = postExBO.getPostList();
		for (PostEx post : postExList) {
			ContentView contentView = new ContentView();
			// postEx 등록
			contentView.setPost(post);
			List<Comment> commentList = commentBO.getCommentsByPostId(post.getId());
			// 댓글 리스트 등록
			contentView.setCommentList(commentList);
			// 내가 한 좋아요 등록
			if (userId != null) {
				contentView.setLike(likeBO.existLikeByUserIdAndPostId(userId, post.getId()));
			}
			// 좋아요 갯수
			contentView.setLikeCnt(likeBO.getCntOfPostLike(post.getId()));
			contentViewList.add(contentView);
		}
		
		return contentViewList;
	}
}
