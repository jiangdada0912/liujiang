<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xinx.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/h-ui.admin/css/style.css" />
  </head>
  
  <body>
   <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	门诊业务
	<span class="c-gray en">&gt;</span>
	就医诊断
	<span class="c-gray en">&gt;</span>
	诊疗方案
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
					<!-- 	action="addHi" -->
	<form class="form form-horizontal" id="form-article-add" >
	<input id="by2" type="hidden" value="${bs.by2 }">
		<div id="tab-system" class="HuiTab">
		<!-- 	<div class="tabBar cl">
				<span>基本设置</span>
			</div> -->
			<div class="tabCon">
			
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
							
						病人姓名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${cards.pname }
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						诊疗卡号：</label>
					<div class="formControls col-xs-8 col-sm-9">
					${cards.cid }
					
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						
						性别：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${cards.sex }
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						
						出生年月：</label>
					<div class="formControls col-xs-8 col-sm-9">
				 ${fn:substring(cards.idcard,6,10)}年 ${fn:substring(cards.idcard,10,12)}月 ${fn:substring(cards.idcard,12,14)}日
				
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>诊断结论：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<!-- <input type="text" class="input-text" value="" placeholder="" id="brief" name="brief"> -->
						<textarea class="textarea"  id="brief" name="brief" placeholder="不少于4个字符，不多于400个字符。"  style="width: 620px; height: 220px">${bs.by1}</textarea>
					</div>
				</div>

				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>诊疗方式：</label>
					<div class="formControls col-xs-8 col-sm-9 skin-minimal">
						<div class="radio-box">
							<input name="deal" type="radio" id="deal1" value="1" checked >
							<label for="deal1">回家观察</label>
						</div>
						<div class="radio-box">
							<input name="deal" type="radio" id="deal2" value="2" >
							<label for="deal2">开药治疗</label>
						</div>
						<div class="radio-box">
							<input name="deal" type="radio" id="deal3" value="3">
							<label for="deal3">办理住院</label>	 
							<input type="hidden" value="${cards.cid }" name="cid">
							<input type="hidden" value="${rid }" name="rid">
						</div>
						<span >
						<a id="btn1" onClick="javascript:addpres('药信息','drug?cid=${cards.cid }&rid=${rid }','800','500')" ><i class="Hui-iconfont">&#xe647;</i> 开药</a> &nbsp;
				<%-- 		<c:if test="${by2 > 100}"> --%>
						<a id="btn2" onClick="javascript:member_add('药方信息','finddrandpr','800','525')" ><i class="Hui-iconfont">&#xe695;</i> 查看药方</a>
			
						</span>
					</div>
				</div>
			</div>
			
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
		
		<button  class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe615;</i> 提交病历</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 	<a onclick="javascript:baochun(${rid });" class="btn btn-secondary radius" ><i class="Hui-iconfont">&#xe632;</i>保存</a> 
				<button onClick="layer_close();" class="btn btn-default radius" type="button"><i class="Hui-iconfont">&#xe6a6;</i>取消&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$("#tab-system").Huitab({
		index:0
	});
	//页面加载时，默认开药、药方按钮禁用
	var btn1 = document.getElementById('btn1'); 
	var btn2 = document.getElementById('btn2'); 
	btn1.setAttribute("class", "btn disabled radius"); 
	btn2.setAttribute("class", "btn disabled radius"); 
		
	//radio选择住院、开药时，修改按钮样式	
  	$(':radio').on('ifChecked', function(event){  
  		if($(this).val()==2||$(this).val()==3){
   			var btn1 = document.getElementById('btn1'); 
			var btn2 = document.getElementById('btn2'); 
			btn1.setAttribute("class", "btn btn-success radius"); 
			btn2.setAttribute("class", "btn btn-success radius"); 
   		}else{
   			var btn1 = document.getElementById('btn1'); 
			var btn2 = document.getElementById('btn2'); 
			btn1.setAttribute("class", "btn disabled radius"); 
			btn2.setAttribute("class", "btn disabled radius"); 
   		}  
	});  	
		
		
		
		
 	$("#form-article-add").validate({
		rules:{
		//诊断结果字符长度限制在4到100
			brief:{
				required:true,
				minlength:4,
				maxlength:200
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
				layer.confirm('是否确定提交？', function(){
						$(form).ajaxSubmit({
							type: 'post',
							url: "addHi",
							dataType:"json",
							success: function(data){
							if(data.map=="no"){
							layer.msg('还没有开药方!',{icon:2,time:1000});	
							}else if(data.map=='hos'){
								var index = parent.layer.getFrameIndex(window.name);
								layer.alert('病历已提交至住院部，请病人办理住院手续！', {
				    				skin: 'layui-layer-lan'
				    				,closeBtn: 0
				    				,anim: 4 //动画类型
				  				},function(){
				  					parent.location.reload();
				                    parent.layer.close(index);
				  				});
							}else{
								var index = parent.layer.getFrameIndex(window.name);
								layer.msg('病历添加成功!',{icon:1,time:1000});
								 setTimeout(function () { 
						           parent.location.reload();
				                     parent.layer.close(index);
		                       	}, 1000);				
							}
												
						},
		                error: function(XmlHttpRequest, textStatus, errorThrown){
							layer.msg('error!',{icon:1,time:1000});
						}
					});	
				})
											
		}
	});  
	
});
 
function addpres(title,url,w,h){

	layer_show(title,url,w,h);

}
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
	
function baochun(rid){
	var brief =document.getElementById("brief").value;	
  		$.ajax({
  			type: 'post',
			   url: "baochun",
				  data:{"rid":rid,"brief":brief},
				       success: function(data){		
				        	if(data=="true"){
						      layer.msg('保存成功!',{icon:1,time:1000});
						         var index = parent.layer.getFrameIndex(window.name);
						            setTimeout(function () { 
							           parent.location.reload();
					                     parent.layer.close(index);
					                       }, 700);
							
					}
				
				
				}
  			})
 
  	}
  		




</script>
   
  </body>
</html>
