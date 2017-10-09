<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addAdmins.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

  </head>
  
  <body>
   <form class="form form-horizontal" id="form-admin-add"> 
   
	<article class="page-container">
<br>

	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>诊疗卡号：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="诊疗卡号"  name="cid" style="width:240px;">	
		</div>		
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>充值金额：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input id="price" type="number"  min="10" class="input-text" autocomplete="off"  placeholder="充值金额"  name="price" style="width:240px;">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary "  type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</article>
	</form>
		<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
		<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
		
		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
		<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
		<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
		<script type="text/javascript">
				
	$("#form-admin-add").validate({
	rules:{	
			cid:{	
				required:true,
				minlength:1,
				maxlength:8			
			},				
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
	
		submitHandler:function(form){
			
			$(form).ajaxSubmit({
				type: 'post',
				url: "addrecharge" ,
				success: function(data){
				var sums = document.getElementById("price").value; 
 					if(sums<10){
						layer.alert("最少充值10元");
					}
				
					if(data=="ok"){
										
						layer.msg('充值成功! ',{icon:1,time:1000});
						
						setTimeout(function () { 
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index); 
				 /*        parent.location.reload(); */
				    
				    }, 1000);
						
					}else{
						layer.msg("卡号错误",{icon:1,time:1000});
						
					}					
					
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('错误',{icon:1,time:1000});
				}
			});

		}
	});
		
function myselfinfo(title,url,w,h){
	layer_show(title,url,w,h);
}	
		
		
		
		</script>
  </body>
</html>
