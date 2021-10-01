package com.marondalgram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondalgram.user.model.User;

@Repository
public interface UserDAO {
	public boolean existLoginId(String loginId);
	public int insertUser(User user);
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId,
			@Param("password") String encryptPassword);
}
