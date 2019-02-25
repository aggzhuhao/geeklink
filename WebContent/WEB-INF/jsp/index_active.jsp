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
    <title>管理首页 | GeekLink用户中心</title>
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
				<a class="item" href="javascript:void(0)" onclick="javascript:alert('您没激活帐户，无法进行操作')"><i class="sitemap icon"></i>设备</a>
				
				<a class="active item" href="./touserprofile"><i class="info icon"></i>账户</a>
			</div>
		</div>
	</div>

<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="pageHeader">
			<div class="segment">
				<h3 class="ui dividing header">
  					<i class="large home icon"></i>
  					<div class="content">
    					管理首页
    				<div class="sub header">快速查看和编辑</div>
  					</div>
				</h3>
			</div>
		</div>
        <div class="ui warning message">
            	<i class="close icon" data-dismiss="alert"></i>
            <div class="header">
            	<i class="warning icon"></i> 当前帐户还未激活.
            </div>
            请填写您注册时获得的API Key，完成验证。
        </div>
       <div class="ui small message" id="showApiKey">
           <div class="ui form segment">
                <div class="inline field">
                    <label>您的API Key :</label>
                    <div class="ui small left icon input short">
                        <i class="key icon"></i>
                        <input type="text" value="793jIEGJjkjkljfUI3JRTJOIO" readonly="readonly" id="apiKey">
                    </div>
                    <a class="ui mini green button"  href="#">激活</a>

                    <a id="deviceQuickButton" class="ui red small labeled icon button" href="javascript:void(0)" onclick="javascript:alert('您没激活帐户，无法进行操作')">
                        <i class="settings icon"></i>管理所有设备
                    </a>
                </div>
          </div>
      </div>
	<!--device list-->
	<div class="ui three column grid" id="indexList">
		<div class="row">
			<div class="ui warning message">
				<i class="close icon" data-dismiss="alert"></i>
				<div class="header">
					<i class="warning icon"></i> 警告.
				</div>
				未激活账户，geeklink将无法给您提供服务，如“添加新设备”及“管理所有设备”。
			</div>
		</div>
		<div class="row">
			<div class="column">
				<div class="ui blue segment">
					<a id="newdevice" class="content" href="javascript:void(0)" onclick="javascript:alert('您没激活帐户，无法进行操作')">
						<h4 class="newDevice"><i class="huge add icon"></i>
						添加新设备</h4>
					</a>
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
<script type="text/javascript" src="resource/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript" src="resource/javascript/alert.js"></script>
<script>
	$(document).ready(function(){
		$('a#copy-apiKey').zclip({
			path:'resource/javascript/ZeroClipboard.swf',
			copy:function(){return $('input#apiKey').val();}
		});

		$('.ui.dropdown').dropdown();


	});
</script>
</body>
</html>
