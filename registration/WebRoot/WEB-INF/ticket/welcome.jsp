<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui.admin/css/style.css" />
<style type="text/css">
	.threed{
		background: #EEE url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAIAAAAmkwkpAAAAHklEQVQImWNkYGBgYGD4//8/A5wF5SBYyAr+//8PAPOCFO0Q2zq7AAAAAElFTkSuQmCC) repeat;
text-shadow: 5px -5px black, 4px -4px white;
font-size:27px;
font-weight: bold;
-webkit-text-fill-color: transparent;
-webkit-background-clip: text
	}
</style>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>我的桌面</title>
</head>
<body>
<div class="page-container">
	<div class="text-c"> 
		<img src="<%=path %>/image/hosip.jpg" style="width:100%; height:180px">
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="threed"> 
		欢迎登录301医院门诊后台管理系统 
	</span> </div>
	
	<p></p>
	<table class="table table-border table-bordered table-bg table-hover ">
		<thead>
			<tr>
				<th colspan="7" scope="col" class="text-c">信息统计</th>
			</tr>
			<tr class="text-c">
				<th>门诊挂号人数统计</th>
			<c:forEach items="${times}" var="time">
				<th>${time}</th>
			</c:forEach>	
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map}" var="maps">
				<tr class="text-c">
					<td width="50px">${maps.key}</td>
			<c:forEach items="${maps.value }" var="count">
			<td width="30px">${count }</td>
			</c:forEach>
				</tr> 
				</c:forEach>
		</tbody>
	</table>
	
	<div id="container" style="min-width:700px;height:400px"></div>
</div>
<footer class="footer mt-20">
	<div class="container">
		<p>医院管理系统<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架"></a></p>
	</div>
</footer>
<script type="text/javascript" src="<%=path %>/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=path %>/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="<%=path %>/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=path %>/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=path %>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="<%=path %>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/highcharts.js"></script> 
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/highcharts.js"></script> 
<script type="text/javascript" src="https://img.hcharts.cn/highcharts/modules/drilldown.js"></script> 
<script type="text/javascript" src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script> 

<script type="text/javascript">


$(function () {
    // Create the chart
    picDept();
    
    $('.table-hover').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"bFilter": false,
		"pading":false,
		"bLengthChange": false,//是否显示每页大小的下拉框
		"aLengthMenu": [[5], [5]],
		"aoColumnDefs": [
		  {"orderable":false,"aTargets":[0]}// 不参与排序的列
		]
	});
});

function picDept(){

	$.ajax({
		url:'picDept',
		dataType: 'json',
		success: function(data){
			console.log(data.seriesList);
			console.log(data.dataList);
			var dataList = data.dataList;
			var seriesList = data.seriesList;
			Highcharts.chart('container', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: '本季度各科室病人挂号比例'
		        },
		        subtitle: {
		            text: '详细信息'
		        },
		        xAxis: {
		            type: 'category'
		        },
		        yAxis: {
		            title: {
		                text: '总挂号人数'
		            }
		        },
		        legend: {
		            enabled: false
		        },
		        plotOptions: {
		            series: {
		                borderWidth: 0,
		                dataLabels: {
		                    enabled: true,
		                    format: '{point.y:.f}人'
		                }
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.f}人</b> 挂号<br/>'
		        },
		        series: [{
		            name: '科室名称',
		            colorByPoint: true,
		            data:  dataList
		        }],
		        drilldown: {
		            series:  seriesList
		        }
		    });
		}
	});
	
}
</script>


<!--/此乃百度统计代码，请自行删除-->
</body>
</html>