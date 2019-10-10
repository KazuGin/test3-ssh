package web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IBlogService;

import com.alibaba.fastjson.JSON;

import entity.BlogCharts;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@Resource
	private IBlogService blogService;
	
	@RequestMapping(value="/chart.action",method=RequestMethod.POST)
	@ResponseBody
	public String charts(){
		List<BlogCharts> list = blogService.blogChartsList();
		System.out.println(JSON.toJSONString(list));
		return JSON.toJSONString(list);
	}
	
	@RequestMapping(value="/chart2.action",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> charts2(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<BlogCharts> list = blogService.blogChartsList();
		if(list!=null){
			map.put("blogList", list);
			map.put("hasData", 1);
		}else{
			map.put("hasData", 0);
		}
		return map;
	}
	
}
