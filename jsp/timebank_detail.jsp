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
	padding: 5px 10px;
}

h1 {
	font-weight: normal;
}

.info {
	margin-top: 25px;
}

.info p {
	padding-top: 10px;
	margin-bottom: 5px;
}

.info .name {
	font-size: 16px;
	color: #666;
}

.info .name .mui-icon {
	color: #ccc;
	font-size: 18px;
}

.mui-content {
	background-color: #fff;
}

.intro {
	margin-top: 20px;
	padding-top: 10px;
	border-top: solid 1px #ccc;
}

.intro h2 {
	font-size: 18px;
	font-weight: normal;
}

#order label {
	margin: 20px 0;
	display: block;
}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">详情页面</h1>
	</header>
	<div class="mui-content">
		<div class="mui-content-padded">
			<h1>
				<s:property value="#request.info.infoTitle"/>
				<a href="#order" class="mui-btn mui-btn-danger mui-pull-right">预约</a>
			</h1>
			<div class="info clearfix">
				<div class="mui-pull-left avatar mui-radius">
					<img
						src="${pageContext.request.contextPath}/images/<s:property value="#request.info.user.headPic"/>"
						width="80" height="80" alt="">
				</div>
				<div class="detail clearfix">
					<p>
						<span class="name">
							<span class="mui-icon mui-icon-contact"></span>
							<s:property value="#request.info.user.userName"/>
						</span>
						<span class="update-time mui-pull-right">
							<i class="mui-time"></i><s:property value="#request.info.getFormatInfoTime()"/>
						</span>
					</p>
					<p>
						<button style="margin-left: 10px;" id="collectBtn"
							class="mui-btn mui-btn-primary mui-btn-bg mui-btn-outlined">收藏他的这段时间</button>
					</p>
				</div>
			</div>
			<!--简介-->
			<div class="intro">
				<h2>简介</h2>
				<p><s:property value="#request.info.infoContent"/></p>
			</div>
			<!--地址-->
			<div class="intro address">
				<h2>地址</h2>
				<p>成都市西南交通大学犀浦校区</p>
			</div>
		</div>
	</div>
	<div id="order" class="mui-modal">
		<header class="mui-bar mui-bar-nav">
			<a href="#order" class="mui-action-back mui-icon mui-icon-close mui-pull-right"></a>
			<h1 class="mui-title">预约详情</h1>
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
				<label for="#textatea">您即将发送预约信息给信息发布者</label>
				<textarea cols="10" rows="8" id="appointContent" placeholder="请填写您的请求或者答复"></textarea>
				<s:if test="#request.info.infoDirection == -1">
					<p style="color: firebrick">该信息在预约时将扣除<s:property value="#request.info.infoPayment"/>时间币,若预约失败时间币将自动退回</p>
				</s:if>
				<button class="mui-btn mui-btn-positive mui-btn-lg" id="submit">提交</button>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
	<script>
		window.onload = function(){
			var submit = document.getElementById('submit');
			var collect = document.getElementById('collectBtn');
			submit.addEventListener('tap',appoint);
			collect.addEventListener('tap',collectFunc);
		}
		//预约函数
		function appoint(){
			if(<s:property value="#request.info.user.id"/>==<s:property value="#session.user.id"/>){
				alert('这是您自己的时间，无需预约');return;
			}
			var content =  document.getElementById('appointContent').value;
			if(content.length < 10){alert('预约信息不能少于10个字');return;}
			mui.post('appointInfo.action',{
				infoId:'<s:property value="#request.info.id"/>',
				appointContent:content
			},function(data) {
				if(data=='success'){
					alert('预约成功');
				}else if(data=='no_points') alert('时间币不足，预约失败');
				else if(data=='already') alert('已经预约过了');
				else if(data=='logout') {
					var flag = confirm('请先登陆！');
					if(flag) window.location.href='${pageContext.request.contextPath}/jsp/login.jsp';
				}
			}, 'text');
		}
		//收藏函数
		function collectFunc(){
			if(<s:property value="#request.info.user.id"/>==<s:property value="#session.user.id"/>){
				alert('这是您自己的时间，无需收藏');return;
			}
			mui.post('collect.action',{
				itemId:'<s:property value="#request.info.id"/>',
				collectType:'timebank'
			},function(data) {
				if(data=='success') alert('收藏成功');
				else if(data=='fail') alert('收藏失败');
				else if(data=='collected') alert('已经收藏过了');
				else if(data=='login'){
					var flag = confirm('请先登陆！');
					if(flag) window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
				}
			}, 'text');
		}
	</script>
</body>
</html>