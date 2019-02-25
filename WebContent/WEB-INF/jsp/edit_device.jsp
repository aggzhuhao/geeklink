<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑设备 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/jquery.tagsinput.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
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
				<!--<a class="item" href="./product_list.html"><i class="cloud icon"></i>产品</a>-->
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
    							编辑设备
    							<div class="sub header">将您的设备连接到云端</div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="ui form fluid vertical segment">
					<form id="form" name="form" action="updateDevice" method="post">
						<div class="two fields">
							<div class="field">
								<label>设备名</label>
								<div class="ui small left labeled icon input">
									<input type="text" placeholder="给您的设备起个名,您容易记住就行，30个字符内……" id="name" name="name" value="${device.name}"/>
									<i class="sitemap icon"></i>
								</div>
							</div>
                            <div class="field"></div>
						</div>
                        <div class="two fields">
                            <div class="field">
                                <label>描述</label>
                                <textarea name="description" placeholder="不超过30个字符……" >${device.description}</textarea>
                            </div>
                            <div class="field">
                                <div class="diy field">
                                    <label>标签（tags）</label>
                                        <input type="text" id="device_tags" name="tags" value="${device.tags }">
                                </div>
                            </div>
                        </div>
						<div class="diy field">
							<label>地理位置名称</label>
							<div class="ui dropdown selection">
								<c:if test="${device.location=='上海' }"><input type="hidden" name="location" value="上海"></c:if>
								 <c:if test="${device.location=='南通' }"><input type="hidden" name="location" value="南通""></c:if>
								
								<i class="dropdown icon"></i>
								<div class="menu">
									<div name="city" class="item active" data-value="南通">南通</div>
									<div name="city" class="item" data-value="上海">上海</div>
								</div>
    						</div>
						</div>
						<div class="diy field" id="location">
							<div class="ui two column grid">
								<div class="column">
									<label>地理位置数据<small>&nbsp;&nbsp;（双击地图选择您设备的位置）</small></label>
								</div>
								<div class="column">
									<div class="two fields">
										<div class="field" style="margin-bottom:0;">
											<input type="text" id="device_lng" name="longitude" readonly="readonly" value="${device.longitude}">
										</div>
										<div class="field" style="margin-bottom:0;">
											<input type="text" id="device_lat" name="latitude" readonly="readonly" value="${device.latitude}"> 
										</div>
									</div>
								</div>
							</div>
							<!--make a div for google map-->
							<div id="locmap" class="locmap">地图加载中...</div>
						</div>
						<div class="field">
							<label>放置场地</label>
							<div class="ui dropdown selection">
								<c:if test="${device.placement=='室内' }">
								<input type="hidden" name="placement" value="室内">
								</c:if>
								<c:if test="${device.placement=='室外' }"><input type="hidden" name="placement" value="室外"></c:if>
								<div class="default text"></div>
								<i class="dropdown icon"></i>
								<div class="menu">
									<div name="where" class="item active" data-value="室内">室内</div>
									
									<div name="where" class="item" data-value="室外">室外</div>
								</div>
    						</div>
						</div>
						<div class="two fields">
							<div class="field">
								<label>设备地址</label>
								<div class="writeUrl ui small left labeled icon input">
									<i class="url icon"></i>
									<input type="text" placeholder="如http://www.geeklink.net/devices/5905" id="device_address" name="address" value="${device.address}"/>
								</div>
							</div>
							<div class="field"></div>
						</div>

						<div class="two fields">
							<div class="field">
								<label>API地址</label>
								<div class="writeUrl ui small left labeled icon input">
									<i class="url icon"></i>
									<input type="text" placeholder="如http://www.geeklink.net/devices/5905" id="api_address" name="apiAddress" value="${device.apiAddress}">
								</div>
							</div>
							<div class="field"></div>
						</div>


						<div class="field">
							<input type="radio" id="publicstatus" name="availability" value="1" checked="checked"><span style="font-size:14px">公开</span>
							<input type="radio" id="privtatestatus" name="availability" value="0"><span style="font-size:14px">不公开</span>
						</div>

                    <input class="ui small blue submit button" type="submit" value="保存">
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
<script type="text/javascript" src="resource/javascript/user_new_devices.js"></script>
<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyC7a2MMoG2nkxwY6bmxjoULoiz2YTp43iI&sensor=false&language=cn"></script>
<script type="text/javascript" src="resource/javascript/jquery.tagsinput.js"></script>
<script>
    $('#device_tags').tagsInput();
    
    $(function(){
    	$(function(){
    		$("[name='where']").click(function(){
    			var placement = $(this).attr("data-value");
    			console.log(placement);
    			$("[name='placement']").val = placement;
    		})
    		$("[name='city']").click(function(){
    			var placement = $(this).attr("data-value");
    			console.log(placement)
    			$("[name='location']").val = placement;
    		})
    	})
    })
</script>
</body>
</html>
