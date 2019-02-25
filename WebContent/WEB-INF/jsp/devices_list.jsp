<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="renderer" content="webkit">
    <title>我的设备 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/pagination.css"/>
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
				<a class="item" href="./queryAllDevice"><i class="sitemap icon"></i>设备</a>

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
			<!--the Devicelist-->
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large settings icon"></i>
  							<div class="content">
    							我的设备
    							<div class="sub header">所有设备都在这里</div>
  							</div>
						</h3>
					</div>
				</div>
                <div class="ui vertical segment">
					<a class="ui red small labeled icon add button" href="./toAdd"><i class="add icon"></i>绑定新设备</a>
                    <div class="ui small icon input right">
                      <input id="searchDevice" type="text" placeholder="输入设备名搜索……">
                      <i id="searchIcon" class="search icon"></i>
                    </div>
				</div>
                <!--the device content-->
                <div id="devicesDiv">
			 
				</div>
                <!--another device content-->
                <ul></ul>
            	<!--Pagination-->
                	<div style="float: right">
                    <div id="pagination">
                      
                    </div>
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
<script type="text/javascript" src="resource/javascript/jquery.pagination.js"></script>
<script type="text/javascript" src="resource/javascript/jquery-ui.min.js"></script>
<script>
    $(document).ready(function(){
		$('.ui.dropdown')
			.dropdown()
        ;

        $('.ok.label')
        .popup({
            content:'这个传感器正常工作。'
        })
        ;

        $('.error.label')
        .popup({
            content:'哎呀，这个传感器异常。'
        })
        ;
	});
</script>
<div id="deletedevice" style="display: none" title="确认对话框">是否确认删除设备<br>
删除则该设备下的传感器一起删除</div>
<script type="text/javascript">
	
	var total_size;	
	var page_size=3;
	var page_index=0;
	var currentpage;
	var address = "getdevicesList";
	var i = 1;
	
	$(function(){
		
		$("#searchIcon").click(function(){
			//getLikeQuerydevice()
			var devicedconditions = $("#searchDevice").val();
			console.log(devicedconditions);
			$.ajax({
				url:"searchDevice",
				data:{
					devicedconditions:devicedconditions,
					pageSize:page_size
				},
				type:"POST",
				dataType:"json",
				success:function(data){
				
					var totalsize = data.deviceList.length
					console.log(totalsize)
					
					$("#pagination").pagination(totalsize, {
						prev_text:"<",
						next_text:">",
						num_display_entries:5,	// 连续分页主体显示的分页条目数
						num_edge_entries:1,		//两端显示的首尾分页的条目数
						items_per_page:page_size,		// 每页的记录数
						current_page:page_index,
						link_to:"javascript:void(0)",
						callback:getLikeQuerydevice
					})
					getLikeQuerydevice(page_index);
					
				},	
				error:function(){
					alert("出错了2");
				},complete:function(){
					$("[name='deletedevice'").click(function(){
						console.log($(this).attr('id'))
						var deviceId =  $(this).attr('id')
						$("#deletedevice").dialog({
							autoOpen:true,
							modal:true,
							buttons:{
								"删除":function(){
									$.ajax({
										url:"deleteDevice",
										data:{deviceId1:deviceId},
										success:function(data){
											if(data=="true"){
												alert("删除成功");
												location.href="./queryAllDevice";
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
		
		
		function getLikeQuerydevice(page_index){
			$.ajax({
				url:"getQuerydevicesList",
				type:"POST",
				dataType:"json",
				async:false,
				data:{
					currentpage:page_index,
					pagesize:page_size
				},
				success: function(data){
					$("h1").remove();
					$("#devicesDiv").empty();
					console.log(data)
					$.each(data.list, function(index, device){
						if(device.availability==1){
							var availability = "pub";
						}else{
							var availability = "pvt";
						}
					
						var labelmsg = "";
							//console.log("device.sensorList::::::"+device.sensorList.length)
						for(var i = 0;i <device.sensorList.length;i++){
							if(device.sensorList[i].status == 1){
								labelmsg = labelmsg+ " <span name='greenlabel' class='ui green ok label'  data-variation='inverted'></span>"
							}else{
								labelmsg = labelmsg+" <span name='errorlabel' class='ui red error label'  data-variation='inverted'></span>"
							}
						}
						
							
						 
						$("#devicesDiv").append(
					
								"<div class= 'ui device two column middle aligned vertical grid segment'>"+
			                    "<div class='column verborder'>"+
										"<div class='ui info segment'>"+
			                                "<h5 class='ui header'>"+device.name+ 		                              
			                                "<span class='ui type label'> "+availability+" </span></h5>"+
											"<p>设备ID： <span class='stress'>"+device.deviceId+"</span></p>"+
			                                "<p>设备地址："+device.address+"</p>"+
			                            "<p>API 地址："+device.apiAddress+"</p>"+
			                                "<p class='sensorStatus'>传感器状态："+
			                                labelmsg+"</p></div></div>"+
			  					"<div class='center aligned column'><div class='ui buttons'>"+
			    					
									
			  							"<a class='ui tiny blue button' href='./device/"+device.deviceId+"'><i class='setting icon'></i>管 理</a>"+
			                            "<a id="+device.deviceId+" name='deletedevice' class='ui tiny basic button'><i class='trash icon'></i>删 除</a></div></div></div>" 
			
						)
						console.log(device.deviceId)
					});	
					
				},	
				error:function(){
					alert("出错了2");
				},complete:function(){
					//$("[name='greenlabel']").addClass("ui green ok label");
					
					$("[name='deletedevice']").click(function(){
						console.log($(this).attr('id'))
						var deviceId =  $(this).attr('id')
						$("#deletedevice").dialog({
							autoOpen:true,
							modal:true,
							buttons:{
								"删除":function(){
									$.ajax({
										url:"deleteDevice",
										data:{deviceId1:deviceId},
										success:function(data){
											if(data=="true"){
												alert("删除成功");
												location.href="./queryAllDevice";
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
		}
		
		
		
		getpagination(page_index,page_size,address)
		//获得总数
	function getpagination(page_index,page_size,address){
		$.ajax({		
			url:address,
			data:{
				currentpage:page_index,
				pagesize:page_size
			},
			type:"POST",
			dataType:"json",
			async:false,	// 同步
			success: function(data){
				total_size = data.totalSize;
				page_size = data.pageSize;
				$("#pagination").pagination(total_size, {
					prev_text:"<",
					next_text:">",
					num_display_entries:5,	// 连续分页主体显示的分页条目数
					num_edge_entries:1,		//两端显示的首尾分页的条目数
					items_per_page:page_size,		// 每页的记录数
					current_page:page_index,
					link_to:"javascript:void(0)",
					callback:pageSelectCallbackasd
				});
				
							
			},	// success
			error:function(){
				alert("出错了");
			}	// error

		})
		}
		pageSelectCallbackasd();
		function pageSelectCallbackasd(page_index, jq){
			$.ajax({
				url:"getdevicesList",
				type:"POST",
				dataType:"json",
				async:false,
				data:{
					currentpage:page_index,
					pagesize:page_size
				},
				success: function(data){
					$("#devicesDiv").empty();
					$.each(data.list, function(index, device){
						if(device.availability==1){
							var availability = "pub";
						}else{
							var availability = "pvt";
						}
					
						var labelmsg = "";
							console.log("device.sensorList::::::"+device.sensorList.length)
						for(var i = 0;i <device.sensorList.length;i++){
							if(device.sensorList[i].status == 1){
								labelmsg = labelmsg+ " <span name='greenlabel' class='ui green ok label'  data-variation='inverted'></span>"
							}else{
								labelmsg = labelmsg+" <span name='errorlabel' class='ui red error label'  data-variation='inverted'></span>"
							}
						}
						
							
						 
						$("#devicesDiv").append(
					
								"<div class= 'ui device two column middle aligned vertical grid segment'>"+
			                    "<div class='column verborder'>"+
										"<div class='ui info segment'>"+
			                                "<h5 class='ui header'>"+device.name+ 		                              
			                                "<span class='ui type label'> "+availability+" </span></h5>"+
											"<p>设备ID： <span class='stress'>"+device.deviceId+"</span></p>"+
			                                "<p>设备地址："+device.address+"</p>"+
			                            "<p>API 地址："+device.apiAddress+"</p>"+
			                                "<p class='sensorStatus'>传感器状态："+
			                                labelmsg+"</p></div></div>"+
			  					"<div class='center aligned column'><div class='ui buttons'>"+
			    					
									
			  							"<a class='ui tiny blue button' href='./device/"+device.deviceId+"'><i class='setting icon'></i>管 理</a>"+
			                            "<a id="+device.deviceId+" name='deletedevice' class='ui tiny basic button'><i class='trash icon'></i>删 除</a></div></div></div>" 
			
						)
					});	
					
				},	
				error:function(){
					alert("出错了2");
				},complete:function(){
					//$("[name='greenlabel']").addClass("ui green ok label");
					
					$("[name='deletedevice']").click(function(){
						console.log($(this).attr('id'))
						var deviceId =  $(this).attr('id')
						$("#deletedevice").dialog({
							autoOpen:true,
							modal:true,
							buttons:{
								"删除":function(){
									$.ajax({
										url:"deleteDevice",
										data:{deviceId1:deviceId},
										success:function(data){
											if(data=="true"){
												alert("删除成功");
												location.href="./queryAllDevice";
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
		}
		
		
		


	});	// $()
  </script>

</body>
</html>
