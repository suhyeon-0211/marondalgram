package com.marondalgram.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	@RequestMapping("/list_view")
	public String timelineListView(Model model) {
		model.addAttribute("viewName", "timeline/list");
		return "template/layout_timeline";
	}
	
}
