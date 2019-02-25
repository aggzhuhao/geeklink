<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>我的消息 | GeekLink用户中心</title>
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
  						<a class="item" href="./toChangePassword">
    						<i class="lock icon"></i> 修改密码
  						</a>
						<a class="active teal item" href="./tonotifications">
    						<i class="chat icon"></i> 我的消息
  						</a>
					</div>
				</div>
			</div>
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large chat icon"></i>
  							<div class="content">
    							我的消息
    							<div class="sub header">我的系统消息以及评论</div>
  							</div>
						</h3>
					</div>
				</div>
				<!--notifications feed-->
				<div class="ui vertical feed segment">
					
					<c:forEach items="${messageList}" var="message">
					<div class="event">
						<div class="label">
						  <img src=".${message.senderUser.avatar}">
						</div>
						<div class="content">
							  <div class="date">
							  <jsp:useBean id="now" class="java.util.Date" scope="page"/>
								<c:if test="${message.time<60000}">刚刚</c:if>	
							  <c:if test="${message.time>=60000&& message.time<3600000}"><fmt:formatNumber type="number" value="${message.time/60000}" pattern="0"  maxFractionDigits="0"></fmt:formatNumber>分钟 前</c:if>	
							  <c:if test="${message.time>=3600000&& message.time<86400000}"><fmt:formatNumber type="number" value="${message.time/3600000}" pattern="0"  maxFractionDigits="0"></fmt:formatNumber>小时 前</c:if>
							  <c:if test="${message.time>=86400000 }"><fmt:formatNumber type="number" value="${message.time/86400000}" pattern="0"  maxFractionDigits="0"></fmt:formatNumber>天 前</c:if>
							 
								<span id="showtime"></span>
							  </div>
							  <div class="summary">
								  <c:choose>
								 <c:when test="${message.type==1 }">您的VIP会员即将到期，请尽快 充值 .
								 </c:when>
								 <c:when test="${message.type==2 }">用户 <a>${message.senderUser.name }</a>给您发了条新私信 ：
								 </c:when>
								 <c:when test="${message.type==3 }">用户 <a>${message.senderUser.name }</a>评论了您的设备 ：
								 </c:when>
								 </c:choose><a>${message.subject }</a>
							  </div>
							  <div class="extra text">
								${message.msg }
							  </div>
						</div>
					</div>
					</c:forEach>
					
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
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
	$(function(){
		
		
	})
	
</script>
</body>
</html>
