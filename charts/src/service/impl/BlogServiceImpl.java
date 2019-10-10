package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.BlogMapper;

import entity.BlogCharts;

import service.IBlogService;

@Service
public class BlogServiceImpl implements IBlogService {
	
	@Resource
	private BlogMapper blogMapper;

	public List<BlogCharts> blogChartsList() {
		// TODO Auto-generated method stub
		return blogMapper.blogChartsList();
	}

}
