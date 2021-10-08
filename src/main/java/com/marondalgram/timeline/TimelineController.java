package com.marondalgram.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondalgram.timeline.bo.ContentBO;
import com.marondalgram.timeline.model.ContentView;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	@Autowired
	private ContentBO contentBO;
	
	@RequestMapping("/list_view")
	public String timelineListView(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// DB에서 데이터 꺼내기
		List<ContentView> contentViewList = contentBO.generateContentViewList(userId);
		
		model.addAttribute("contentViewList", contentViewList);
		model.addAttribute("viewName", "timeline/list");
		return "template/layout_timeline";
	}
	
}
