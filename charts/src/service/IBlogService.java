package service;

import java.util.List;

import entity.BlogCharts;


public interface IBlogService {

	public static final String SERVICE_NAME = "service.impl.BlogServiceImpl";
	
	List<BlogCharts> blogChartsList();
}
