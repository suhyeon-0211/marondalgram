package com.marondalgram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	public int selectCntOfPostLike(int postId);
	public boolean existLike(
			@Param("userId") int userId,
			@Param("postId") int postId);
}
