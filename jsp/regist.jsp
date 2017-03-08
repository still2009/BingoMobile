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
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">注册</h1>
	</header>
	<div class="mui-content">
		<form class="mui-input-group" action="regist.action" method="post">
			<div class="mui-input-row">
				<label>账号</label> <input id='account' name="userName" type="text"
					class="mui-input-clear mui-input" placeholder="请输入账号">
			</div>
			<div class="mui-input-row">
				<label>密码</label> <input id='password' name="password" type="password"
					class="mui-input-clear mui-input" placeholder="请输入密码">
			</div>
			<div class="mui-input-row">
				<label>确认</label> <input id='password_confirm' type="password" class="mui-input-clear mui-input"
					placeholder="请确认密码">
			</div>
			<div class="mui-input-row">
				<label>邮箱</label> <input id='email' name="mail" type="email" class="mui-input-clear mui-input"
					placeholder="请输入邮箱">
			</div>
		</form>
		<div class="mui-content-padded">
			<button id='reg' class="mui-btn mui-btn-block mui-btn-positive">注册</button>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
		(function($, doc) {
			$.init();
			$
					.ready(function() {
						var settings = app.getSettings();
						var regButton = doc.getElementById('reg');
						var accountBox = doc.getElementById('account');
						var passwordBox = doc.getElementById('password');
						var passwordConfirmBox = doc
								.getElementById('password_confirm');
						var emailBox = doc.getElementById('email');
						regButton.addEventListener('tap', function(event) {
							var regInfo = {
								userName : accountBox.value,
								password : passwordBox.value,
								mail : emailBox.value
							};
							var passwordConfirm = passwordConfirmBox.value;
							if (passwordConfirm != regInfo.password) {
								alert('密码两次输入不一致');
								return;
							}

							mui.post('regist.action',regInfo, function(data) {
								//服务器返回响应，根据响应结果，分析是否登录成功；
								if(data=='success'){
									alert('注册成功');
									window.location.href='login.jsp';
								}
								else alert('用户已存在，注册失败');
							}, 'text');

						});
					});
		}(mui, document));
	</script>
</body>
</html>