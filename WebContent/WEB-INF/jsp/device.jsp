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
    <title>设备管理 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/switch.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/pagination.css"/>
  
    <link type="text/css" rel="stylesheet" href="resource/css/myAlert.css"/>
        
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

			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large setting icon"></i>
  							<div class="content">
    							设备管理
    							<div class="sub header">管理这个设备及其传感器</div>
  							</div>
						</h3>
					</div>
				</div>
                <!--the device info-->
				<div class="ui device middle aligned vertical grid segment">
                    <div class="four wide column verborder">
                        <div class="ui info segment">
                            <img src="resource/images/avatar-default.gif" style="height:160px;">
                        </div>
                    </div>
                    <div class="seven wide column">
				        <div class="ui info segment">
                            <h5 class="ui header">${device.name } 
                            <c:if test="${device.availability==1 }">
                            <span class="ui type label">pub</span>
                            </c:if>
                            <c:if test="${device.availability!=1 }">
                            <span class="ui type label">pvt</span>
                            </c:if>
                                    <div class="sub header">
                                        这里是设备描述！
                                    </div>
                            </h5>
				            <p>设备ID： <span id="deviceId" class="stress">${device.deviceId }</span></p>
                            <p>设备地址： http://www.yeelink.net/devices/5905</p>
                            <p>API 地址： http://api.geeklink.net/devices/5905</p>
				        </div>
                    </div>
  					<div class="five wide center aligned column">

                            <a class="ui small blue button" href="./updateeditDevice/${device.deviceId }"><i class="edit icon"></i>编 辑</a>
  					</div>
				</div>
                <div class="ui vertical segment">
                    <a class="ui mini red labeled icon button" href="./tonewSensor/${device.deviceId }"><i class="add icon"></i>添加传感器</a>
                    <div class="ui mini icon input right">
                      <input id="likeSensor" type="text" placeholder="输入传感器名搜索……">
                      <i id="likeButton" class="search icon"></i>
                   	</div>
                </div>
                <!--the sensor info-->
                <div id="sensorDiv">
                <%-- <c:forEach items="${device.sensorList }" var="sensor">
                
				</c:forEach> --%>
                </div>

                <!--分页栏-->
               <div style="float: right">
                    <div id="pagination">
                      
                    </div>
                    </div>
                   
                    
               </div>
            </div>
        </div>
    </div>
</div>

<!--addNewDIYAction model-->

	<div class="ui small test addNewDIYAction modal" id="editActionTriggerDialog">
		<i class="close icon"></i>
		<div class="header"></div>
		<div class="content">
                <div class="ui form vertical segment">
				    <form id="diyActionForm" name="form" method="post">
                        <div class="inline field">
                        	<label>当数据满足:</label>
                            <div class="ui dropdown selection">
                                <input type="hidden" name="triggerOption" id="triggerOption" value="1">
                                <div class="default text"> 大于 </div>
                                <i class="dropdown icon"></i>
                                <div class="menu">
                                	
                                    <div name="tiggerO1" class="item" data-value=">"> 大于 </div>
                                    <div name="tiggerO1" class="item" data-value=">="> 大于或等于 </div>
                                    <div name="tiggerO1" class="item" data-value="<"> 小于 </div>
                                    <div name="tiggerO1" class="item" data-value="<="> 小于或等于 </div>
                                    <div name="tiggerO1" class="item" data-value="="> 等于 </div>
                                </div>
                            </div>
                            <input type="text" id="triggerValue" name="triggerValue">
                        </div>
                        <div class="inline field">
                        	<label>指定动作：</label>
                            <div class="ui dropdown selection">
                                <input type="hidden" id="actionId" name="actionId" value="${deviceActionList[0].actionId }">
                                <div class="default text"> 高温警报 </div>
                                <i class="dropdown icon"></i>
                                <div id="mangActionId" class="menu">
                                <c:forEach items="${deviceActionList }" var="deviceAction">
                                    <div name="actionId1" class="item" data-value="${deviceAction.actionId }" >${deviceAction.name }</div>
                                  
                               	</c:forEach>
                                </div>
                            </div>
                            <div class="ui pointing left label">
                             	可在 设备动作 中添加新动作.
                            </div>
                        </div>
                        <div class="inline field">
                        	<label>消息内容:</label>
                            <textarea id="message" value="" placeholder="不超过120个字……"></textarea>
                        </div>

                        <span id="msg" style="display:none">保存失败</span>
				    </form>
                </div>
		</div>


        <div class="actions">
            <div id="cancelBtn" class="ui small negative black button">
                取消
            </div>
            <button id="okBtn" class="ui small positive right labeled icon button">
                确定
                <i class="checkmark icon"></i>
            </button>
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
<script type="text/javascript" src="resource/javascript/myAlert.js"></script>
<script>
    $(document).ready(function(){
		$('.ui.dropdown')
			.dropdown()
        ;

        $('.show a').click(function(){
            $('.show.chart').toggleClass('active');
            $('.chartShow').toggleClass('active');
        });


        $('.test.addNewDIYAction.modal')
		.modal('attach events','.addaction.button','show');

        $('.ui.accordion').accordion({
            onOpen:function(){
                alert("点击触发动作，加载动作列表....");
            }
        });

        $('#editActionTriggerDialog')
            .modal({
                // 点击确定按钮 positve
                onApprove:function () {
                    if (1 == 1){
                        // 做保存...
                        alert("保存成功...");
                        return true;    // 隐藏对话框
                    } else {
                        alert("错误，不能成功保存....");
                        return false;   // 对话框不隐藏
                    }

                },
                // 取消按钮 negative
                onDeny:function () {
                    alert("取消....");
                    return true;    // 隐藏对话框; return false: 不隐藏对话框
                }

            })
        //  .modal("show"); // 页面加载时就打开对话框

	});
</script>
<div id="deleteSensor"></div>
<script>
	var b = 0;
	$("[name='actionId1']").click(function(){
		$("#actionId").val($(this).attr("data-value"))
		
	})
	function deleteSensorActionById(sensorActionId,sensorId){
		//alert(sensorId)
		$.myConfirm({
            title:"确认提示框",
            message:"是否删除",
            callback:function(){

        		$.ajax({
        			url:"deleteSensorActionById",
        			data:{
        				sensorActionId:sensorActionId,
        			},
        			type:"post",
        			async:false,
        			success:function(data){
        				console.log(data)
        				if(data.result == true){
        					alert("删除成功")
        					$.ajax({
 	  	                	url:"queryAllSensorAction",
 	  	                	data:{sensorId:sensorId},
 	  	                	type:"post",
 	  	                	dataType:"json",
 	  	                	async:false,
 	  	                	success:function(data){
 	  	                	$("[name="+sensorId+"] table").empty();
 	  	                	
 	  	                	//console.log(data.sensorActionList.length)
 	  		                	if(data.sensorActionList.length == 0){
 	  		                		$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
 	  					                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+sensorId+")'><i class='add icon'></i>添加触发</div>"+
 	  					                       "</div></div></div>")
 	  		                		
 	  		                	}else{
 	  		                		$.each(data.sensorActionList, function(index, sensorAction){
 	  		                			
 	  		                			//console.log(sensorAction)
 	  		                			
 	  									var td = $("<tr></tr>");

 	  									td.html("<td>当值"+sensorAction.triggerOption+sensorAction.triggerValue+"时，执行动作"+sensorAction.actionId+"</td>"+
 	  											"<td><a href='javascript:void(0)' onclick='openActionTrigger("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='edit icon'></i>编辑</a></td>"+
 	  											"<td><a id='"+sensorAction.sensorActionId+"' onclick='deleteSensorActionById("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='trash icon'></i>删除</a></td>");

 	  									td.appendTo($("[name="+sensorId+"] table")); 
 	  		                		})
 	  									$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
 	  				                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+data.sensorActionList[0].sensorId+")'><i class='add icon'></i>添加触发</div>"+
 	  				                       "</div></div></div>")
 	  		                	}
 	  	                		a=0;
 	  	                	}//${success}
 	  	                	
 	  	                
 	  	                	
 	  	                })//$ajax
        				}
        				 
        			},error:function(){
        				alert("删除失败")
        			}
        		})
            }
		})
		
		
	}
	$("#triggerOption").val($("[name='tiggerO1']").attr("data-value"));
   function openActionTrigger(sensorActionId,sensorId){
	 
	   
	  // alert("函数运行")
	   var url = "updateSensorActionById";
	   	if(sensorActionId == null){
	   		$("#editActionTriggerDialog .header").html("新增触发动作");
	   			url = "insertSensorAction";
	   			console.log(url)
	   	}else{
       	$("#editActionTriggerDialog .header").html("编辑触发动作");
	   	}
       $("#editActionTriggerDialog").modal("show");
       //alert(sensorActionId)
      
      var a = 1;//防止button多次单击事件的标示位
	
   	$.ajax({
   	   url:"queryOneSensorActionById",
   	   data:{sensorActionId:sensorActionId},
      	   type:"post",
      	   success:function(data){
      		 //  console.log(data.sensorAction)
      		   var sensorAction = data.sensorAction;
      		 console.log(sensorAction)
      		 alert(sensorAction)
      		   if(sensorAction != null){
	      		   $("#triggerOption").attr("value",sensorAction.triggerOption);
	      		   $("#triggerValue").attr("value",sensorAction.triggerValue);
	      		   $("#message").val(sensorAction.message);
	      		   $("#actionId").attr("value",sensorAction.actionId);
      		   }else{
      			 $("#triggerOption").attr("value","");
	      		   $("#triggerValue").attr("value","");
	      		   $("#message").val("");
	      		   $("#actionId").attr("value","");
      		   }
      		  
      		 
      		 
	   	$("#okBtn").one("click",function(){
	   		   if(a==1){ 
	  	      // alert("这个单击事件函数运行了open")
	  	       var triggerOption = $("#triggerOption").val();
			   var triggerValue = $("#triggerValue").val();
			   var message = $("#message").val();
			   var actionId = $("#actionId").val();
	  	       	$.ajax({
	   	    	   
	   	    	   url:url,
	   	    	   data:{
	   	    		   sensorId:sensorId,
	   	    		   sensorActionId:sensorActionId,
	   	    		   triggerOption:triggerOption,
	   	    		   triggerValue:triggerValue,
	   	    		   message:message,
	   	    		   actionId:actionId
	   	    		   
	   	    	   },
	   	    	   type:"post",
	   	    	   success:function(data1){
	   	    		   console.log(data1)
	   	    		   if(data1.result == true){
	   	    			 $.ajax({
	  	                	url:"queryAllSensorAction",
	  	                	data:{sensorId:sensorId},
	  	                	type:"post",
	  	                	dataType:"json",
	  	                	async:false,
	  	                	success:function(data){
	  	                	$("[name="+sensorId+"] table").empty();
	  	                	
	  	                	//console.log(data.sensorActionList.length)
	  		                	if(data.sensorActionList.length == 0){
	  		                		$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
	  					                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+sensorId+")'><i class='add icon'></i>添加触发</div>"+
	  					                       "</div></div></div>")
	  		                		
	  		                	}else{
	  		                		$.each(data.sensorActionList, function(index, sensorAction){
	  		                			
	  		                			//console.log(sensorAction)
	  		                			
	  									var td = $("<tr></tr>");

	  									td.html("<td>当值"+sensorAction.triggerOption+sensorAction.triggerValue+"时，执行动作"+sensorAction.actionId+"</td>"+
	  											"<td><a href='javascript:void(0)' onclick='openActionTrigger("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='edit icon'></i>编辑</a></td>"+
	  											"<td><a id='"+sensorAction.sensorActionId+"' onclick='deleteSensorActionById("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='trash icon'></i>删除</a></td>");

	  									td.appendTo($("[name="+sensorId+"] table")); 
	  		                		})
	  									$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
	  				                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+data.sensorActionList[0].sensorId+")'><i class='add icon'></i>添加触发</div>"+
	  				                       "</div></div></div>")
	  		                	}
	  	                		
	  	                		
	  	                	}//${success}
	  	                	
	  	                
	  	                	
	  	                })
	   	    			   
	   	    		   }else{
	   	    			   
	   	    			   alert("编辑失败")
	   	    			
	   	    		   }
	   	    	   },
	   	    	   error:function(){
	   	    		   a=0;
	   	    		   alert("失败啦")
	   	    	
	   	    	   }
	   	    	   
	   	    	   
	   	       }) 
	   	       
	  	     
	   		 	//alert("函数结束")
	   		   }
	   		   a=0;
	   		//alert("函数结束")
	   		   })
	   		   
	   		
	   		   
	   		}
      })
   		
   }
	
   $(function(){
	   
	   $("#tude").append("<span>,<span>")
   })
</script>
<script type="text/javascript">
 	var deviceId = $("#deviceId").html();
 	console.log(deviceId)
	var total_size;	// 总记录数	
	var page_size=4;		// 每页记录数
	var page_index = 0;		// 当前页
	var i = 1;
	
	
	function likeSelectPages(page_index){
		
		$.ajax({
			url:"likeQuerySensorsListpages",
			type:"POST",
			dataType:"json",
			async:false,
			data:{
				deviceId:deviceId,
				currentpage:page_index,
				pagesize:page_size
			},	success: function(data){
				//console.log(data)
				$("#sensorDiv").empty();
				//alert("likeyunxing")
				$.each(data.list, function(index, sensor){
					var status = "";
					var type = "";
					var datapoint1 = "";
					//var  sensor.sensorId+1;
					if(sensor.status == -1){
						status = "<div class='ui left corner label error' data-variation='inverted'><div class='text'>异常</div></div>";
						
					}
					if(sensor.type == 1){
						type = "<span class='ui type label'>数值型</span>";
						datapoint1 = "<p class='data'>"+sensor.datapoint+"</p><p class='unit'>摄氏度 / °C</p>";
						
					}else if(sensor.type == 2){
						type = "<span class='ui type label'>开关型</span>";
						datapoint1 = "<input type='checkbox' name='switch' id='"+sensor.sensorId+"' style='display:none' checked><label class='switch' for='"+sensor.sensorId+"'></label>";
						
					}else if(sensor.type == 3){
						type = "<span class='ui type label'>GPS型</span>";
						var datapoint2 = sensor.datapoint.split(",");
						
						var datapoint3 = datapoint2[0].substring(0,5)+","+datapoint2[1].substring(0,5);
						datapoint1 = "<p class='gps' title='详细值："+sensor.datapoint+"'><span id='tude' >"+datapoint3+"</span></p><p class='unit'>经纬度</p>";
						
					}else{
						type = "<span class='ui type label'>微博抓取型</span>";
						datapoint1 = " <p class='data'>"+sensor.datapoint+"</p><p class='unit'>条未读</p>";
					}
					
					$("#sensorDiv").append(
					"<div class='ui middle aligned device vertical grid segment'>"+
                    "<div class='eleven wide column'>"+status+
                    "<div class='ui info segment'><h5 class='ui header sprite-icon data'>"+sensor.name+
                    type+"</h5>" + "<p>标示ID： <span class='stress'>"+sensor.sensorId+"</span></p>"+
					"<p>地址："+ sensor.address+"</p>"+
					"<p>API 地址："+sensor.apiAddress+"</p></div></div>"+    
                    "<div class='five wide center aligned column'>"+
                    "<div class='ui data segment'>"+datapoint1+"</div></div>"+
                    "<div class='ui basic attached accordion action'>"+
                    "<a class='sensorEdit' href='./toeditSensor/"+sensor.sensorId+"'><i class='edit icon'></i>编辑</a>"+
                    "<a id='"+sensor.sensorId+"' name='deleteSensor'  class='sensorEdit' ><i class='edit icon'></i>删除</a>"+
                    "<a class='title sensorEdit'><i class='dropdown icon ' ></i>触发动作</a>"+
                   
                    "<div name='"+sensor.sensorId+"' class='content'><table name='11111' class='ui basic table'>"+
                   
                   
                   "</table></div>"+
                    "<div class='chartShow'> <div class='ui inverted active dimmer'> <div class='content'> <div class='center'><h2 class='ui icon header'>"+
      
                     "<i class='chart basic icon'></i></h2> </div> </div> </div> </div></div>"

					)
						
				})
			},complete:function(){
			//	var sensorId = $("[name='deleteSensor']").attr("id");
				//console.log(sensorId+"::::::::::::::::;---")
				$('.ui.accordion').accordion({
		            onOpen:function(){
		            	var sensorId = $(this).attr("name");
		            	console.log($(this).attr("name"))
		            	$("[name="+sensorId+"] table").empty();
		                alert("点击触发动作，加载动作列表....");
		                 $.ajax({
		                	url:"queryAllSensorAction",
		                	data:{sensorId:sensorId},
		                	type:"post",
		                	dataType:"json",
		                	success:function(data){
		                	
		                	//console.log(data.sensorActionList.length)
			                	if(data.sensorActionList.length == 0){
			                		$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
						                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+sensorId+")'><i class='add icon'></i>添加触发</div>"+
						                       "</div></div></div>")
			                		
			                	}else{
			                		$.each(data.sensorActionList, function(index, sensorAction){
			                			
			                			//console.log(sensorAction)
			                			
										var td = $("<tr></tr>");

										td.html("<td>当值"+sensorAction.triggerOption+sensorAction.triggerValue+"时，执行动作"+sensorAction.actionId+"</td>"+
												"<td><a href='javascript:void(0)' onclick='openActionTrigger("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='edit icon'></i>编辑</a></td>"+
												"<td><a id='"+sensorAction.sensorActionId+"' onclick='deleteSensorActionById("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='trash icon'></i>删除</a></td>");

										td.appendTo($("[name="+sensorId+"] table")); 
			                		})
										$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
					                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+data.sensorActionList[0].sensorId+")'><i class='add icon'></i>添加触发</div>"+
					                       "</div></div></div>")
			                	}
		                	}//${success}
		                	
		                
		                	
		                })
		                
		                
		                
		           
		                
		                
		            }
		        });
				
				
				
				
				
				$("[name='deleteSensor']").click(function(){
					var sensorId = $(this).attr("id");
					//console.log(sensorId)
					
					 $.myConfirm({
		                title:"确认提示框",
		                message:"是否删除该传感器",
		                callback:function(){
		                	$.ajax({
								url:"deleteSensor",
								data:{
									sensorId:sensorId
								},
								type:"POST",
								dataType:"json",
								success:function(data){
									console.log(data)
									if(data.key == true){
										alert("删除成功")
										location.href="todevice"
									}else{
										alert("删除失败")
									}
								},error:function(){
									alert("删除失败")
								}
							})
		                }
      				  })
					
					
				})
			},
			error:function(){
				alert("出错了2");
			}
			
		})
		
	}
	$(function(){
		//likeQuerySensorsList
		$("#likeButton").click(function(){
			var name = $("#likeSensor").val();
			var deviceId1 = deviceId;
			$.ajax({
				url:"likeQuerySensorsList",
				data:{
					name:name,
					deviceId:deviceId1
				},
				type:"POST",
				dataType:"json",
				success:function(data){
					console.log(data)
					$("#sensorDiv").empty();
					total_size = data.totalSize;
					//console.log(total_size)
					//page_size = data.pageSize;
					
					$("#pagination").pagination(total_size, {
						prev_text:"<",
						next_text:">",
						num_display_entries:5,	// 连续分页主体显示的分页条目数
						num_edge_entries:1,		//两端显示的首尾分页的条目数
						items_per_page:page_size,		// 每页的记录数
						current_page:page_index,
						link_to:"javascript:void(0)",
						callback:likeSelectPages
					});
					likeSelectPages(page_index)
					
				},
				error:function(){
					alert("模糊查询的错误");
				}
			
			})
			
		})
		
		
		
		
		
		
		
		
		
		
		
		
		
	$.ajax({
			
			url:"getSensorsList",
			data:{
				deviceId:deviceId,
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
		pageSelectCallbackasd(0);
		function pageSelectCallbackasd(page_index){
			$.ajax({
				url:"getSensorsList",
				type:"POST",
				dataType:"json",
				async:false,
				data:{
					deviceId:deviceId,
					currentpage:page_index,
					pagesize:page_size
				},
				success: function(data){
					//console.log(data)
					$("#sensorDiv").empty();
					$.each(data.list, function(index, sensor){
						var status = "";
						var type = "";
						var datapoint1 = "";
						//var  sensor.sensorId+1;
						if(sensor.status == -1){
							status = "<div class='ui left corner label error' data-variation='inverted'><div class='text'>异常</div></div>";
							
						}
						if(sensor.type == 1){
							type = "<span class='ui type label'>数值型</span>";
							datapoint1 = "<p class='data'>"+sensor.datapoint+"</p><p class='unit'>摄氏度 / °C</p>";
							
						}else if(sensor.type == 2){
							type = "<span class='ui type label'>开关型</span>";
							datapoint1 = "<input type='checkbox' name='switch' id='"+sensor.sensorId+"' style='display:none' checked><label class='switch' for='"+sensor.sensorId+"'></label>";
							
						}else if(sensor.type == 3){
							type = "<span class='ui type label'>GPS型</span>";
							var datapoint2 = sensor.datapoint.split(",");
							
							var datapoint3 = datapoint2[0].substring(0,5)+","+datapoint2[1].substring(0,5);
							datapoint1 = "<p class='gps' title='详细值："+sensor.datapoint+"'><span id='tude' >"+datapoint3+"</span></p><p class='unit'>经纬度</p>";
							
						}else{
							type = "<span class='ui type label'>微博抓取型</span>";
							datapoint1 = " <p class='data'>"+sensor.datapoint+"</p><p class='unit'>条未读</p>";
						}
						
						$("#sensorDiv").append(
						"<div class='ui middle aligned device vertical grid segment'>"+
	                    "<div class='eleven wide column'>"+status+
	                    "<div class='ui info segment'><h5 class='ui header sprite-icon data'>"+sensor.name+
	                    type+"</h5>" + "<p>标示ID： <span class='stress'>"+sensor.sensorId+"</span></p>"+
						"<p>地址："+ sensor.address+"</p>"+
						"<p>API 地址："+sensor.apiAddress+"</p></div></div>"+    
	                    "<div class='five wide center aligned column'>"+
	                    "<div class='ui data segment'>"+datapoint1+"</div></div>"+
	                    "<div class='ui basic attached accordion action'>"+
	                    "<a class='sensorEdit' href='./toeditSensor/"+sensor.sensorId+"'><i class='edit icon'></i>编辑</a>"+
	                    "<a id='"+sensor.sensorId+"' name='deleteSensor'  class='sensorEdit' ><i class='edit icon'></i>删除</a>"+
	                    "<a class='title sensorEdit'><i class='dropdown icon ' ></i>触发动作</a>"+
	                   
	                    "<div name='"+sensor.sensorId+"' class='content'><table name='11111' class='ui basic table'>"+
	                   
	                   
	                   "</table></div>"+
	                    "<div class='chartShow'> <div class='ui inverted active dimmer'> <div class='content'> <div class='center'><h2 class='ui icon header'>"+
          
	                     "<i class='chart basic icon'></i></h2> </div> </div> </div> </div></div>"

						)
							
					})
				},complete:function(){
				//	var sensorId = $("[name='deleteSensor']").attr("id");
					//console.log(sensorId+"::::::::::::::::;---")
					$('.ui.accordion').accordion({
			            onOpen:function(){
			            	var sensorId = $(this).attr("name");
			            	console.log($(this).attr("name"))
			            	$("[name="+sensorId+"] table").empty();
			                alert("点击触发动作，加载动作列表....");
			                 $.ajax({
			                	url:"queryAllSensorAction",
			                	data:{sensorId:sensorId},
			                	type:"post",
			                	dataType:"json",
			                	success:function(data){
			                	
			                	//console.log(data.sensorActionList.length)
				                	if(data.sensorActionList.length == 0){
				                		$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
							                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+sensorId+")'><i class='add icon'></i>添加触发</div>"+
							                       "</div></div></div>")
				                		
				                	}else{
				                		$.each(data.sensorActionList, function(index, sensorAction){
				                			
				                			//console.log(sensorAction)
				                			
											var td = $("<tr></tr>");
	
											td.html("<td>当值"+sensorAction.triggerOption+sensorAction.triggerValue+"时，执行动作"+sensorAction.actionId+"</td>"+
													"<td><a href='javascript:void(0)' onclick='openActionTrigger("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='edit icon'></i>编辑</a></td>"+
													"<td><a id='"+sensorAction.sensorActionId+"' onclick='deleteSensorActionById("+sensorAction.sensorActionId+","+sensorAction.sensorId+")'><i class='trash icon'></i>删除</a></td>");
	
											td.appendTo($("[name="+sensorId+"] table")); 
				                		})
											$("[name="+sensorId+"] table").append("<div class='ui vertical segment'>"+
						                       "<div class='ui red mini button' onclick='openActionTrigger("+null+","+data.sensorActionList[0].sensorId+")'><i class='add icon'></i>添加触发</div>"+
						                       "</div></div></div>")
				                	}
			                	}//${success}
			                	
			                
			                	
			                })
			                
			                
			                
			           
			                
			                
			            }
			        });
					
					
					
					
					
					$("[name='deleteSensor']").click(function(){
						var sensorId = $(this).attr("id");
						//console.log(sensorId)
						
						 $.myConfirm({
			                title:"确认提示框",
			                message:"是否删除该传感器",
			                callback:function(){
			                	$.ajax({
									url:"deleteSensor",
									data:{
										sensorId:sensorId
									},
									type:"POST",
									dataType:"json",
									success:function(data){
										console.log(data)
										if(data.key == true){
											alert("删除成功")
											location.href="todevice"
										}else{
											alert("删除失败")
										}
									},error:function(){
										alert("删除失败")
									}
								})
			                }
          				  })
						
						
					})
				},
				error:function(){
					alert("出错了2");
				}
			})
		}
		
	});	// $()
  </script>

</body>
</html>