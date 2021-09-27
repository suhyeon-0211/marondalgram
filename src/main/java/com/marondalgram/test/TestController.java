package com.marondalgram.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
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
}
