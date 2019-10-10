<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript"
	src="<%=basePath%>statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="<%=basePath%>statics/js/highcharts.js"></script>
<script type="text/javascript">
<!-- 播放统计柱型折线图 -->
<script type="text/javascript">
     var chart;
     $(function(){
        $.ajax({
          type:"post",
          cache: false,
          async: false,
          url:"<%=basePath%>personSpace/showPlayer",
          success:function(data){
             var data=eval(data);
             if(data.hasData>0){
              showBroadColumData(data);
             }else{
              $("#playStatistic").attr("src","images/playStatistic.png")
              var left=($(window).width()-1000)/2+"px";
              $("#playStatistic").css("margin-left",left);
             }
          }
        });
     });
    
   function showBroadColumData(data){
     var xCategory=[];
     var yData=[];
     var demandData=[];
     var splineData=[];
     for(var i=0;i<data.playCountInfo.length;i++){
         xCategory.push(data.playCountInfo[i].yearMonth);
         yData.push(parseInt(data.playCountInfo[i].livePlayCount));
         demandData.push(parseInt(data.playCountInfo[i].vodPlayCount));
         splineData.push(parseInt(data.playCountInfo[i].count));
     }
     chart = new Highcharts.Chart({
        chart:{
           renderTo:'broadColum'
        },
        title:{             
            text:'播放统计',
            style:{
              color:'#000',
              fontSize:'18px',
              fontFamily:"微软雅黑"
            }
        }, 
        credits:{             
             enabled:false       
        }, 
        xAxis:[{
          categories:xCategory,
          lineWidth:2,//自定义x轴宽度 
          title: {
            text: '播放时间',
            style:{
              color:'black',
              fontSize:'14px',
              fontFamily:"宋体"
            }
          },
          style:{                     
              color:"#4572A7"                  
            }   
        }],
        yAxis:[{
          tickInterval:50,
          labels:{
            style:{                     
              color:"#4572A7"                  
            }      
          },
          title:{
            text: '播放次数',
            style:{
              color:'black',
              fontSize:'14px',
              fontFamily:"宋体"
            }
          }
        }],
        legend:{
          shadow:true,
          layout:"horizontal"
        },
        series:[{
          name:'直播',     
          type:"column",
          data:yData,
          color:Highcharts.getOptions().colors[3]
        },{
          name:'点播',     
          type:"column",
          data:demandData,
          color:Highcharts.getOptions().colors[7]
        },{
           name:'总播放次数',
           type:"spline",
           data:splineData,
           marker: {                                                     
                lineWidth: 2,                                               
                lineColor: Highcharts.getOptions().colors[4],               
                fillColor: 'white'                                          
            },
           color:Highcharts.getOptions().colors[5]      
        }]      
     });
   }
  </script>	
</script>
<title>统计博客数量</title>
</head>
<body style="margin: 1px">
	<div id="container" style="min-width: 800px;height: 400px"></div>
</body>
</html>