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
                <a class="item" href="./index.html"><i class="home icon"></i>管理首页</a>
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
                            <i class="large edit icon"></i>
                            <div class="content">编辑触发动作
                            </div>
                        </h3>
                    </div>
                </div>

                <div class="ui form vertical segment">
                    <form name="form" action="device.html" method="post">
                    
                        <div class="inline field">
                            <label>当数据满足:</label>
                            <div class="ui dropdown selection">
                                <input type="hidden" name="gender" value="1">
                                <div class="default text"> 大于 </div>
                                <i class="dropdown icon"></i>
                                <div class="menu">
                                    <div class="item" data-value="大于" value="1"> 大于 </div>
                                    <div class="item" data-value="大于或等于 " value="2"> 大于或等于 </div>
                                    <div class="item" data-value="小于" value="3"> 小于 </div>
                                    <div class="item" data-value="小于或等于" value="4"> 小于或等于 </div>
                                    <div class="item" data-value="等于" value="5"> 等于 </div>
                                </div>
                            </div>
                            <input type="text" >
                        </div>
                        <div class="inline field">
                            <label>指定动作：</label>
                            <div class="ui dropdown selection">
                                <input type="hidden" name="gender" value="1">
                                <div class="default text"> 示例动作01 </div>
                                <i class="dropdown icon"></i>
                                <div class="menu">
                                    <div class="item" data-value="示例动作01" value="1"> 示例动作01 </div>
                                    <div class="item" data-value="示例动作02" value="2"> 示例动作02 </div>
                                    <div class="item" data-value="示例动作01" value="3"> 示例动作03 </div>
                                </div>
                            </div>
                            <div class="ui pointing left label">
                                可在 设备动作 中添加新动作.
                            </div>
                        </div>
                        <div class="inline field">
                            <label>消息内容:</label>
                            <textarea placeholder="不超过120个字……"></textarea>
                        </div>

                        <button class="ui small blue button" type="submit">保存</button>
                        <button class="ui small basic button" type="reset">取消</button>
                    </form>
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
<script type="text/javascript" src="resource/javascript/jquery-ui.min.js"></script>
<script>
    $(document).ready(function(){
		$('.ui.dropdown')
			.dropdown()
        ;

        $('.ui.accordion')
        .accordion()
        ;

        $('.show a').click(function(){
            $('.show.chart').toggleClass('active');
            $('.chartShow').toggleClass('active');
        });

        $('.test.addNewDIYAction.modal')
		.modal('attach events','.addaction.button','show');
	});
</script>
</body>
</html>
