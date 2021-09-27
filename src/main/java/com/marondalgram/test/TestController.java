package com.marondalgram.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marondalgram.test.bo.TestBO;

@Controller
public class TestController {
	
	@Autowired
	private TestBO testBO;
	
	@RequestMapping("/test1_1")
	@ResponseBody
	public String test1() {
		return "hello world!!! marondalgram";
	}
	
	@RequestMapping("/test1_2")
	@ResponseBody
	public Map<String, String> test2() {
		Map<String, String> map = new HashMap<>();
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("/test1_3")
	public String test3() {
		return "test/test";
	}
	
	@RequestMapping("/test1_4")
	@ResponseBody
	public List<Map<String, Object>> test4() {
		return testBO.getUserList();
	}
}
