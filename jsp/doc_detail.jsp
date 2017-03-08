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
	height: 40px;
	line-height: 40px;
	padding: 0 10px;
}

.author {
	overflow: hidden;
}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">文档详情</h1>
		<a id='collect' class="mui-right mui-btn mui-btn-link mui-btn-nav mui-pull-right"
			style="color:white;">
			<span class="mui-icon mui-icon-star"></span>收藏
		</a>
	</header>
	<div class="mui-content">
		<h1>
			<s:property value="#request.doc.docTitle" />
		</h1>
		<div class="mui-content-padded clearfix">
			<a id='reading' href="#pdf_show" class="mui-btn mui-btn-positive ">
				<span class="mui-icon mui-icon-paperclip"></span>
				在线阅读
			</a>
			<a id='printBtn' class="mui-btn mui-btn-primary">云打印</a>
			<a id='downloadBtn' class="mui-btn mui-btn-primary">下载</a>
		</div>
		<div class="mui-content-padded">
			<div class="mui-media">
				<img class="mui-media-object mui-radius mui-pull-left"
					src="${pageContext.request.contextPath}/images/<s:property value="#request.doc.user.headPic"/>"
					width="60" height="60" alt="">
					<div class="mui-media-body">
						<p>
						<strong style="color:black;"><s:property value="#request.doc.user.userName" /></strong>
						<span class="mui-badge">上传:<s:property value="#request.doc.user.uploadedDocs.size()" /></span>
						</p>
						<p>
							上传时间：<s:property value="#request.doc.getFormatDocTime()" />
						</p>
					</div>
			</div>
			<h3 class="pdf-description">文档简介：</h3>
			<p>
				<s:property value="#request.doc.docDescription" />
			</p>
		</div>
	</div>
	<!--在线阅读modal-->
	<div id="pdf_show" class="mui-modal">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-icon mui-icon-close mui-pull-right" href="#pdf_show"></a>
			<h1 class="mui-title">
				<s:property value="#request.doc.docTitle" />
			</h1>
		</header>
		<div class="mui-content" style="height: 100%;">
			<iframe
				src="PDF/web/viewer.html?file=../pdf_sources/<s:property value="#request.doc.getDocRealName()"/>"
				width="100%" height="800"></iframe>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/mui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
		window.onload=function(){
			var collect = document.getElementById('collect');
			var download = document.getElementById('downloadBtn');
			var print = document.getElementById('printBtn');
			collect.addEventListener('tap',collectFunc);
			download.addEventListener('tap',downloadFunc);
			print.addEventListener('tap',printFunc);
		}
		//云打印事件
		function printFunc(){
			//确认收货地址
			var address = '<s:property value="#session.user.address"/>';
			address = address.trim();
			if(address == '') {
				var flag = confirm('您尚未设置有效的收货地址，请到个人中心设置');
				if(flag) window.location.href='${pageContext.request.contextPath}/personal.action';
				return;
			}
			//确认文档费用+打印费用
			var docPrice = 0;
			mui.post('print.action',{
					docId:<s:property value="#request.doc.id"/>,
					docTitle:'<s:property value="#request.doc.docTitle"/>',
					price:-1,
					authorId:<s:property value="#request.doc.user.id"/>
				},function(data){
					switch(data){
					case 'login':
						alert('请先登录');
						window.location.href='${pageContext.request.contextPath}/jsp/login.jsp';
						break;
					case 'fail':alert('订单提交出现异常，请稍后重试');
						break;
					case 'self':
					case 'downloaded':
					case 'price':
						if(data=='price') docPrice= <s:property value="#request.doc.docPayment"/>;
						var flag = confirm('需要支付'+docPrice+'时间币：下载费用 '+docPrice+'+打印费用0(活动),请确认');
						if(flag){
							mui.post('print.action',{
								docId:<s:property value="#request.doc.id"/>,
								docTitle:'<s:property value="#request.doc.docTitle"/>',
								price:docPrice,
								authorId:<s:property value="#request.doc.user.id"/>
							},function(data){
								switch(data){
								case 'no_points':alert('时间币不足，无法下载');
									break;
								case 'success':alert('订单提交成功，可前往个人中心查看');
									break;
								case 'fail':alert('订单提交出现异常，请稍后重试');
									break;
								case 'login':
									alert('请先登录');
									window.location.href='${pageContext.request.contextPath}/jsp/login.jsp';
									break;
								}
							},'text');
						}
						break;
					}
				},'text');
			if(flag){
				
			}
		}
		//收藏事件
		function collectFunc(){
			mui.post('collect.action',{
				itemId:'<s:property value="#request.doc.id"/>',
				collectType:'doc'
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
		//下载事件
		function downloadFunc(){
			mui.post('download.action',{
				price:-1,
				authorId:<s:property value="#request.doc.user.id"/>,
				docId:<s:property value="#request.doc.id"/>
			},function(data) {
				switch(data){
				case 'login':
					alert('请先登陆');
					window.location.href='${pageContext.request.contextPath}/jsp/login.jsp';
					break;
				case 'price':
					var flag = confirm("下载文档需要<s:property value="#request.doc.docPayment"/>时间币，确定下载并扣除时间币吗？");
					if(flag){
						mui.post('download.action',{
							price:<s:property value="#request.doc.docPayment"/>,
							authorId:<s:property value="#request.doc.user.id"/>,
							docId:<s:property value="#request.doc.id"/>
							},function(data){
								if(data=='no_points') alert("时间币不足，无法下载");
								else if(data=='fail') alert("扣除时间币时出现异常");
								else if(data=='success'){
									alert('时间币扣除成功，马上进行下载');
									window.location.href = '${pageContext.request.contextPath}/PDF/pdf_sources/<s:property value="#request.doc.getDocRealName()"/>';
								}
							},'text');
					}
					break;
				case 'url':
					var flag = confirm('确定下载吗？');
					if(flag){
						window.location.href = '${pageContext.request.contextPath}/PDF/pdf_sources/<s:property value="#request.doc.getDocRealName()"/>';
					}
					break;
				}
			}, 'text');
		}
	</script>
</body>
</html>