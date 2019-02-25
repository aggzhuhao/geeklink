<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>编辑传感器 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/jquery.tagsinput.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/register.css">
    <style type="text/css">
    #sensorForm span.error {
		margin-left: 10px;
		width: auto;
		display: inline;
		color: red;
	}
    </style>
</head>
<body>
<div class="page">
<!--header begin-->
	<header>
		<div class="bigcontainer">
			<div id="logo">
				<a href="./index">管理首页</a>
			</div> 
			<div class="user">
				<div class="ui compact notif menu">
					<a class="item" href="./tonotifications">
						<i class="mail large icon"></i>
						<c:if test="${messages>0 }">
						<span class="circular floating ui small red label">${messages }</span>
						</c:if>
					</a>
				</div>
				
				<div class="ui inline labeled icon top right pointing dropdown">
					<img class="ui avatar image" src="/geeklink${user.avatar }">
					欢迎，${user.name }
					<i class="dropdown icon"></i>
					<div class="menu">
						<a class="item" href="./index"><i class="reply mail icon"></i>返回首页</a>
						<a class="item" href="./removeUser"><i class="sign out icon"></i>注销</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- the main menu-->
	<div class="ui teal inverted menu">
		<div class="bigcontainer">
			<div class="right menu">
				<a class="item" href="./index"><i class="home icon"></i>管理首页</a>
				<a class="item" href="./todevicesList"><i class="sitemap icon"></i>设备</a>
				<a class="active item" href="./touserprofile"><i class="info icon"></i>账户</a>
			</div>
		</div>
	</div>
<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="ui grid">
			<!--the vertical menu-->
			<div class="four wide column">
				<div class="verticalMenu">
					<div class="ui vertical pointing menu fluid">
  						<a class="item" href="./toAdd">
							<i class="add icon"></i> 绑定新设备
  						</a>
  						<a class="active teal item" href="./queryAllDevice">
    						<i class="settings icon"></i> 我的设备
  						</a>
  						<a class="item" href="./queryAllDeviceAction">
							<i class="terminal icon"></i> 设备动作
  						</a>
					</div>
				</div>
			</div>
			<!--the newDevice form-->
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large edit icon"></i>
  							<div class="content">
    							编辑传感器
  							</div>
						</h3>
					</div>
				</div>
				<div class="ui form fluid vertical segment">
					<form id="sensorForm" name="form" action="updateSensor" method="post">
						<div class="two fields">
							<div class="field">
								<label>传感器名</label>
								<div class="ui small left labeled icon input">
									<input type="text" placeholder="给您的传感器起个容易记住的名字……" id="device_title" name="name" value="${sensor.name }"/>
									<i class="exchange icon"></i>
								</div>
							</div>
						</div>
                        <div class="field">
							<label>类型</label>
							<div class="ui dropdown selection">
      							<input id="type" name="type" type="hidden" name="gender" value="1">
      							<input id="sensorId" type="hidden" name="sensorId" value="${sensorId}">
      							<div class="default text">数值型</div>
      							<i class="dropdown icon"></i>
      							<div class="menu" name="sensor_type" id="sensor_type">
        							<div name="sensorType" class="item active" data-value="数值型" value="1">数值型</div>
        							<div name="sensorType" class="item"  value="2">开关型</div>
                                    <div name="sensorType" class="item"  value="3">GPS型</div>
                                    <div name="sensorType" class="item"  value="4">微博抓取型</div>
      							</div>
    						</div>
						</div>
                        <div class="two fields">
                            <div class="field">
                                <label>标签（tags）</label>
                                <input type="text" id="sensor_tags" name="tag" value="${sensor.tag }">
                            </div>
                        </div>

						<div class="two fields">
							<div class="field">
								<div class="field">
									<label>描述</label>
									<textarea name="description" placeholder="不超过30个字符……">${sensor.description }</textarea>
								</div>
							</div>
						</div>

						<div class="two fields">
							<div class="field">
								<label>传感器地址</label>
								<div class="writeUrl ui small left labeled icon input">
									<i class="url icon"></i>
									<input type="text" placeholder="如 http://api.geeklink.net/v1.0/device/5675/sensor/10385" id="device_address" name="address" value="${sensor.address }"/>
								</div>
							</div>
							<div class="field"></div>
						</div>

						<div class="two fields">
							<div class="field">
								<label>API地址</label>
								<div class="writeUrl ui small left labeled icon input">
									<i class="url icon"></i>
									<input type="text" placeholder="如http://api.geeklink.net/v1.0/device/5675/sensor/10385/" id="api_address" name="apiAddress" value="${sensor.apiAddress }"/>
								</div>
							</div>
							<div class="field"></div>
						</div>

						<input id="saveSensor" class="ui small blue submit button" type="button" value="保存">
						<input class="ui small basic button" type="reset" value="取消">
					</form>
					<!--the form end-->
				</div>
			</div>
		</div>
	</div>
</div>
<!--footer begin-->
<footer>
	<div id="copyrights">
		<div class="inset">
			<div class="bigcontainer">
				<div class="fl">
					<div class="logo"></div>
										<p>&copy; 2020 南通极客信息技术有限公司, 版权所有<br />
<a href="http://www.boode.com.cn" target="_blank">苏ICP备13024285号</a></p>
				</div>
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript" src="resource/javascript/jquery.min.js"></script>
<script type="text/javascript" src="resource/javascript/framework.js"></script>
<script type="text/javascript" src="resource/javascript/jquery.tagsinput.js"></script>
<!--validate-->
<script type="text/javascript" src="resource/javascript/jquery.validate.js"></script>
<script type="text/javascript" src="./resource/javascript/jquery.validate.extends.js"></script>

<script>
    $('.ui.dropdown')
		.dropdown();
    $('#sensor_tags').tagsInput();
    
    $(function(){
    	$("[name='sensorType']").click(function(){
    		var type = $(this).attr("value")
    		$("#type").attr("value",type)
    		console.log($("#type").attr("value"))
    	})
    	
    	
    	$("#saveSensor").click(function(){
    		
    		$("#sensorForm").submit();
    		
    	})
    	
    	$("#sensorForm").validate({
        	rules:{
        		name:{
        			required:true
        		},
        		tag:{
        			required:true,
        			maxlength:30
        		},
        		description:{
        			required:true
        		},
        		address:{
        			required:true,
        			//isaddress:true
        		},
        		apiAddress:{
        			required:true,
        			//isaddress:true
        		}
        	},
        	messages:{
        		name:{
        			required:"传感器名称不得为空"
        		},
        		tag:{
        			required:true,
        			maxlength:"标签总长度不得超过30个字符"
        		},
        		description:{
        			required:"描述不得为空"
        		},
        		address:{
        			required:"传感器地址不得为空",
        			//isaddress:"请输入正确的地址格式"
        		},
        		apiAddress:{
        			required:"api地址不得为空"
        		}
        	},errorPlacement:function (error, element) {
    			error.insertAfter(element);
            },
    		errorElement:"span"
        	
        })
    })
    
    
    
    
    
    
    
    
    
    
</script>
</body>
</html>
