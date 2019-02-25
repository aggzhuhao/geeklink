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
    <title>增加新动作 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
	<link type="text/css" rel="stylesheet" href="resource/css/register.css">
	<style type="text/css">
		#frm_register span.error {
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
  						<a class="item" href="./todevicesList">
    						<i class="settings icon"></i> 我的设备
  						</a>
  						<a class="active teal item" href="./queryAllDeviceAction">
							<i class="terminal icon"></i> 设备动作
  						</a>
					</div>
				</div>
			</div>

            <div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large add icon"></i>
  							<div class="content">
    							增加新动作
  							</div>
						</h3>
					</div>
				</div>
				<form id="frm_register" class="ui form fluid vertical segment" action="./addnewAction" name="form" method="post">
                    <div class="two fields">
                    	<div class="field">
                            <label>动作名</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="name" name="name">
                            </div>
                        </div>
                    </div>
                    <div class="field">
                        <label>类型</label>
                            <select class="form-control" id="type" name="type">
                                <option value="1">电子邮件</option>
                                <option value="2">网址推送</option>
                                <option value="3">微博发布</option>
                                <option value="4">移动端推送</option>
                            </select>
                    </div>

                    <div class="two fields">
                        <div class="field">
                            <label>类型值</label>
                            <div class="ui small left icon input">
                                <i class="terminal icon"></i>
                                <input type="text" id="typeValue" name="typeValue" placeholder="请输入相应的邮箱、网址、微博号或手机号">
                            </div>
                        </div>
                    </div>

                    

                    <div class="two fields">
                        <div class="field">
                            <input type="radio" id="usable" name="status" value="1" checked="checked"><span style="font-size:14px">启用</span>
                            <input type="radio" id="notusable" name="status" value="0"><span style="font-size:14px">禁用</span>
                         </div>
                    </div>
                    <button id="savaNewAction" class="ui small blue button" type="button">保存</button>
                    <button class="ui small basic button" type="reset">取消</button>
                </form>
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
<script type="text/javascript" src="resource/javascript/new_action.js"></script>
<script type="text/javascript" src="resource/javascript/framework.js"></script>

<!--validate-->
<script type="text/javascript" src="resource/javascript/jquery.validate.js"></script>
<script type="text/javascript" src="resource/javascript/jquery.validate.extends.js"></script>

<script type="text/javascript">
	$(function(){
		  $("#frm_register").validate({
			  rules:{
				  name:{
					  required:true,
					  rangelength:[2,10]
				  },
				  type:{
					  required:true
				  },
				 
				  status:{
					  required:true
				  }
			  },
			  messages:{
				 name:{
					 required:"姓名不得为空",
					 rangelength:"姓名的长度必须在2-10个字符之间"
				 },
				 type:{
					 required:"类型不得为空" 
				 },
				 
				 status:{
					 required:"状态不得为空"
				 }  
			  },
			  errorPlacement: function(error, element) {
				  error.appendTo(element.parent().parent());
			  },
			  errorElement:"span"
  
		  })
		$("#typeValue").blur(function(){
			$("[name='message']").remove();
		})  
		
		  
		$("#savaNewAction").click(function(){
			var email = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
			var url = /^(?=^.{3,255}$)[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+$/;
			var tweet = /@\S+/;
			var phone = /^1[3|4|5|8][0-9]\d{4,8}$/;

			var typeValue = $("#typeValue").val()
			var type = $("#type").val();
			$("[name='message']").remove();
			
			if(type == 1){
				if(email.test(typeValue)){
					$("#frm_register").submit();
				}else{
					$("#typeValue").after("<span name='message' style='color:red'>请输入正确的邮箱</span>")
				}
			}else if(type == 2){
				if(url.test(typeValue)){
					$("#frm_register").submit();
				}else{
					$("#typeValue").after("<span name='message' style='color:red'>请输入正确的网址</span>")
				}
			}else if(type == 3){
				if(tweet.test(typeValue)){
					$("#frm_register").submit();
				}else{
					$("#typeValue").after("<span name='message' style='color:red'>请输入正确的微博账号</span>")
				}
			}else{
				if(phone.test(typeValue)){
					$("#frm_register").submit();
				}else{
					$("#typeValue").after("<span name='message' style='color:red'>请输入正确的手机号</span>")
				}
			}
			
			//$("#frm_register").submit();
		})	  
		  
	})
</script>
</body>
</html>
