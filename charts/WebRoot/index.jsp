<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath%>statics/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="<%=basePath%>statics/js/highcharts.js"></script>
  <script type="text/javascript">

$(function () {
	
	var chart=new Highcharts.Chart({
		chart: {
			renderTo:'container',
            type: 'column',
            events:{
            	load:function(event){
            		// ajax请求后台加载数据
            		$.post("${pageContext.request.contextPath}/blog/chart.action",{},function(result){
            			var xArr=new Array();
            			var yArr=new Array();
            			for(var i=0;i<result.length;i++){
            				xArr.push(result[i].typeName);
            				yArr.push(result[i].blogCount);
            				chart.xAxis[0].categories=xArr;
            				chart.series[0].setData(yArr);
            			}
            		},"json");
            	}
            }
        },
        title: {
            text: '博客数量'
        },
        xAxis: {
        	title:'博客等级',
            categories: [
                'A',
                'B',
                'C'
            ]
        },
        yAxis: {
            title: {
                text: '博客数量'
            }
        },
        series: [{
            name: '博客',
            data: [1,2,3]
        }]
	});
});
 
</script>
<title>统计博客数量</title>
</head>
<body style="margin: 1px">
 <div id="container" style="min-width: 800px;height: 400px"></div>
</body>
</html>