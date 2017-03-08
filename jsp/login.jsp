<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title></title>
<link href="${pageContext.request.contextPath}/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
<style>
.area {
	margin: 20px auto 0px auto;
}

.mui-input-group {
	margin-top: 10px;
}

.mui-input-group:first-child {
	margin-top: 20px;
}

.mui-input-group label {
	width: 22%;
}

.mui-input-row label ~input, .mui-input-row label ~select,
	.mui-input-row label ~textarea {
	width: 78%;
}

.mui-checkbox input[type=checkbox], .mui-radio input[type=radio] {
	top: 6px;
}

.mui-content-padded {
	margin-top: 25px;
}

.mui-btn {
	padding: 10px;
}

.link-area {
	display: block;
	margin-top: 25px;
	text-align: center;
}

.spliter {
	color: #bbb;
	padding: 0px 8px;
}

.oauth-area {
	position: absolute;
	bottom: 20px;
	left: 0px;
	text-align: center;
	width: 100%;
	padding: 0px;
	margin: 0px;
}

.oauth-area .oauth-btn {
	display: inline-block;
	width: 50px;
	height: 50px;
	background-size: 30px 30px;
	background-position: center center;
	background-repeat: no-repeat;
	margin: 0px 20px;
	/*-webkit-filter: grayscale(100%); */
	border: solid 1px #ddd;
	border-radius: 25px;
}

.oauth-area .oauth-btn:active {
	border: solid 1px #aaa;
}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">登录</h1>
	</header>
	<div class="mui-content">
		<form id='login-form' class="mui-input-group" method="post" action="Login.action">
			<div class="mui-input-row">
				<label>账号</label> <input id='account' type="text" class="mui-input-clear mui-input"
					placeholder="请输入账号" name="userName">
			</div>
			<div class="mui-input-row">
				<label>密码</label> <input id='password' type="password" class="mui-input-clear mui-input"
					placeholder="请输入密码" name="password">
			</div>
		</form>
		<div class="mui-content-padded">
			<button id='login' class="mui-btn mui-btn-block mui-btn-positive">登录</button>
			<div class="link-area">
				<a id='reg' href="${pageContext.request.contextPath}/jsp/regist.jsp">注册账号</a>
				<%-- <span class="spliter">|</span>
				<a id='forgetPassword' href="forget_password.jsp">忘记密码</a> --%>
			</div>
		</div>
		<!--第三方登录-->
		<%-- <div class="mui-content-padded">
			<button id='login' class="mui-btn mui-btn-block mui-btn-danger mui-btn-outlined">使用QQ登录</button>
			<button id='login' class="mui-btn mui-btn-block mui-btn-positive mui-btn-outlined">使用微信登录</button>
		</div>
		<div class="mui-content-padded oauth-area"></div> --%>
	</div>
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/base.js"></script>
	<script src="${pageContext.request.contextPath}/js/mui.enterfocus.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
			(function($, doc) {
				$.init({
					statusBarBackground: '#f7f7f7'
				});
				$.ready(function() {
					var settings = app.getSettings();
					var state = app.getState();
					//检查 "登录状态" 开始
					 if (settings.autoLogin && state.token) {
						window.location.href="setting.html";
					} 
					//检查 "登录状态/锁屏状态" 结束
                    
					var loginButton = doc.getElementById('login');
					var accountBox = doc.getElementById('account');
					var passwordBox = doc.getElementById('password');
					var autoLoginButton = doc.getElementById("autoLogin");
					var regButton = doc.getElementById('reg');
					var forgetButton = doc.getElementById('forgetPassword');
					//登陆按钮
					loginButton.addEventListener('tap', function(event) {
						var loginInfo = {
							userName: accountBox.value,
							password: passwordBox.value
						};
						mui.post('login.action',loginInfo,function(data){
							if(data=='success'){
								alert('登陆成功');
								window.location.href='${pageContext.request.contextPath}/personal.action';
							}
							else alert('信息输错啦，登陆失败');
						},'text');
					});
					//焦点触发
					$.enterfocus('#login-form input', function() {
						$.trigger(loginButton, 'tap');
					});
					autoLoginButton.classList[settings.autoLogin ? 'add' : 'remove']('mui-active')
					autoLoginButton.addEventListener('toggle', function(event) {
						setTimeout(function() {
							var isActive = event.detail.isActive;
							settings.autoLogin = isActive;
							app.setSettings(settings);
						}, 50);
					}, false);
					//大小缩放
					window.addEventListener('resize', function() {
						oauthArea.style.display = document.body.clientHeight > 400 ? 'block' : 'none';
					}, false);
					
					//返回按钮
					var backButtonPress = 0;
					$.back = function(event) {
						backButtonPress++;
						if (backButtonPress > 1) {
							window.history.back();
						}
						setTimeout(function() {
							backButtonPress = 0;
						}, 1000);
						return false;
					};
				});
			}(mui, document));
		</script>
</body>
</html>