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
    <title>用户登陆</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />

	<link type="text/css" rel="stylesheet" href="resource/css/global.css">
	<link type="text/css" rel="stylesheet" href="resource/css/register.css">
	
	<script type="text/javascript">
		
	</script>
	
	
	
</head>
<body>
<div class="page">
<!--header begin-->
<header>
	<div class="bigcontainer">
		<div id="logo">
			<a href="javascript:void(0)">GeekLink用户中心</a>
		</div>
	</div>
</header>

<!--the main content begin-->
	<div id="banner" class="short">
		<div class="inset">
			<h1>用户登录</h1>
			<p>Connect the real world and the internet world!</p>
		</div>
	</div>
	
	<div id="body">
		<div id="reg_frmbox">
		
			<form id="frm_register" accept-charset="UTF-8" action="loginuser" class="frm_reg" name="form" method="post">

				<fieldset>
				<span id="errmsg1" style="color: #900; background: #fff0f0">${userIdMsgmessage }</span>
					<div class="control-group">
						<label class="control-label" for="username">用户名</label>
						<div class="controls"><input id="user_name" name="name" size="30" type="text" value="" style=" background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%;">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls"><input id="passwd" name="password" size="30" type="password" style=" background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%;">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="validate_code">验证码</label>
						<div class="controls">
							<img id="validata_img" src="changeCheckCode/1" alt="geelink"> <a id="change_validate_code" href="javascript:void(0);">看不清楚？再换一张</a>
						</div>
						<div class="controls">
							<input id="validate_code" name="zipCode" size="30" type="text" style="width:80px;">
						</div>
					</div>

					<div class="form-actions">
						<button class="btn-primary btn" name="commit" type="submit" value="登陆"> 登陆</button>
						<p>还没有GeekLink帐户，请<a href="toRegister" target="_blank">点击这里注册</p>
					</div>
				</fieldset>
			</form>

		</div>
		<div class="side_box">
			<h2>帐号与您的设备</h2>
			<p>
				感谢您的关注并准备注册为GeekLink用户。
			</p>
			<p>
				作为一家传感器云网络提供商，我们致力于将您身边的物体接入互联网，并使您能方便地通过互联网或者移动设备了解他们的状态、控制他们。除了我们提供的硬件设备外，您也可以设计自己的传感器硬件，并通过开放API免费接入。
			</p>

		</div>
	</div>




</div>  <!--page-->
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
<script type="text/javascript" src="resource/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript" src="resource/javascript/alert.js"></script>
<script>
	$(document).ready(function(){
		$('a#copy-apiKey').zclip({
			path:'resource/javascript/ZeroClipboard.swf',
			copy:function(){return $('input#apiKey').val();}
		});
		$('.ui.dropdown')
			.dropdown();
	});
	$(function(){
		$("#change_validate_code").click(function(){
			$("#validata_img").attr("src","changeCheckCode/"+Math.random());
			
		})
		
	})//$function
</script>
</body>
</html>
