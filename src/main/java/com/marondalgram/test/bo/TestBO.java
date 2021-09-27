package com.marondalgram.test.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.test.dao.TestDAO;

@Service
public class TestBO {
	
	@Autowired
	private TestDAO testDAO;
	
	public List<Map<String, Object>> getUserList() {
		return testDAO.selectUserList();
	}
}