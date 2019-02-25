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
    <title>用户注册</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />

	<link type="text/css" rel="stylesheet" href="resource/css/global.css">
	<link type="text/css" rel="stylesheet" href="resource/css/register.css">
</head>
<body>
<div class="page">
<!--header begin-->
<header>
	<div class="bigcontainer">
		<div id="logo">
			<a href="./">GeekLink用户中心</a>
		</div>
		
	</div>
</header>


<!--the main content begin-->
	<div id="banner" class="short">
		<div class="inset">
			<h1>用户注册</h1>
			<p>Connect the real world and the internet world!</p>
		</div>
	</div>

	<br>
	<div id="body">
		<div class="ui warning message">
			<i class="close icon" data-dismiss="alert"></i>
			<div class="header">
				<i class="warning icon"></i> 您已成功注册。接下来，请激活您的帐户。
			</div>
			API Key是您访问我们提供的API的唯一授权方式。请妥善保管，否则将不能使用我们的服务。

		</div>

		<div class="ui small message" id="showApiKey">
			<div class="ui form segment">
				<div class="inline field">
					<label>您的API Key :</label><label id="apiKeylabel">${apikey }</label>
					<div class="ui small left icon input short">
						<i class="key icon"></i>
						
					</div>
					<a class="ui mini green button" id="copy-apiKey" href="#">复制</a>

					<button id="getapiKey" class="btn-primary btn" name="commit" type="submit" value="激活" > 激活我的帐户</button>
				</div>
			</div>


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
		
		$("#getapiKey").click(function(){
			var key = $("#apiKeylabel").html();
			console.log(key)
			location.href="changeStatus/"+key;
			
		})
			
		
	});
</script>
</body>
</html>
