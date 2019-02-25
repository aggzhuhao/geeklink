<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="renderer" content="webkit">
    <title>设备动作 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/jquery-ui.css"/>
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
  						<a class="item" href="./todevicesList">
    						<i class="settings icon"></i> 我的设备
  						</a>
  						<a class="active teal item" href="./queryAllDeviceAction">
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
  							<i class="large terminal icon"></i>
  							<div class="content">
    							设备动作
    							<div class="sub header">自定义您的设备动作</div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="ui vertical segment">
					<a class="ui red small labeled icon add button" href="./tonewAction"><i class="add icon"></i>增加新动作</a>
                    <div class="ui small icon input right">
                          <input id="name" type="text" placeholder="输入动作名搜索……">
                          <i id="searchIcon" class="search icon"></i>
                    </div>
				</div>
				<div class="ui form fluid vertical segment">
					<form name="form" action="/user/actions" method="post">
							<table class="ui basic table">
  								<thead>
    								<tr>
    								<th>动作名</th>
    								<th>类型</th>
    								<th>是否使用</th>
    								<th>操作</th>
  									</tr>
								</thead>
  								<tbody>

  								<c:forEach items="${deviceActionList }" var="deviceAction">
  								<c:if test="${deviceAction.status==0 }"><tr></c:if>
								<c:if test="${deviceAction.status==1 }"><tr class="positive"></c:if>
      									<td>${deviceAction.name }</td>
      									<c:choose>
      										<c:when test="${deviceAction.type==1 }"><td>电子邮件</td></c:when>
      										<c:when test="${deviceAction.type==2 }"><td>网址推送</td></c:when>
      										<c:when test="${deviceAction.type==3 }"><td>微博发布</td></c:when>
      										<c:when test="${deviceAction.type==4 }"><td>移动推送</td></c:when>
      									</c:choose>
      									<td>
      									<c:if test="${deviceAction.status==0 }"><i class="icon close"></i></c:if>
										<c:if test="${deviceAction.status==1 }"><i class="icon checkmark"></i></c:if>
										</td>
										<td><a class="ui tiny blue edit button" href="./editAction/${deviceAction.actionId }"><i class="edit icon"></i>编辑</a> <a id="${deviceAction.actionId }" name="deleteDeviceAction" class="ui tiny basic button"><i class="trash icon"></i>删除</a></td>
    								</tr>
    							</c:forEach>
								
  								</tbody>
							</table>
					</form>
					<!--the form end-->
				</div>
			</div>
		</div>
	</div>
</div>
<div id="deletedevice" style="display: none" title="确认对话框">是否确认删除动作</div>
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
<script type="text/javascript" src="resource/javascript/jquery.pagination.js"></script>
<script type="text/javascript" src="resource/javascript/jquery-ui.min.js"></script>
<script>
	$('.ui.dropdown')
		.dropdown();
	$(function(){
		
		 $("[name='deleteDeviceAction']").click(function(){
			deleteDeviceAction = $(this).attr("id")
			$("#deletedevice").dialog({
				autoOpen:true,
				modal:true,
				buttons:{
					"删除":function(){
						$.ajax({
							url:"deleteDeviceAction",
							data:{deleteDeviceAction:deleteDeviceAction},
							success:function(data){
								if(data=="true"){
									alert("删除成功");
									location.href="./queryAllDeviceAction";
								}else{
									alert("删除失败");
								}
							},
							error:function(){
								alert("删除失败");
							}
							
						})
						
						
						$(this).dialog("close");
					},
					"取消":function(){
						alert("取消删除");
						$(this).dialog("close");
					}
				}	
			})
									
							
		}) 
		
	})
	
	$(function(){
		$("#searchIcon").click(function(){
			var name = $("#name").val();
			console.log(name)
			$.ajax({
				url:"likeQueryDeviceAction",
				data:{name:name},
				type:"post",
				dataType:"json",
				success:function(data){
					$("td").remove();
					console.log(data)
					$.each(data.deviceActionList,function(index,deviceAction){
						var statusint = deviceAction.status;
						var typeint = deviceAction.type;
						var status;
						var type;
						var icon;
						if(statusint==0){
							status = "<tr>";
							icon = "<td><i class='icon close'></i></td>"
						}else{
							status = "<tr class='positive'>";
							icon = "<td><i class='icon checkmark'></i></td>";
						}
						if(typeint==1){
							type = "<td>电子邮件</td>";
						}else if(typeint==2){
							type="<td>网址推送</td>;"
						}else if(typeint == 3){
							type = "<td>微博推送</td>";
						}else{
							type = "<td>移动端服务</td>";
						}
						$("table").append(
							status+"<td>"+deviceAction.name+"</td>"+type+icon+
					"<td><a class='ui tiny blue edit button' href='./editAction/"+deviceAction.actionId+"'><i class='edit icon'></i>编辑</a> <a id='"+deviceAction.actionId+"' name='deleteDeviceAction' class='ui tiny basic button'><i class='trash icon'></i>删除</a></td></tr>"
						
    						)
						
					})
				},
				complete:function(){
					$("[name='deleteDeviceAction']").click(function(){
						deleteDeviceAction = $(this).attr("id")
						$("#deletedevice").dialog({
							autoOpen:true,
							modal:true,
							buttons:{
								"删除":function(){
									$.ajax({
										url:"deleteDeviceAction",
										data:{deleteDeviceAction:deleteDeviceAction},
										success:function(data){
											if(data=="true"){
												alert("删除成功");
												location.href="./queryAllDeviceAction";
											}else{
												alert("删除失败");
											}
										},
										error:function(){
											alert("删除失败");
										}
										
									})
									
									
									$(this).dialog("close");
								},
								"取消":function(){
									alert("取消删除");
									$(this).dialog("close");
								}
							}	
						})
												
										
					})
				}
			})
		})
	})
</script>
</body>
</html>