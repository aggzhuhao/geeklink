<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="renderer" content="webkit">
    <title>修改密码 | GeekLink用户中心</title>
    <link type="text/css" rel="stylesheet" href="resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="resource/css/main.css" />
    <style type="text/css">
   	#form span.error {
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
  						<a class="item" href="./touserprofile">
							<i class="edit icon"></i>账户设置
  						</a>

  						<a class="active teal item" href="./toChangePassword">
    						<i class="lock icon"></i> 修改密码
  						</a>

						<a class="item" href="./tonotifications">
							<i class="chat icon"></i> 我的消息
						</a>
					</div>
				</div>
			</div>
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing  header">
  							<i class="large unlock alternate icon"></i>
  							<div class="content">
    							修改密码
  							</div>
						</h3>
					</div>
				</div>
				<!--the form-->
                <form class="ui form vertical segment" action="changePassword" id="form" name="form" method="post">
                    <div class="two fields">
                        <div class="field">
                            <label>原密码</label>
                            <div class="ui small left icon input">
                              <input type="password" id="password1" name="password1" size="30">
                              <i class="lock icon"></i>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                    	<div class="field">
                        	<label>新密码</label>
                            <div class="ui small left icon input">
                            	<input type="password" id="password2" name="password2" size="30">
                                <i class="lock icon"></i>
                            </div>
                        </div>
                    </div>
                    <div class="two fields">
                    	<div class="field">
                        	<label>确认新密码</label>
                            <div class="ui small left icon input">
                            	<input type="password" id="password" name="password" size="30">
                                <i class="lock icon"></i>
                            </div>
                        </div>
                    </div>
                    <input class="ui small blue submit button" type="submit" value="保存">
                    <input class="ui small basic button" type="reset" value="取消">
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
<script type="text/javascript" src="resource/javascript/framework.js"></script>
<script type="text/javascript" src="resource/javascript/jquery.validate.js"></script>
<script type="text/javascript" src="resource/javascript/jquery.validate.extends.js"></script>
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
	
	$(function(){
		$("#form").validate({
			rules:{
				password1:{
					required:true,
					remote:{  	// ajax校验
						url:"checkOldpassword",
						type: "POST",
						data:{				
							"password1":function(){
								console.log($("#password1").val())
								return $("#password1").val();
							}	// function
						}
					}
				},
				password2:{
					required:true
				},password:{
					equalTo:"#password2"
				}
				
			},
			messages:{
				password1:{
					required:"原始密码不得为空",
					remote:"与原始密码不一致"
				},
				password2:{
					required:"密码不得为空"
				},
				password:{
					equalTo:"密码不一致"
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